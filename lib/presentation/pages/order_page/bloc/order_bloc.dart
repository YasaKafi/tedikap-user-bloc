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
      final result = await datasource.getAllHistoryOrder();
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(r, null , 0)));
    });

    on<_GetAllHistoryOrderReward>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getAllHistoryOrderReward();
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(null, r, 1)));
    });

    on<_DoFilterOrder>((event, emit) async {
      emit(const OrderState.loading());
      final filterIndex = event.filterIndex;
      if (filterIndex == 0) {
        final result = await datasource.getAllHistoryOrder();
        emit(result.fold(
              (l) => OrderState.error(message: 'Failed to access data order'),
              (r) => OrderState.success(r, null, filterIndex),
        ));
      } else {
        final result = await datasource.getAllHistoryOrderReward();
        emit(result.fold(
              (l) => OrderState.error(message: 'Failed to access data order'),
              (r) => OrderState.success(null, r, filterIndex),
        ));
      }
    });


  }

}
