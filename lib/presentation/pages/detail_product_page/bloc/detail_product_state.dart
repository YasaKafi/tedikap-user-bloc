part of 'detail_product_bloc.dart';

@freezed
class DetailProductState with _$DetailProductState {
  const factory DetailProductState.initial() = _Initial;
  const factory DetailProductState.loading() = _Loading;
  const factory DetailProductState.success(DetailProductResponseModel? model, DetailProductRewardResponseModel? modelReward ) = _Success;
  const factory DetailProductState.error({String? message}) = _Error;
}
