import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';
part 'detail_product_bloc.freezed.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final ProductDatasource datasource;
  DetailProductBloc(this.datasource) : super(const DetailProductState.initial()) {
    on<_GetDetailProduct>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getDetailProductByID(event.productId);
      response.fold(
        (l) => emit(_Error(message: l)),
        (r) => emit(_Success(r, null)),
      );
    });
    on<_GetDetailProductReward>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getDetailProductRewardByID(event.productRewardId);
      response.fold(
            (l) => emit(_Error(message: l)),
            (r) => emit(_Success(null, r)),
      );
    });
  }
}
