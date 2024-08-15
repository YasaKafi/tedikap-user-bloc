part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = _Loading;
  const factory NotificationState.success(NotificationResponseModel? model, bool? isInformation, bool? isVoucher, {
    DateTime? startDate,
    DateTime? endDate,
  }) = _Success;
  const factory NotificationState.error(String? message) = _Error;
}
