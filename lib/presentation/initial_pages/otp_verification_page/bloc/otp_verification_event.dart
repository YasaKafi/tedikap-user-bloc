part of 'otp_verification_bloc.dart';

@freezed
class OtpVerificationEvent with _$OtpVerificationEvent {
  const factory OtpVerificationEvent.startTimer() = _StartTimer;
  const factory OtpVerificationEvent.doRegister(RegisterRequestModel? data) = _DoRegister;
  const factory OtpVerificationEvent.postEmailVerification(String? email) = _PostEmailVerification;
}
