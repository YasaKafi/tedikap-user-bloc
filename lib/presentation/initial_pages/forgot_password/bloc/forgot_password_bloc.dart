import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/request/reset_password_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/reset_password_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/verify_otp_email_response_model.dart';

import '../../../../data/datasource/auth_datasource.dart';
import '../../../../data/models/response/otp_response_model.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthDatasource datasource;

  bool isLoadingEmailVerification = false;
  bool isTimerRunning = true;

  StreamSubscription? _timerSubscription;

  ForgotPasswordBloc(this.datasource) : super(const ForgotPasswordState.initial()) {

    on<_PostEmailVerificationFirst>((event, emit) async {
      emit(const ForgotPasswordState.loading());
      final result = await datasource.postOtpResetPass(event.email!);
      result.fold((l) async => emit(ForgotPasswordState.error(message: 'Failed get otp ')), (r) => emit(ForgotPasswordState.success(otpModel: r) )
      );
    });

    on<_VerifyOtp>((event, emit) async {
      emit(const ForgotPasswordState.loading());
      final result = await datasource.postVerifyOtp(event.email!, event.otp!);
      result.fold((l) async => emit(ForgotPasswordState.error(message: 'Failed get otp ')), (r) => emit(ForgotPasswordState.success(verifyOtpModel: r) )
      );
    });

    on<_PostResetPassword>((event, emit) async {
      emit(const ForgotPasswordState.loading());
      final result = await datasource.postResetPassword(event.model!);
      result.fold((l) async => emit(ForgotPasswordState.error(message: 'Failed get otp ')), (r) => emit(ForgotPasswordState.success(resetPasswordModel: r) )
      );
    });

    on<_PostEmailVerification>((event, emit) async {
      isLoadingEmailVerification = true;
      emit(const ForgotPasswordState.loading());
      final result = await datasource.postOtpResetPass(event.email!);
      isLoadingEmailVerification = false;
      result.fold(
              (l) async => emit(ForgotPasswordState.error(message: 'Failed to get otp')),
              (r) {
            emit(ForgotPasswordState.success(otpModel: r));
            // Mulai ulang timer setelah OTP berhasil dikirim
            add(ForgotPasswordEvent.startTimer());
          }
      );
    });

    on<_StartTimer>((event, emit) async {
      _timerSubscription?.cancel();
      final completer = Completer<void>();
      _timerSubscription = Stream.periodic(const Duration(seconds: 1), (i) => i)
          .take(2 * 60) // 5 menit
          .listen((secondsPassed) {
        emit(ForgotPasswordState.timerRunning(2 * 60 - secondsPassed, isTimerRunning: true));
      }, onDone: () {
        emit(ForgotPasswordState.timerRunning(0, isTimerRunning: false));
        completer.complete();
      });
      await completer.future;
    });
  }
}
