import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';

import '../../../../data/datasource/user_datasource.dart';
import '../../../../data/models/response/current_user_response_model.dart';
import '../../../../data/models/response/products_response_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserDatasource datasource;
  final ProductDatasource productDatasource;
  HomeBloc({required this.datasource,  required this.productDatasource}) : super(const HomeState.initial()) {
    on<_ChangeIndex>((event, emit) {
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(newIndex: event.index));
      }
    });

    on<_GetUser>((event, emit) async {
        emit(const _Loading());
        final result = await datasource.getCurrentUser();
        result.fold((l) => emit(const _Error(message: 'Failed to get user')), (r) => emit(_Success(user: r)));

    });

    on<_GetProduct>((event, emit) async {
      if (state is _Success) {
        // Allow product fetch even if user is loaded
        final result = await productDatasource.getAllProduct();
        result.fold(
                (l) => emit(_Error(message: 'Failed to access data product')),
                (r) => emit((state as _Success).copyWith(model: r)) // Update products in _Success state
        );
      }
    });
  }
}