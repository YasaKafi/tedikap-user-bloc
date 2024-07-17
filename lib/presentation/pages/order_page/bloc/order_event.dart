part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.getAllHistoryOrder() = _GetAllHistoryOrder;
  const factory OrderEvent.getAllHistoryOrderReward() = _GetAllHistoryOrderReward;
  const factory OrderEvent.doFilterOrder({required int filterIndex}) = _DoFilterOrder;
}
