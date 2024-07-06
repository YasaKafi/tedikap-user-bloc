import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../dio_instance.dart';
import '../models/request/register_request_model.dart';
import '../models/response/register_response_model.dart';

class AuthDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, RegisterResponseModel>> postRegister (RegisterRequestModel model) async {
    final response = await _dioInstance.postRequest(
      endpoint: TedikapApiRepository.postRegister,
      data: model.toJson(),

    );
    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromMap(response.data));
    } else {
      return const Left('Failed to register');
    }
  }

}