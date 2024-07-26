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
        await result.fold((l) async {
          emit(_Error(message: 'Failed to access data product'));
        }, (favorite) async {
          if (favorite.data != null) {
            final productResult = await productDatasource.getAllProduct();
            final productDetails = productResult.fold((l) => null, (product) => product);

            final isLiked = result.fold((l) => false, (favorite) {
              if (favorite.data != null) {
                return favorite.data!.any((item) => item.productId == productDetails!.data!.map((itemProduct) => itemProduct.id));
              }
              return false;
            });

            emit(_Success(
                modelFavorite: favorite,
                isLiked: isLiked,
                modelProduct: productDetails));
          }
        });
      } catch (e) {
        emit(_Error(message: 'Failed to access data product $e'));
      }
    });

    on<_PostFavorite>((event, emit) async {
      final currentState = state;
      if (currentState is _Success) {
        emit(const _Loading());
        try {
          final response = await favoriteDatasource.postFavoriteProduct(event.productId!);
          await response.fold(
                (l) async {
              emit(_Error(message: l));
            },
                (r) async {
              final updatedFavoriteResult = await favoriteDatasource.getFavoriteProduct();
              final updatedProductResult = await productDatasource.getAllProduct();
              final updatedProductDetails = updatedProductResult.fold((l) => null, (product) => product);
              emit(currentState.copyWith(
                modelProduct: updatedProductDetails,
                modelFavorite: updatedFavoriteResult.fold((l) => null, (fav) => fav),
                modelPostFavorite: r,
                isLiked: r.message == 'Liked' ? true : false,
              ));
            },
          );
        } catch (e) {
          emit(_Error(message: 'An error occurred: $e'));
        }
      }
    });
  }
}
