part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading({
    @Default(false) bool isPatchQTyLoading,
    CartResponseModel? cartModel
  }) = _Loading;
  const factory CartState.success(
      {required CartResponseModel? cartModel, required PatchQtyResponseModel? patchQtyModel, required DeleteCartItemResponseModel? deleteModel, required PostOrderResponseModel? modelPostOrder, required PostPaymentResponseModel? modelPostPayment, required String? orderId,}) = _Success;
  const factory CartState.error({String? message}) = _Error;

}
