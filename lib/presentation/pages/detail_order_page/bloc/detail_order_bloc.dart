import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_history_order_reward_response_model.dart';

import '../../../../data/datasource/order_datasource.dart';

part 'detail_order_event.dart';
part 'detail_order_state.dart';
part 'detail_order_bloc.freezed.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  final OrderDatasource datasource;
  DetailOrderBloc(this.datasource) : super(const DetailOrderState.initial()) {
    on<_GetDetailHistoryOrder>((event, emit) async {
      if (state is _Success && (state as _Success).model != null) {
        return;
      }

      emit(const _Loading());
      final result = await datasource.getDetailHistoryOrder(event.orderId);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(r, null)));
    });
    on<_GetDetailHistoryOrderReward>((event, emit) async {
      // Cek apakah data sudah ada di dalam state atau belum
      if (state is _Success && (state as _Success).modelReward != null) {
        return;
      }

      emit(const _Loading());
      final result = await datasource.getDetailHistoryOrderReward(event.orderRewardId);
      result.fold((l) => emit(const _Error(message: 'Failed to access data order')), (r) => emit(_Success(null, r)));
    });
  }
}
