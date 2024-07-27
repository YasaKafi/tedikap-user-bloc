import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderDatasource datasource;
  OrderBloc(this.datasource) : super(const OrderState.initial()) {

    on<_GetAllHistoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrder();
        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(_Success(r, null, 0)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetAllHistoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrderReward();
        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(_Success(null, r, 1)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrder(event.query);
        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(_Success(r, null, 0)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrderReward(event.query);
        result.fold(
              (l) => emit(const _Error(message: 'Oops, something went wrong. Please try again later')),
              (r) => emit(_Success(null, r, 0)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_DoFilterOrder>((event, emit) async {
      emit(const OrderState.loading());
      final filterIndex = event.filterIndex;
      try {
        if (filterIndex == 0) {
          final result = await datasource.getFilterTypeOrder(event.query);
          emit(result.fold(
                (l) => const OrderState.error(message: 'Oops, something went wrong. Please try again later'),
                (r) => OrderState.success(r, null, filterIndex),
          ));
        } else {
          final result = await datasource.getFilterTypeOrderReward(event.query);
          emit(result.fold(
                (l) => const OrderState.error(message: 'Oops, something went wrong. Please try again later'),
                (r) => OrderState.success(null, r, filterIndex),
          ));
        }
      } catch (e) {
        emit(OrderState.error(message: e.toString()));
      }
    });
  }
}