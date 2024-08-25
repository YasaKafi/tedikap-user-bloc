part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.startTimer() = _StartTimer;
  const factory ForgotPasswordEvent.postEmailVerification(String? email) = _PostEmailVerification;
  const factory ForgotPasswordEvent.postEmailVerificationFirst(String? email) = _PostEmailVerificationFirst;
  const factory ForgotPasswordEvent.verifyOtp(String? email, String? otp) = _VerifyOtp;
  const factory ForgotPasswordEvent.postResetPassword(ResetPasswordRequestModel? model) = _PostResetPassword;
}
