import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/products_response_model.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../data/datasource/product_datasource.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ProductDatasource datasource;
  MenuBloc(this.datasource) : super(const MenuState.initial()) {
    on<_GetProduct>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getAllProduct();
      result.fold((l) => emit(_Error(message: l)), (r) => emit(_Success(r)));
    }, transformer: droppable());

    on<_GetFilterCategory>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getFilterCategory(event.query);
      result.fold((l) => emit(_Error(message: l)), (r) => emit(_Success(r)));
    }, transformer: droppable());

    on<_GetSearchCategory>((event, emit) async {
      if (state is _Success) {
        emit((state as _Success).copyWith(isSearching: true)); // Update after fetching data
        final result = await datasource.getFilterSearch(event.query);
        result.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(r, isSearching: true)), // Keep isSearching true
        );
      }
    }, transformer: droppable());

  }
}

