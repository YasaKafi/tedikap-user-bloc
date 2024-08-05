import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/edit_current_user_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/logout_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/user_point_response_model.dart';

import '../dio_instance.dart';
import '../repository/tedikap_repository.dart';

class UserDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, CurrentUserModel>> getCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getCurrentUser, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(CurrentUserModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data user');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, UserPointResponseModel>> getPointUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getUserPoin, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(UserPointResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, EditProfileResponseModel>> updateCurrentUser({
    String? name,
    String? email,
    String? gender,
    File? imageFile,
  }) async {
    try {
      // Manually print out the request data
      print('Request Data:');
      print('Name: $name');
      print('Email: $email');
      print('Gender: $gender');
      if (imageFile != null) {
        print('Avatar: ${imageFile.path.split('/').last}');
      }

      FormData formData = FormData.fromMap({
        'name': name,
        'email': email,
        'gender': gender,
        if (imageFile != null)
          'avatar': await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last),
      });

      final response = await _dioInstance.postRequest(
          endpoint: TedikapApiRepository.postProfile,
          data: formData,
          isMultipart: true,
          isAuthorize: true);

      if (response.statusCode == 200) {
        return Right(EditProfileResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to update profile');
      }
    } catch (e) {
      return Left('Failed to update profile: ${e.toString()}');
    }
  }


  Future<Either<String, LogoutResponseModel>> postLogout() async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postLogout,
        isAuthorize: true
      );
      if (response.statusCode == 200) {
        return Right(LogoutResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to register');
      }
    } catch (e) {
      return Left('Failed to login: ${e.toString()}');
    }
  }


}
