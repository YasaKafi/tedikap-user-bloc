
import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';

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
}