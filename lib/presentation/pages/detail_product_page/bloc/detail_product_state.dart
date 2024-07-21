part of 'detail_product_bloc.dart';

@freezed
class DetailProductState with _$DetailProductState {
  const factory DetailProductState.initial() = _Initial;
  const factory DetailProductState.loading() = _Loading;
  const factory DetailProductState.success({
      required DetailProductResponseModel? model,
    required DetailProductRewardResponseModel? modelReward,
    required PostCartResponseModel? modelCartPost,
    required PostCartRewardResponseModel? modelCartRewardPost,
    required CartItemResponseModel? modelCartItem,
    required UpdateCartResponseModel? modelCartUpdate,
    @Default(false) bool isTempSelected,
    @Default('ice') String selectedTemp,
    @Default(false) bool isSizeSelected,
    @Default('regular') String selectedSize,
    @Default(false) bool isIceSelected,
    @Default('normal') String selectedIce,
    @Default(false) bool isSugarSelected,
    @Default('normal') String selectedSugar,
    @Default(1) int quantityCount,
    @Default(0) int totalPrice,
    @Default('') String note,
      }
      ) = _Success;
  const factory DetailProductState.error({String? message}) = _Error;
}

