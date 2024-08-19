part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.success(
    HistoryOrderResponseModel? model,
    HistoryOrderRewardResponseModel? modelReward,
    int filterIndex,
    PostReOrderResponseModel? modelPostReOrder,
    PostReOrderRewardResponseModel? modelReOrderReward,
      PostReviewResponseModel? modelReview,
      {
    bool? isPesananDitolak,
    bool? isPesananDibatalkan,
    bool? isPesananSelesai,
    DateTime? startDate,
    DateTime? endDate,
        //Filter Order Reward
    bool? isPesananDitolakReward,
    bool? isPesananSelesaiReward,
    DateTime? startDateReward,
    DateTime? endDateReward,

  }) = _Success;
  const factory OrderState.error({String? message}) = _Error;
}
