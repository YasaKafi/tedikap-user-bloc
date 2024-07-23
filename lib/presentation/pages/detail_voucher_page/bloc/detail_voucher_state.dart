part of 'detail_voucher_bloc.dart';

@freezed
class DetailVoucherState with _$DetailVoucherState {
  const factory DetailVoucherState.initial() = _Initial;
  const factory DetailVoucherState.loading() = _Loading;
  const factory DetailVoucherState.success({
    DetailVoucherResponseModel? model,
  }) = _Success;
  const factory DetailVoucherState.error({String? message}) = _Error;
}
