import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_reward_response_model.dart';
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

  CartRewardBloc({
    required this.cartDatasource,
    required this.productDatasource,
    required this.orderDatasource,
  }) : super(const CartRewardState.initial()) {

    on<_GetCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.getCartReward();
      await result.fold(
            (l) async {
          emit(const _Error(message: 'Failed to access data order'));
        },
            (r) async {
          emit(_Success(
            cartModel: r,
            patchQtyModel: null,
            deleteModel: null,
            modelPostOrder: null,
          ));
        },
      );
    });

    on<_PatchQty>((event, emit) async {
      final currentState = state;
      emit(const _Loading());
      if (currentState is! _Success) {
        emit(const _Error(message: 'Unexpected state type'));
        return;
      }
      final result = await cartDatasource.patchQtyReward(event.action!, event.cartRewardItem!);
      await result.fold(
            (l) async => emit(const _Error(message: 'Failed to access data order')),
            (r) async {
          final updatedCart = await cartDatasource.getCartReward();
          updatedCart.fold(
                (l) => null,
                (success) => emit(currentState.copyWith(patchQtyModel: r, cartModel: success)),
          );
        },
      );
    });

    on<_DeleteItem>((event, emit) async {
      final currentState = state;
      emit(const _Loading());
      if (currentState is! _Success) {
        emit(const _Error(message: 'Unexpected state type'));
        return;
      }
      final result = await cartDatasource.deleteItemReward(event.cartItem);
      await result.fold(
            (l) async => emit(const _Error(message: 'Failed to access data order')),
            (r) async {
          final updatedCart = await cartDatasource.getCartReward();
          updatedCart.fold(
                (failure) => emit(const _Error(message: 'Failed to fetch updated cart')),
                (updatedData) => emit(currentState.copyWith(deleteModel: r, cartModel: updatedData)),
          );
        },
      );
    });

    on<_PostOrder>((event, emit) async {
      emit(const _Loading());
      final result = await orderDatasource.postOrderReward(event.cartId!);

      result.fold(
            (l) => emit(const _Error(message: 'Failed to access data order')),
            (r) {
          emit(_Success(
            cartModel: null,
            patchQtyModel: null,
            deleteModel: null,
            modelPostOrder: r,
          ));
          // Pastikan onOrderSuccess dipanggil di luar `emit`
          if (r.order != null) {
            event.onOrderSuccess(r.order!.id!);
          }
        },
      );
    });
  }
}
