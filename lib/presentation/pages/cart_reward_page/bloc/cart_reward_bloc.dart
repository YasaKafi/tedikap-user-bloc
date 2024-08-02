import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/user_datasource.dart';
import 'package:tedikap_user_bloc/data/models/request/post_order_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/user_point_response_model.dart';

import '../../../../data/datasource/cart_datasource.dart';
import '../../../../data/datasource/product_datasource.dart';
import '../../../../data/models/response/delete_cart_item_response_model.dart';
import '../../../../data/models/response/patch_qty_response_model.dart';

part 'cart_reward_event.dart';
part 'cart_reward_state.dart';
part 'cart_reward_bloc.freezed.dart';

class CartRewardBloc extends Bloc<CartRewardEvent, CartRewardState> {
  final CartDatasource cartDatasource;
  final UserDatasource userDatasource;
  final ProductDatasource productDatasource;
  final OrderDatasource orderDatasource;
  CartRewardBloc({required this.cartDatasource, required this.productDatasource, required this.orderDatasource, required this.userDatasource}) : super(const CartRewardState.initial()) {
    on<_GetCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.getCartReward();
       await result.fold((l) async {
        emit(const _Error(message: 'Failed to access data order'));
      }, (r) async  {
         if (r.cart != null) {
           final result = await userDatasource.getPointUser();
           final resultPoint = result.fold((l) => null, (success) => success);
           emit(_Success(cartModel: r, patchQtyModel: null, deleteModel: null, modelPostOrder: null, modelPoint: resultPoint));
         }
      });
    });

    on<_PatchQty>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.patchQtyReward(event.action!, event.cartRewardItem!);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null,  patchQtyModel: r, deleteModel: null, modelPostOrder: null, modelPoint: null)));
    });

    on<_DeleteItem>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.deleteItemReward(event.cartItem);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null,  patchQtyModel: null, deleteModel: r, modelPostOrder: null, modelPoint: null)));
    });

    on<_PostOrder>((event, emit) async {
      emit(const _Loading());
      final result = await orderDatasource.postOrderReward(event.cartId!);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null,  patchQtyModel: null, deleteModel: null, modelPostOrder: r, modelPoint: null)));
    });
  }
}
