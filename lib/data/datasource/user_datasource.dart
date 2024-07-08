
import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';

import '../dio_instance.dart';
import '../repository/tedikap_repository.dart';

class UserDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, CurrentUserModel>> getCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: TedikapApiRepository.getCurrentUser,
        isAuthorize: true
      );
      if (response.statusCode == 200) {
        return Right(CurrentUserModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }
}