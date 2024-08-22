part of 'cart_reward_bloc.dart';

@freezed
class CartRewardEvent with _$CartRewardEvent {
  const factory CartRewardEvent.started() = _Started;
  const factory CartRewardEvent.getCart() = _GetCart;
  const factory CartRewardEvent.patchQty({required int? cartRewardItem, required String? action}) = _PatchQty;
  const factory CartRewardEvent.deleteItem({required int? cartItem}) = _DeleteItem;
  const factory CartRewardEvent.postOrder({
    required int? cartId,
    required void Function(String orderId) onOrderSuccess,
  }) = _PostOrder;
}
