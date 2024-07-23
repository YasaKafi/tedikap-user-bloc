part of 'voucher_bloc.dart';

@freezed
class VoucherEvent with _$VoucherEvent {
  const factory VoucherEvent.started() = _Started;
  const factory VoucherEvent.getVoucher() = _GetVoucher;
  const factory VoucherEvent.getCart() = _GetCart;
  const factory VoucherEvent.applyVoucher(int? voucherId) = _ApplyVoucher;
  const factory VoucherEvent.removeVoucher(int? voucherId) = _RemoveVoucher;
}
