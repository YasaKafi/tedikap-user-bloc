part of 'detail_product_bloc.dart';

@freezed
class DetailProductState with _$DetailProductState {
  const factory DetailProductState.initial() = _Initial;
  const factory DetailProductState.loading() = _Loading;
  const factory DetailProductState.success(DetailProductResponseModel? model, DetailProductRewardResponseModel? modelReward, {@Default(false) bool isTempSelected, @Default('ice') String selectedTemp, @Default(false) bool isSizeSelected,
    @Default('regular') String selectedSize,
    @Default(false) bool isIceSelected,
    @Default('normal') String selectedIce,
    @Default(false) bool isSugarSelected,
    @Default('normal') String selectedSugar,}) = _Success;
  const factory DetailProductState.error({String? message}) = _Error;
}
