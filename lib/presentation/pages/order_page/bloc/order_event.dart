part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.getAllHistoryOrder() = _GetAllHistoryOrder;
  const factory OrderEvent.getAllHistoryOrderReward() = _GetAllHistoryOrderReward;
  const factory OrderEvent.getFilterOrder(String query) = _GetCategoryOrder;
  const factory OrderEvent.getFilterOrderReward(String query) = _GetCategoryOrderReward;
  const factory OrderEvent.doFilterOrder({required int filterIndex, required String query}) = _DoFilterOrder;
}
