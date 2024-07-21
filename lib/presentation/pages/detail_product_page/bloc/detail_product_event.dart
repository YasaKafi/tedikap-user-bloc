part of 'detail_product_bloc.dart';

@freezed
class DetailProductEvent with _$DetailProductEvent {
  const factory DetailProductEvent.started() = _Started;
  const factory DetailProductEvent.toggleTemp() = _ToggleTemperature;
  const factory DetailProductEvent.toggleSize() = _ToggleSize;
  const factory DetailProductEvent.toggleIce() = _ToggleIce;
  const factory DetailProductEvent.toggleSugar() = _ToggleSugar;
  const factory DetailProductEvent.decrement() = _Decrement;
  const factory DetailProductEvent.increment() = _Increment;
  const factory DetailProductEvent.getDetailProduct(int productId) = _GetDetailProduct;
  const factory DetailProductEvent.getDetailItemCart(int cartId) = _GetDetailItemCart;
  const factory DetailProductEvent.getDetailProductReward(int productRewardId) = _GetDetailProductReward;
  const factory DetailProductEvent.postCart(PostCartRequestModel? model) = _PostCart;
  const factory DetailProductEvent.postCartReward(PostCartRewardRequestModel? model) = _PostCartReward;
  const factory DetailProductEvent.updateCart(PostCartRequestModel? model, int? id) = _UpdateCart;
}
