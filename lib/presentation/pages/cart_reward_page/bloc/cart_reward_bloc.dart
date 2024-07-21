import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/models/request/post_order_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_order_reward_response_model.dart';

import '../../../../data/datasource/cart_datasource.dart';
import '../../../../data/datasource/product_datasource.dart';
import '../../../../data/models/response/delete_cart_item_response_model.dart';
import '../../../../data/models/response/patch_qty_response_model.dart';

part 'cart_reward_event.dart';
part 'cart_reward_state.dart';
part 'cart_reward_bloc.freezed.dart';

class CartRewardBloc extends Bloc<CartRewardEvent, CartRewardState> {
  final CartDatasource cartDatasource;
  final ProductDatasource productDatasource;
  final OrderDatasource orderDatasource;
  CartRewardBloc({required this.cartDatasource, required this.productDatasource, required this.orderDatasource}) : super(const CartRewardState.initial()) {
    on<_GetCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.getCartReward();
      await result.fold((l) {
        emit(const _Error(message: 'Failed to access data order'));
      }, (cartRewardModel) async {
        if (cartRewardModel.cart?.cartItems != null) {
          final productDetails = await Future.wait(
            cartRewardModel.cart!.cartItems!.map((item) async {
              final productResult = await productDatasource.getDetailProductRewardByID(item.productId!);
              return productResult.fold((l) => null, (product) => product);
            }).toList(),
          );
          emit(_Success(cartModel: cartRewardModel, productDetails: productDetails, patchQtyModel: null, deleteModel: null, modelPostOrder: null));
        } else {
          emit(_Error(message: 'No items in cart'));
        }
      });
    });

    on<_PatchQty>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.patchQtyReward(event.action!, event.cartRewardItem!);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null, productDetails: null, patchQtyModel: r, deleteModel: null, modelPostOrder: null)));
    });

    on<_DeleteItem>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.deleteItemReward(event.cartItem);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null, productDetails: null, patchQtyModel: null, deleteModel: r, modelPostOrder: null)));
    });

    on<_PostOrder>((event, emit) async {
      emit(const _Loading());
      final result = await orderDatasource.postOrderReward(event.cartId!);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null, productDetails: null, patchQtyModel: null, deleteModel: null, modelPostOrder: r)));
    });
  }
}
