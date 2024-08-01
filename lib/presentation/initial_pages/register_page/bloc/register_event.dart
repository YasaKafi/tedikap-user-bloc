part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
  const factory RegisterEvent.doRegister(RegisterRequestModel? data) = _DoRegister;
  const factory RegisterEvent.doUpdateFcm(String? fcmToken) = _DoUpdateFcm;
}
