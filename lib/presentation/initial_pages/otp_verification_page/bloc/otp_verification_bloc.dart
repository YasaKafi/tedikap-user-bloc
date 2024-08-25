import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/auth_datasource.dart';
import '../../../../data/models/request/register_request_model.dart';
import '../../../../data/models/response/otp_response_model.dart';
import '../../../../data/models/response/register_response_model.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';
part 'otp_verification_bloc.freezed.dart';

class OtpVerificationBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final AuthDatasource datasource;

  bool isLoadingEmailVerification = false;
  bool isTimerRunning = true;

  StreamSubscription? _timerSubscription;

  OtpVerificationBloc(this.datasource) : super(const OtpVerificationState.initial()) {
    on<_DoRegister>((event, emit) async {
      emit(const OtpVerificationState.loading());
      final result = await datasource.postRegister(event.data!);
      result.fold(
              (l) async => emit(OtpVerificationState.error(message: l)),
              (r) => emit(OtpVerificationState.success(model: r, otpModel: null))
      );
    });

    on<_PostEmailVerification>((event, emit) async {
      isLoadingEmailVerification = true;
      emit(const OtpVerificationState.loading());
      final result = await datasource.postOtpRegister(event.email!);
      isLoadingEmailVerification = false;
      result.fold(
              (l) async => emit(OtpVerificationState.error(message: l)),
              (r) {
            emit(OtpVerificationState.success(model: null, otpModel: r));
            // Mulai ulang timer setelah OTP berhasil dikirim
            add(const OtpVerificationEvent.startTimer());
          }
      );
    });

    on<_StartTimer>((event, emit) async {
      _timerSubscription?.cancel();
      final completer = Completer<void>();
      _timerSubscription = Stream.periodic(const Duration(seconds: 1), (i) => i)
          .take(5 * 60) // 5 minutes
          .listen((secondsPassed) {
        emit(OtpVerificationState.timerRunning(5 * 60 - secondsPassed, isTimerRunning: true));
      }, onDone: () {
        emit(const OtpVerificationState.timerRunning(0, isTimerRunning: false));
        completer.complete();
      });
      await completer.future;
    });
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
