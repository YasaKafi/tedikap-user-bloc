import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/request/register_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/register_response_model.dart';

import '../../../../data/datasource/auth_datasource.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;
  RegisterBloc(this.datasource) : super(const RegisterState.initial()) {
    on<_DoRegister>((event, emit) async {
      emit(const RegisterState.loading());
      final result = await datasource.postRegister(event.data!);
      result.fold((l) => emit(RegisterState.error(message: 'Failed to login')), (r) => emit(RegisterState.success(model: r)));
    });

    on<_DoUpdateFcm>((event, emit) async {
      emit(const RegisterState.loading());
      final result = await datasource.putFCMToken(event.fcmToken!);
      result.fold((l) => emit(RegisterState.error(message: 'Failed to Update FCM')), (r) => emit(RegisterState.success(model: null,)));
    });
  }
}
