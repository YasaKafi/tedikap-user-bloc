import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_reorder_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_reorder_reward_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderDatasource datasource;
  final CartDatasource cartDatasource;

  OrderBloc(this.datasource, this.cartDatasource) : super(const OrderState.initial()) {
    on<_GetAllHistoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrder();
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(OrderState.success(r, null, 0, null, null, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_PostReOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.postReOrder(event.orderId!);
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(OrderState.success(null, null, 0, r, null, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_PostReOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.postReOrderReward(event.orderRewardId!);
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(OrderState.success(null, null, 0, null, r, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetAllHistoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrderReward();
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(OrderState.success(null, r, 1, null, null, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrder(event.query);
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        await result.fold(
              (l) async => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) async => emit(OrderState.success(r, null, 0, null, null, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrderReward(event.query);
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        await result.fold(
              (l) async => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) async => emit(OrderState.success(null, r, 0, null, null, resultCart, resultCartReward)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_DoFilterOrder>((event, emit) async {
      emit(const OrderState.loading());
      final filterIndex = event.filterIndex;
      try {
        final cart = await cartDatasource.getCart();
        final cartReward = await cartDatasource.getCartReward();

        final resultCart = cart.fold((l) => null, (success) => success);
        final resultCartReward = cartReward.fold((l) => null, (success) => success);

        if (filterIndex == 0) {
          final result = await datasource.getFilterTypeOrder(event.query);
          emit(result.fold(
                (l) => const OrderState.error(message: 'Oops, something went wrong. Please try again later'),
                (r) => OrderState.success(r, null, filterIndex, null, null, resultCart, resultCartReward),
          ));
        } else {
          final result = await datasource.getFilterTypeOrderReward(event.query);
          emit(result.fold(
                (l) => const OrderState.error(message: 'Oops, something went wrong. Please try again later'),
                (r) => OrderState.success(null, r, filterIndex, null, null, resultCart, resultCartReward),
          ));
        }
      } catch (e) {
        emit(OrderState.error(message: e.toString()));
      }
    });
  }
}
