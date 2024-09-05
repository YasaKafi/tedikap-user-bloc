// ignore_for_file: unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/request/post_order_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_payment_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/delete_cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_payment_response_model.dart';
import 'package:tedikap_user_bloc/data/repository/global_variabel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/datasource/cart_datasource.dart';
import '../../../../data/models/response/patch_qty_response_model.dart';
import '../../../../data/models/response/products_response_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartDatasource cartDatasource;
  final ProductDatasource productDatasource;
  final OrderDatasource orderDatasource;

  CartBloc(
      {required this.cartDatasource,
      required this.productDatasource,
      required this.orderDatasource})
      : super(const CartState.initial()) {

    on<_RefreshState>((event, emit) {
      emit(const CartState.initial());
    });

    on<_GetCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.getCart();
      result.fold((l) {
        emit(const _Error(message: 'Failed to access data cart'));
      },
          (r) => emit(_Success(
                cartModel: r,
                patchQtyModel: null,
                deleteModel: null,
                modelPostOrder: null,
                modelPostPayment: null,
                orderId: null,
              )));
    });

    Future<void> launchURL(Uri url) async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    on<_PostOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await orderDatasource.postOrder(event.modelOrder);
        await result.fold((l) {
          emit(const _Error(message: 'Failed doing order'));
        }, (postOrderModel) async {
          if (postOrderModel.order != null) {
            final cartId = postOrderModel.order!.id;
            final paymentResult = await orderDatasource.postPayment(cartId);
            final paymentDetails =
            paymentResult.fold((l) => null, (payment) => payment);
            if (paymentDetails != null) {
              GlobalVariables.linkCheckoutGlobal = paymentDetails.checkoutLink;
              final url = Uri.parse(paymentDetails.checkoutLink!);
              await launchURL(url);
            }
            await paymentResult.fold((l) => null, (r) async {
              emit(_Success(
                cartModel: null,
                patchQtyModel: null,
                deleteModel: null,
                modelPostOrder: postOrderModel,
                modelPostPayment: paymentDetails,
                orderId: r.orderId,
              ));

              print("Order Success, Order ID: ${r.orderId}, Checkout Link: ${r.checkoutLink}");

              // Lakukan routing di sini menggunakan context dari event
              event.onOrderSuccess(r.orderId!, r.checkoutLink!);

            });
          } else {
            emit(const _Error(message: 'No items in cart'));
          }
        });
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });


    on<_PatchQty>((event, emit) async {
      final currentState = state;

      if (currentState is _Success){
        emit(_Loading(
          cartModel: currentState.cartModel,
          isPatchQTyLoading: true
        ));

        final result =
        await cartDatasource.patchQty(event.action!, event.cartItem!);
        await result.fold(
              (l) async => emit(const _Error(message: 'Failed to access data order')),
              (r) async {
            final updatedCart = await cartDatasource.getCart();
            final resultUpdatedCart = updatedCart.fold((l) => null, (success) => success);

            emit(_Success(cartModel: resultUpdatedCart, patchQtyModel: r, deleteModel: null, modelPostOrder: null, modelPostPayment: null, orderId: ''));
          },
        );
      }
    });


    on<_DeleteItem>((event, emit) async {
      final currentState = state;

      // Emit loading state
      emit(const _Loading());

      if (currentState is! _Success) {
        emit(const _Error(message: 'Unexpected state type'));
        return;
      }

      final result = await cartDatasource.deleteItem(event.cartItem);
      await result.fold(
            (l) async => emit(const _Error(message: 'Failed to access data order')),
            (r) async {
          final updatedCart = await cartDatasource.getCart();
          updatedCart.fold(
                (failure) =>
                emit(const _Error(message: 'Failed to fetch updated cart')),
                (updatedData) => emit(
                currentState.copyWith(deleteModel: r, cartModel: updatedData)),
          );
        },
      );
    });

  }
}
