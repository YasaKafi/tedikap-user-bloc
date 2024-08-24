part of 'otp_verification_bloc.dart';

@freezed
class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState.initial() = _Initial;
  const factory OtpVerificationState.loading({@Default(false) bool isEmailVerificationLoading}) = _Loading;
  const factory OtpVerificationState.success({RegisterResponseModel? model, OtpResponseModel? otpModel}) = _Success;
  const factory OtpVerificationState.error({String? message}) = _Error;
  const factory OtpVerificationState.timerRunning(int secondsLeft, {@Default(true) bool isTimerRunning}) = _TimerRunning;
}
