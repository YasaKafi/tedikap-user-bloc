part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.getAllHistoryOrder() = _GetAllHistoryOrder;
  const factory OrderEvent.postReview(String? orderId, PostReviewRequestModel? model) = _PostReview;
  const factory OrderEvent.postReOrder(String? orderId) = _PostReOrder;
  const factory OrderEvent.postReOrderReward(String? orderRewardId) = _PostReOrderReward;
  const factory OrderEvent.getAllHistoryOrderReward() = _GetAllHistoryOrderReward;
  const factory OrderEvent.getFilterOrder(String query, String? statusOrder, String? startDate, String? endDate) = _GetCategoryOrder;
  const factory OrderEvent.getFilterOrderReward(String query, String? statusOrder, String? startDate, String? endDate) = _GetCategoryOrderReward;
  const factory OrderEvent.doFilterOrder({required int filterIndex, required String query, String? statusOrder, String? startDate, String? endDate}) = _DoFilterOrder;
  const factory OrderEvent.togglePesananDitolak(bool? newValue, ) = _ToggleDitolak;
  const factory OrderEvent.togglePesananDitolakReward(bool? newValue, ) = _ToggleDitolakReward;
  const factory OrderEvent.togglePesananDibatalkan(bool? newValue, ) = _ToggleDibatalkan;
  const factory OrderEvent.togglePesananSelesai(bool? newValue, ) = _ToggleSelesai;
  const factory OrderEvent.togglePesananSelesaiReward(bool? newValue, ) = _ToggleSelesaiReward;
  const factory OrderEvent.setStartDate(DateTime date) = _SetStartDate;
  const factory OrderEvent.setStartDateReward(DateTime date) = _SetStartDateReward;
  const factory OrderEvent.setEndDate(DateTime date) = _SetEndDate;
  const factory OrderEvent.setEndDateReward(DateTime date) = _SetEndDateReward;
  const factory OrderEvent.resetFilters(String query) = _ResetFilters;

}
