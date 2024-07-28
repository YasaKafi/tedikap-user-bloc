import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/favorite_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/favorite_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_cart_reward_response_model.dart';

import '../../../../data/models/response/check_if_favorite_response_model.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';
part 'detail_product_bloc.freezed.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final ProductDatasource datasource;
  final CartDatasource cartDatasource;
  final FavoriteDatasource favoriteDatasource;

  DetailProductBloc({required this.datasource, required this.cartDatasource, required this.favoriteDatasource}) : super(const DetailProductState.initial()) {

    on<_GetDetailItemCart>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.getCartItem(event.cartId);
        await result.fold((l) {
          emit(const _Error(message: 'Failed to access data order'));
        }, (cartModel) async {
          if (cartModel.cartItem != null) {
            final productId = cartModel.cartItem!.productId;
            final productResult = await datasource.getDetailProductByID(productId!);
            final productDetails = productResult.fold((l) => null, (product) => product);

            // Check favorite status here
            final favoriteResult = await favoriteDatasource.getFavoriteProduct();
            final isLiked = favoriteResult.fold((l) => false, (favorite) {
              if (favorite.data != null) {
              }
              return false;
            });

            emit(_Success(
              model: productDetails,
              modelReward: null,
              modelCartPost: null,
              modelCartRewardPost: null,
              modelCartItem: cartModel,
              modelCartUpdate: null,
              modelCartItemReward: null,
              modelCartRewardUpdate: null,
              modelFavorite: null,
              modelPostFavorite: null,
              isTempSelected: cartModel.cartItem?.temperatur == 'hot',
              selectedTemp: cartModel.cartItem?.temperatur ?? 'ice',
              isSizeSelected: cartModel.cartItem?.size == 'large',
              selectedSize: cartModel.cartItem?.size ?? 'regular',
              isIceSelected: cartModel.cartItem?.ice == 'less',
              selectedIce: cartModel.cartItem?.ice ?? 'normal',
              isSugarSelected: cartModel.cartItem?.sugar == 'less',
              selectedSugar: cartModel.cartItem?.sugar ?? 'normal',
              quantityCount: cartModel.cartItem?.quantity ?? 1,
              totalPrice: cartModel.cartItem?.totalPrice ?? 0,
              note: cartModel.cartItem?.note ?? '',
              isLiked: false,
            ));
          } else {
            emit(const _Error(message: 'No items in cart'));
          }
        });
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_GetDetailItemCartReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.getCartItemReward(event.cartId);
        await result.fold((l) {
          emit(const _Error(message: 'Failed to access data order'));
        }, (cartModel) async {
          if (cartModel.cartItem != null) {
            final productId = cartModel.cartItem!.productId;
            final productResult = await datasource.getDetailProductRewardByID(productId!);
            final productDetails = productResult.fold((l) => null, (product) => product);

            // Check favorite status here
            final favoriteResult = await favoriteDatasource.getFavoriteProduct();
            final isLiked = favoriteResult.fold((l) => false, (favorite) {
              if (favorite.data != null) {
              }
              return false;
            });

            emit(_Success(
              model: null,
              modelReward: productDetails,
              modelCartPost: null,
              modelCartRewardPost: null,
              modelCartItem: null,
              modelCartUpdate: null,
              modelCartItemReward: cartModel,
              modelCartRewardUpdate: null,
              modelFavorite: null,
              modelPostFavorite: null,
              isTempSelected: cartModel.cartItem?.temperatur == 'hot',
              selectedTemp: cartModel.cartItem?.temperatur ?? 'ice',
              isSizeSelected: cartModel.cartItem?.size == 'large',
              selectedSize: cartModel.cartItem?.size ?? 'regular',
              isIceSelected: cartModel.cartItem?.ice == 'less',
              selectedIce: cartModel.cartItem?.ice ?? 'normal',
              isSugarSelected: cartModel.cartItem?.sugar == 'less',
              selectedSugar: cartModel.cartItem?.sugar ?? 'normal',
              quantityCount: cartModel.cartItem?.quantity ?? 1,
              totalPrice: cartModel.cartItem?.totalPoints ?? 0,
              note: cartModel.cartItem?.note ?? '',
              isLiked: false
            ));
          } else {
            emit(const _Error(message: 'No items in cart'));
          }
        });
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_GetDetailProduct>((event, emit) async {
      emit(const _Loading());
      try {
        final response = await datasource.getDetailProductByID(event.productId);
        final favoriteResult = await favoriteDatasource.getFavoriteProduct();
        final isLiked = favoriteResult.fold((l) => false, (favorite) {
          if (favorite.data != null) {
          }
          return false;
        });
        response.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: r,
            modelReward: null,
            modelCartPost: null,
            modelCartRewardPost: null,
            modelCartItem: null,
            modelCartUpdate: null,
                modelCartItemReward: null,
                modelCartRewardUpdate: null,
                  modelFavorite: null,
                  modelPostFavorite: null,
                isLiked: false,
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_GetDetailProductReward>((event, emit) async {
      emit(const _Loading());
      try {
        final response = await datasource.getDetailProductRewardByID(event.productRewardId);
        final favoriteResult = await favoriteDatasource.getFavoriteProduct();
        final isLiked = favoriteResult.fold((l) => false, (favorite) {
          if (favorite.data != null) {
          }
          return false;
        });
        response.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: null,
            modelCartPost: null,
            modelReward: r,
            modelCartRewardPost: null,
            modelCartItem: null,
            modelCartUpdate: null,
                modelCartItemReward: null,
                modelCartRewardUpdate: null,
                  modelFavorite: null,
                  modelPostFavorite: null,
                isLiked: isLiked,
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_PostCart>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.postCart(event.model!);
        result.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: null,
            modelCartPost: r,
            modelReward: null,
            modelCartRewardPost: null,
            modelCartItem: null,
            modelCartUpdate: null,
                modelCartItemReward: null,
                modelCartRewardUpdate: null,
                  modelFavorite: null,
                  modelPostFavorite: null
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_UpdateCart>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.updateCart(event.model!, event.id!);
        result.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: null,
            modelCartPost: null,
            modelReward: null,
            modelCartRewardPost: null,
            modelCartItem: null,
            modelCartUpdate: r,
                modelCartItemReward: null,
                modelCartRewardUpdate: null,
                  modelFavorite: null,
                  modelPostFavorite: null
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_UpdateCartReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.updateCartReward(event.model!, event.id!);
        result.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: null,
            modelCartPost: null,
            modelReward: null,
            modelCartRewardPost: null,
            modelCartItem: null,
            modelCartUpdate: null,
                modelCartItemReward: null,
                modelCartRewardUpdate: r,
                modelFavorite: null,
                  modelPostFavorite: null
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_PostCartReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await cartDatasource.postCartReward(event.model!);
        result.fold(
              (l) => emit(_Error(message: l)),
              (r) => emit(_Success(
            model: null,
            modelCartPost: null,
            modelCartRewardPost: r,
            modelReward: null,
            modelCartItem: null,
            modelCartUpdate: null,
                modelCartItemReward: null,
                modelCartRewardUpdate: null,
                  modelFavorite: null,
                  modelPostFavorite: null
          )),
        );
      } catch (e) {
        emit(_Error(message: 'An error occurred: $e'));
      }
    });

    on<_ToggleTemperature>((event, emit) {
      final currentState = state;
      if (currentState is _Success) {
        final newTemp = currentState.selectedTemp == 'ice' ? 'hot' : 'ice';
        emit(currentState.copyWith(
          isTempSelected: !currentState.isTempSelected,
          selectedTemp: newTemp,
        ));
      }
    });

    on<_ToggleSize>((event, emit) {
      final currentState = state;
      if (currentState is _Success) {
        final newSize = currentState.selectedSize == 'regular' ? 'large' : 'regular';
        emit(currentState.copyWith(
          isSizeSelected: !currentState.isSizeSelected,
          selectedSize: newSize,
        ));
      }
    });

    on<_ToggleIce>((event, emit) {
      final currentState = state;
      if (currentState is _Success) {
        final newIce = currentState.selectedIce == 'normal' ? 'less' : 'normal';
        emit(currentState.copyWith(
          isIceSelected: !currentState.isIceSelected,
          selectedIce: newIce,
        ));
      }
    });

    on<_ToggleSugar>((event, emit) {
      final currentState = state;
      if (currentState is _Success) {
        final newSugar = currentState.selectedSugar == 'normal' ? 'less' : 'normal';
        emit(currentState.copyWith(
          isSugarSelected: !currentState.isSugarSelected,
          selectedSugar: newSugar,
        ));
      }
    });

    on<_Increment>((event, emit) {
      final currentState = state;
      if (currentState is _Success) {
        emit(currentState.copyWith(
          quantityCount: currentState.quantityCount + 1,
        ));
      }
    });

    on<_Decrement>((event, emit) {
      final currentState = state;
      if (currentState is _Success && currentState.quantityCount > 1) {
        emit(currentState.copyWith(
          quantityCount: currentState.quantityCount - 1,
        ));
      }
    });


    on<_CheckFavoriteProduct>((event, emit) async {
      final currentState = state;
      if (currentState is _Success) {
        try {
          final result = await favoriteDatasource.getFavoriteProduct();
          result.fold(
                (l) => emit(_Error(message: 'Failed to access data order')),
                (favorite) {
              if (favorite.data != null) {
                emit(currentState.copyWith(
                  modelFavorite: favorite,
                  isLiked: false,
                ));
              } else {
                emit(_Error(message: 'No items in favorite list'));
              }
            },
          );
        } catch (e) {
          emit(_Error(message: 'An error occurred: $e'));
        }
      }
    });



    on<_PostFavorite>((event, emit) async {
      final currentState = state;
      if (currentState is _Success) {
        emit(const _Loading());
        try {
          final response = await favoriteDatasource.postFavoriteProduct(event.productId!);
          response.fold(
                (l) => emit(_Error(message: l)),
                (r) => emit(currentState.copyWith(
              modelPostFavorite: r,
              isLiked: r.message == 'Liked' ? true : false,
            )),
          );
        } catch (e) {
          emit(_Error(message: 'An error occurred: $e'));
        }
      }
    });


  }
}

