part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.postEmailVerification(String? email) = _PostEmailVerification;
  const factory RegisterEvent.doRegister(RegisterRequestModel? data) = _DoRegister;
}
