import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/products_response_model.dart';

import '../../../../data/datasource/favorite_datasource.dart';
import '../../../../data/models/response/check_if_favorite_response_model.dart';
import '../../../../data/models/response/favorite_response_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteDatasource favoriteDatasource;
  final ProductDatasource productDatasource;

  FavoriteBloc(this.favoriteDatasource, this.productDatasource)
      : super(const FavoriteState.initial()) {

    on<_GetFavoriteProduct>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await favoriteDatasource.getFavoriteProduct();
        result.fold((l) {
          emit(_Error(message: 'Oops, something went wrong. Please try again later'));
        }, (r)  {
          emit(_Success(
            modelFavorite: r,
            modelPostFavorite: null,
          ));
        });
      } catch (e) {
        emit(_Error(message: 'Failed to access data product $e'));
      }
    });

    on<_PostFavorite>((event, emit) async {
      print('Event _PostFavorite received, emitting loading state');
      emit(const _Loading()); // Emit loading state before async operations
      try {
        final response = await favoriteDatasource.postFavoriteProduct(event.productId!);
        await response.fold(
              (l) async {
            emit(_Error(message: l));
          },
              (r) async {
                print('Successfully posted favorite, fetching updated favorites');
            final updatedFavoriteResult = await favoriteDatasource.getFavoriteProduct();
            final updatedFavorites = updatedFavoriteResult.fold((l) => null, (fav) => fav);
            print('Updated favorites fetched, emitting success state');
            emit(_Success(
              modelFavorite: updatedFavorites,
              modelPostFavorite: r,
            ));
          },
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });
  }
}

