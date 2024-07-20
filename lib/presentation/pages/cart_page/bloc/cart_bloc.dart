import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/delete_cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';

import '../../../../data/datasource/cart_datasource.dart';
import '../../../../data/models/response/patch_qty_response_model.dart';
import '../../../../data/models/response/products_response_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartDatasource cartDatasource;
  final ProductDatasource productDatasource;
  CartBloc({required this.cartDatasource, required this.productDatasource}) : super(const CartState.initial()) {
    on<_GetCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.getCart();
      await result.fold((l) {
        emit(const _Error(message: 'Failed to access data order'));
      }, (cartModel) async {
        if (cartModel.cart?.cartItems != null) {
          final productDetails = await Future.wait(
            cartModel.cart!.cartItems!.map((item) async {
              final productResult = await productDatasource.getDetailProductByID(item.productId!);
              return productResult.fold((l) => null, (product) => product);
            }).toList(),
          );
          emit(_Success(cartModel: cartModel, productDetails: productDetails, patchQtyModel: null, deleteModel: null));
        } else {
          emit(_Error(message: 'No items in cart'));
        }
      });
    });
    
    on<_PatchQty>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.patchQty(event.action!, event.cartItem!);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null, productDetails: null, patchQtyModel: r, deleteModel: null)));
    });

    on<_DeleteItem>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.deleteItem(event.cartItem);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(cartModel: null, productDetails: null, patchQtyModel: null, deleteModel: r)));
    });
  }
}
