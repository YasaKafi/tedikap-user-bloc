
import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/dio_instance.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/delete_cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/patch_qty_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_cart_reward_response_model.dart';

import '../repository/tedikap_repository.dart';

class CartDatasource{
  final DioInstance _dioInstance = DioInstance();


  Future<Either<String, CartResponseModel>> getCart() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getCart, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(CartResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data cart ');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, CartRewardResponseModel>> getCartReward() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getCartReward, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(CartRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data cart reward ');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, CartItemResponseModel>> getCartItem(int? id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getCartItem}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(CartItemResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data cart item');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, CartItemRewardResponseModel>> getCartItemReward(int? id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getCartItemReward}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(CartItemRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data cart item reward');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, PostCartResponseModel>> postCart(
      PostCartRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        endpoint: TedikapApiRepository.postCart,
        data: model.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(PostCartResponseModel.fromMap(response.data));
      } else {
        return const Left('Success Add/Updated to Cart');
      }
    } catch (e) {
      return Left('Failed to Add/Updated to Cart: ${e.toString()}');
    }
  }

  Future<Either<String, UpdateCartResponseModel>> updateCart(
      PostCartRequestModel model, int? id) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        endpoint: '${TedikapApiRepository.putCart}/$id',
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(UpdateCartResponseModel.fromMap(response.data));
      } else {
        return const Left('Success Updated to Cart');
      }
    } catch (e) {
      return Left('Failed to Updated to Cart: ${e.toString()}');
    }
  }

  Future<Either<String, UpdateCartRewardResponseModel>> updateCartReward(
      PostCartRewardRequestModel model, int? id) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        endpoint: '${TedikapApiRepository.putCartReward}/$id',
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        return Right(UpdateCartRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Success Updated to Cart');
      }
    } catch (e) {
      return Left('Failed to Updated to Cart: ${e.toString()}');
    }
  }

  Future<Either<String, PostCartRewardResponseModel>> postCartReward(
      PostCartRewardRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        endpoint: TedikapApiRepository.postCartReward,
        data: model.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(PostCartRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Success Add/Updated to Cart Reward');
      }
    } catch (e) {
      return Left('Failed to Add/Updated to Cart Reward: ${e.toString()}');
    }
  }

  Future<Either<String, PatchQtyResponseModel>> patchQty(String query, int id) async {
    try {
      final response = await _dioInstance.patchRequest(
        endpoint: '${TedikapApiRepository.patchUpdateQty}/$id?action=$query',
        isAuthorize: true,
      );
      if (response.statusCode == 200) {
        return Right(PatchQtyResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to update quantity');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, PatchQtyResponseModel>> patchQtyReward(String query, int id) async {
    try {
      final response = await _dioInstance.patchRequest(
        endpoint: '${TedikapApiRepository.patchUpdateQtyReward}/$id?action=$query',
        isAuthorize: true,
      );
      if (response.statusCode == 200) {
        return Right(PatchQtyResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to update quantity');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, DeleteCartItemResponseModel>> deleteItem(int? id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${TedikapApiRepository.deleteCartItem}/$id',
        isAuthorize: true,
      );
      if (response.statusCode == 200) {
        return Right(DeleteCartItemResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to delete item');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, DeleteCartItemResponseModel>> deleteItemReward(int? id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${TedikapApiRepository.deleteCartItemReward}/$id',
        isAuthorize: true,
      );
      if (response.statusCode == 200) {
        return Right(DeleteCartItemResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to delete item');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }
}