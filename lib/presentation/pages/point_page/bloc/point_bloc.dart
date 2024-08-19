import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/user_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/products_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/user_point_response_model.dart';

import '../../../../data/datasource/product_datasource.dart';

part 'point_event.dart';
part 'point_state.dart';
part 'point_bloc.freezed.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final ProductDatasource datasource;
  final UserDatasource userDatasource;

  PointBloc(this.datasource, this.userDatasource)
      : super(const PointState.initial()) {


    on<_GetFilterCategory>((event, emit) async {
      emit(const _Loading());


        final pointResult = await userDatasource.getPointUser();
        final points = pointResult.fold((l) => null, (success) => success);


      final productResult = await datasource.getFilterCategoryReward(event.query);
      productResult.fold(
            (l) => emit(const _Error(message: 'Failed to access data product')),
            (r) => emit(_Success(r, points)),
      );
    });

    // on<_GetPointUser>((event, emit) async {
    //   final result = await userDatasource.getPointUser();
    //   result.fold((l) => emit(const _Error(message: 'Failed to get data user')), (r) => emit(_Success(null, r)));
    // });
    //
    // on<_GetFilterCategory>((event, emit) async {
    //   emit(const _Loading());
    //   final productResult = await datasource.getFilterCategoryReward(event.query);
    //   productResult.fold((l) => emit(const _Error(message: 'Failed to get data user')), (r) => emit(_Success(r, null)));
    // });
  }
}
