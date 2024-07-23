part of 'detail_voucher_bloc.dart';

@freezed
class DetailVoucherEvent with _$DetailVoucherEvent {
  const factory DetailVoucherEvent.started() = _Started;
  const factory DetailVoucherEvent.getDetailVoucher(int? id) = _GetDetailVoucher;
}
