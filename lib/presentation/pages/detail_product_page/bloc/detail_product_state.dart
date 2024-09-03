part of 'detail_product_bloc.dart';

@freezed
class DetailProductState with _$DetailProductState {
  const factory DetailProductState.initial() = _Initial;
  const factory DetailProductState.loading({
    @Default(false) bool isPostCartLoading,
    @Default(false) bool isPostFavorite,
    DetailProductResponseModel? model,
    DetailProductRewardResponseModel? modelReward,
    @Default('ice') String selectedTemp,
    @Default('regular') String selectedSize,
    @Default('normal') String selectedIce,
    @Default('normal') String selectedSugar,
    @Default(1) int quantityCount,
    @Default(0) int totalPrice,
    @Default('') String note,
    CartItemResponseModel? modelCartItem,
    CartItemRewardResponseModel? modelCartItemReward,

  }) = _Loading;
  const factory DetailProductState.success({
       DetailProductResponseModel? model,
     DetailProductRewardResponseModel? modelReward,
     PostCartResponseModel? modelCartPost,
     PostCartRewardResponseModel? modelCartRewardPost,
     CartItemResponseModel? modelCartItem,
     UpdateCartResponseModel? modelCartUpdate,
     CartItemRewardResponseModel? modelCartItemReward,
     UpdateCartRewardResponseModel? modelCartRewardUpdate,
     PostFavoriteResponseModel? modelPostFavorite,
     FavoriteResponseModel? modelFavorite,
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

