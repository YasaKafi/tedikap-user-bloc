part of 'voucher_bloc.dart';

@freezed
class VoucherState with _$VoucherState {
  const factory VoucherState.initial() = _Initial;
  const factory VoucherState.loading() = _Loading;
  const factory VoucherState.success({
   required VoucherActiveResponseModel? modelVoucher,
    required CartResponseModel? modelCart,
    required VoucherAppliedRemoveResponseModel? modelVoucherAppliedRemove,
    @Default(false) bool isUseVoucher,

  }) = _Success;
  const factory VoucherState.error({String? message}) = _Error;
}
