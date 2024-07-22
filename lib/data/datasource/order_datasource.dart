
import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/request/post_order_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_order_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_payment_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_payment_response_model.dart';

import '../dio_instance.dart';
import '../repository/tedikap_repository.dart';


class OrderDatasource{

  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, HistoryOrderResponseModel>> getAllHistoryOrder() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getAllOrder, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(HistoryOrderResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data order');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, HistoryOrderRewardResponseModel>> getAllHistoryOrderReward() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getOrderReward, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(HistoryOrderRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data order');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }


  Future<Either<String, DetailHistoryOrderResponseModel>> getDetailHistoryOrder(String id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getOrderByID}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(DetailHistoryOrderResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data order');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }
  Future<Either<String, DetailHistoryOrderRewardResponseModel>> getDetailHistoryOrderReward(String id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getOrderReward}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(DetailHistoryOrderRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data order');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, PostOrderResponseModel>> postOrder(
      PostOrderRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        endpoint: TedikapApiRepository.postOrder,
        data: model.toJson(),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(PostOrderResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed Order');
      }
    } catch (e) {
      return Left('Failed Ordered: ${e.toString()}');
    }
  }

  Future<Either<String, PostOrderRewardResponseModel>> postOrderReward(
      int? cartId) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        endpoint: TedikapApiRepository.postOrderReward,
        data: {
          "cart_reward_id": cartId,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(PostOrderRewardResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed Ordered');
      }
    } catch (e) {
      return Left('Failed Ordered: ${e.toString()}');
    }
  }

  Future<Either<String, PostPaymentResponseModel>> postPayment(
      String? orderId) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        endpoint: TedikapApiRepository.postPayment,
        data: {
          "order_id": orderId,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {

        return Right(PostPaymentResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed Payment');
      }
    } catch (e) {
      return Left('Failed Payment: ${e.toString()}');
    }
  }

  Future<Either<String, HistoryOrderResponseModel>> getFilterTypeOrder(String query) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: TedikapApiRepository.getFilterOrder,
        isAuthorize: true,
        queryParameters: {
          'type': query
        },
      );
      if (response.statusCode == 200) {
        return Right(HistoryOrderResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data order');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }
}