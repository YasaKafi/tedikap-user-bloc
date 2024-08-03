part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.getCart() = _GetCart;
  const factory CartEvent.patchQty({required int? cartItem, required String? action}) = _PatchQty;
  const factory CartEvent.deleteItem({required int? cartItem}) = _DeleteItem;
  const factory CartEvent.postOrder({required PostOrderRequestModel modelOrder, required void Function(String orderId, String linkCheckout) onOrderSuccess,}) = _PostOrder;
  const factory CartEvent.postPayment({required String? cartId}) = _PostPayment;

}
