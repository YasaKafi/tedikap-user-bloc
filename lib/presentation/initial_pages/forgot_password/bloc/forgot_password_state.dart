part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.success({ResetPasswordResponseModel? resetPasswordModel, OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel}) = _Success;
  const factory ForgotPasswordState.error({String? message}) = _Error;
  const factory ForgotPasswordState.timerRunning(int secondsLeft, {@Default(true) bool isTimerRunning}) = _TimerRunning;
}
