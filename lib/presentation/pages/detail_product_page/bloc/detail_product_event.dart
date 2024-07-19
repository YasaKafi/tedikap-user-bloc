part of 'detail_product_bloc.dart';

@freezed
class DetailProductEvent with _$DetailProductEvent {
  const factory DetailProductEvent.started() = _Started;
  const factory DetailProductEvent.getDetailProduct(int productId) = _GetDetailProduct;
  const factory DetailProductEvent.getDetailProductReward(int productRewardId) = _GetDetailProductReward;
}
