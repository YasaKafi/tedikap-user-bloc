import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_reward_response_model.dart';

part 'detail_product_event.dart';
part 'detail_product_state.dart';
part 'detail_product_bloc.freezed.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final ProductDatasource datasource;
  final CartDatasource cartDatasource;
  DetailProductBloc({required this.datasource, required this.cartDatasource}) : super(const DetailProductState.initial()) {
    on<_GetDetailProduct>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getDetailProductByID(event.productId);
      response.fold(
        (l) => emit(_Error(message: l)),
        (r) => emit(_Success(model: r, modelReward: null, modelCartPost: null, modelCartRewardPost: null)),
      );
    });
    on<_GetDetailProductReward>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getDetailProductRewardByID(event.productRewardId);
      response.fold(
            (l) => emit(_Error(message: l)),
            (r) => emit(_Success(model: null, modelCartPost: null, modelReward: r, modelCartRewardPost: null)),
      );
    });

    on<_PostCart>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.postCart(event.model!);
      result.fold((l) => emit(_Error(message: l)), (r) => emit(_Success(model: null, modelCartPost: r, modelReward: null, modelCartRewardPost: null)));
    });

    on<_PostCartReward>((event, emit) async {
      emit(const _Loading());
      final result = await cartDatasource.postCartReward(event.model!);
      result.fold((l) => emit(_Error(message: l)), (r) => emit(_Success(model: null, modelCartPost: null, modelCartRewardPost: r, modelReward: null)));
    });


    on<_ToggleTemperature>((event, emit){
      if(state is _Success){
        emit((state as _Success).copyWith(isTempSelected: !(state as _Success).isTempSelected));
        emit((state as _Success).copyWith(selectedTemp: (state as _Success).isTempSelected ? 'hot' : 'ice'));
      }
    });

    on<_ToggleSize>((event, emit){
      if(state is _Success){
        emit((state as _Success).copyWith(isSizeSelected: !(state as _Success).isSizeSelected));
        emit((state as _Success).copyWith(selectedSize: (state as _Success).isSizeSelected ? 'large' : 'regular'));
      }
    });

    on<_ToggleIce>((event, emit){
      if(state is _Success){
        emit((state as _Success).copyWith(isIceSelected: !(state as _Success).isIceSelected));
        emit((state as _Success).copyWith(selectedIce: (state as _Success).isIceSelected ? 'less' : 'normal'));
      }
    });

    on<_ToggleSugar>((event, emit){
      if(state is _Success){
        emit((state as _Success).copyWith(isSugarSelected: !(state as _Success).isSugarSelected));
        emit((state as _Success).copyWith(selectedSugar: (state as _Success).isSugarSelected ? 'less' : 'normal'));
      }
    });

    on<_Increment>((event, emit){
      if(state is _Success){
        emit((state as _Success).copyWith(quantityCount: (state as _Success).quantityCount + 1));
      }
    });

    on<_Decrement>((event, emit) {
      if (state is _Success) {
        final currentState = state as _Success;
        if (currentState.quantityCount > 1) {
          emit(currentState.copyWith(
            quantityCount: currentState.quantityCount - 1,
          ));
        }
      }
    });

  }
}
