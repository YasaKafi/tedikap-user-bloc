import 'package:flutter_bloc/flutter_bloc.dart';
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
      result.fold(
          (l) => emit(_Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(_Success(r)));
    }, transformer: droppable());

    on<_GetFilterCategory>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getFilterCategory(event.query);
      result.fold(
          (l) => emit(_Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(_Success(r)));
    }, transformer: droppable());

    on<_GetSearchCategory>((event, emit) async {
      emit((state as _Success).copyWith(isSearching: true));
      final result = await datasource.getFilterSearch(event.query);
      result.fold(
        (l) {
          if (l.contains(
              'Failed to access data: Exception: Failed to connect to the server.')) {
            emit(_Empty());
          } else {
            emit(_Error(
                message: 'Oops, something went wrong. Please try again later'));
          }
        },
        (r) {
          if (r.data!.isEmpty) {
            emit(_Empty());
          } else {
            emit(_Success(r, isSearching: true));
          }
        },
      );
    }, transformer: droppable());

    on<_TabSwitched>((event, emit) async {
      switch (event.index) {
        case 0:
          add(const MenuEvent.getProduct());
          break;
        case 1:
          add(const MenuEvent.getFilterCategory('tea'));
          break;
        case 2:
          add(const MenuEvent.getFilterCategory('nontea'));
          break;
        case 3:
          add(const MenuEvent.getFilterCategory('snack'));
          break;
      }
    }, transformer: droppable());
  }
}
