
import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/dio_instance.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_cart_reward_response_model.dart';

import '../repository/tedikap_repository.dart';

class CartDatasource{
  final DioInstance _dioInstance = DioInstance();

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
}