part of 'detail_order_bloc.dart';

@freezed
class DetailOrderState with _$DetailOrderState {
  const factory DetailOrderState.initial() = _Initial;
  const factory DetailOrderState.loading() = _Loading;
  const factory DetailOrderState.success(DetailHistoryOrderResponseModel? model, DetailHistoryOrderRewardResponseModel? modelReward ) = _Success;
  const factory DetailOrderState.error({String? message}) = _Error;
}
