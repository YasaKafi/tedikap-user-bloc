part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotification() = _GetNotification;
  const factory NotificationEvent.getFilterNotification(String type, String startDate, String endDate) = _GetFilterNotification;
  const factory NotificationEvent.toggleInfo(bool? newValue, bool? newValueFilter) = _ToggleInfo;
  const factory NotificationEvent.toggleVoucher(bool? newValue, bool? newValueFilter) = _ToggleVoucher;
  const factory NotificationEvent.setStartDate(DateTime date) = _SetStartDate;
  const factory NotificationEvent.setEndDate(DateTime date) = _SetEndDate;
  const factory NotificationEvent.applyFilters() = _ApplyFilters;
  const factory NotificationEvent.resetFilters() = _ResetFilters;
}
