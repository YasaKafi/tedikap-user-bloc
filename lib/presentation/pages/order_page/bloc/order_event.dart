part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.started() = _Started;
  const factory OrderEvent.getAllHistoryOrder() = _GetAllHistoryOrder;
  const factory OrderEvent.postReOrder(String? orderId) = _PostReOrder;
  const factory OrderEvent.postReOrderReward(String? orderRewardId) = _PostReOrderReward;
  const factory OrderEvent.getAllHistoryOrderReward() = _GetAllHistoryOrderReward;
  const factory OrderEvent.getFilterOrder(String query, String? statusOrder) = _GetCategoryOrder;
  const factory OrderEvent.getFilterOrderReward(String query, String? statusOrder) = _GetCategoryOrderReward;
  const factory OrderEvent.doFilterOrder({required int filterIndex, required String query, String? statusOrder}) = _DoFilterOrder;
  const factory OrderEvent.toggleMenungguPembayaran(bool? newValue, ) = _ToggleMenungguPembayaran;
  const factory OrderEvent.toggleMenungguKonfirmasi(bool? newValue, ) = _ToggleMenungguKonfirmasi;
  const factory OrderEvent.togglePesananDiproses(bool? newValue, ) = _ToggleDiproses;
  const factory OrderEvent.togglePesananSiapDiambil(bool? newValue, ) = _ToggleSiapDiambil;
  const factory OrderEvent.togglePesananDitolak(bool? newValue, ) = _ToggleDitolak;
  const factory OrderEvent.togglePesananDibatalkan(bool? newValue, ) = _ToggleDibatalkan;
  const factory OrderEvent.togglePesananSelesai(bool? newValue, ) = _ToggleSelesai;
}
