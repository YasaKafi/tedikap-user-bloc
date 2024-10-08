part of 'cart_reward_bloc.dart';

@freezed
class CartRewardState with _$CartRewardState {
  const factory CartRewardState.initial() = _Initial;
  const factory CartRewardState.loading({
    @Default(false) bool isPatchQTyLoading,
    CartRewardResponseModel? cartModel
  }) = _Loading;
  const factory CartRewardState.success(
      {required CartRewardResponseModel? cartModel, required PatchQtyResponseModel? patchQtyModel, required DeleteCartItemResponseModel? deleteModel, required PostOrderRewardResponseModel? modelPostOrder, }) = _Success;
  const factory CartRewardState.error({String? message}) = _Error;
}
