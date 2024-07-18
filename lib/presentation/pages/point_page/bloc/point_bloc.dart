import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/products_reward_response_model.dart';

import '../../../../data/datasource/product_datasource.dart';

part 'point_event.dart';
part 'point_state.dart';
part 'point_bloc.freezed.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final ProductDatasource datasource;
  PointBloc(this.datasource) : super(const PointState.initial()) {
    on<_GetProduct>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getAllProductReward();
      result.fold((l) => emit(const _Error(message: 'Failed to access data product')), (r) => emit(_Success(r)));
    });

    on<_GetFilterCategory>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getFilterCategoryReward(event.query);
      result.fold((l) => emit(const _Error(message: 'Failed to access data product')), (r) => emit(_Success(r)));
    });
  }
}
