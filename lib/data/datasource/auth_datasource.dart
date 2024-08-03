import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_user_bloc/data/models/request/login_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/login_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_fcm_token_response_model.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../dio_instance.dart';
import '../models/request/register_request_model.dart';
import '../models/response/register_response_model.dart';

class AuthDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, RegisterResponseModel>> postRegister(
      RegisterRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postRegister,
        data: model.toJson(),
      );
      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        final token = response.data['token'];
        if (token != null) {
          await prefs.setString('token', token);
        }
        return Right(RegisterResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to register');
      }
    } catch (e) {
      return Left('Failed to register: ${e.toString()}');
    }
  }

  Future<Either<String, LoginResponseModel>> postLogin(
      LoginRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postLogin,
        data: model.toJson(),
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final token = response.data['token'];
        if (token != null) {
          await prefs.setString('token', token);
        }
        return Right(LoginResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to login');
      }
    } catch (e) {
      return Left('Failed to login: ${e.toString()}');
    }
  }

  Future<Either<String, UpdateFcmResponseModel>> putFCMToken(String fcmToken) async {
    try {
      final response = await _dioInstance.putRequest(
          endpoint: TedikapApiRepository.putFCMToken,
          isAuthorize: true,
          data: {
            "fcm_token": fcmToken
          }
      );
      if (response.statusCode == 200) {
        return Right(UpdateFcmResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to Update FCM');
      }
    } catch (e) {
      return Left('Failed to update FCM token: ${e.toString()}');
    }
  }
}

