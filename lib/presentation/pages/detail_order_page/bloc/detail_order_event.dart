part of 'detail_order_bloc.dart';

@freezed
class DetailOrderEvent with _$DetailOrderEvent {
  const factory DetailOrderEvent.started() = _Started;
  const factory DetailOrderEvent.getDetailHistoryOrder(String orderId) = _GetDetailHistoryOrder;
  const factory DetailOrderEvent.getDetailHistoryOrderReward(String orderRewardId) = _GetDetailHistoryOrderReward;
}
