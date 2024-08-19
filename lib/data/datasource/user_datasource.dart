import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tedikap_user_bloc/data/models/response/banner_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/box_promo_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/edit_current_user_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/help_center_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/logout_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/notification_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/status_outlet_response_model.dart';
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

  Future<Either<String, HelpCenterResponseModel>> getHelpCenter() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getHelpCenter, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(HelpCenterResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data help center');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, StatusOutletResponseModel>> getStatusOutlet() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getStatusOutlet, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(StatusOutletResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data help center');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, UserPointResponseModel>> getPointUser() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getUserPoint, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(UserPointResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      print('EXCEPTION POIN : $e');
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, BannerResponseModel>> getBanner() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getBanner, isAuthorize: false);
      if (response.statusCode == 200) {
        return Right(BannerResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, BoxPromoResponseModel>> getBoxPromo() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getBoxPromo, isAuthorize: false);
      if (response.statusCode == 200) {
        return Right(BoxPromoResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }


  Future<Either<String, NotificationResponseModel>> getNotification() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getNotification, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(NotificationResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, NotificationResponseModel>> getFilterNotification(
      {String? type, String? startDate, String? endDate}) async {
    try {
      // Build the query parameters
      final queryParameters = {
        'type': type,
        'start_date': startDate,
        'end_date': endDate,
      }..removeWhere((key, value) => value == null); // Remove null values

      print(' HALOOOOO $queryParameters');

      final response = await _dioInstance.getRequest(
        endpoint: TedikapApiRepository.getNotification,
        queryParameters: queryParameters,
        isAuthorize: true,
      );

      if (response.statusCode == 200) {
        return Right(NotificationResponseModel.fromMap(response.data));
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
      if (name != null) print('Name: $name');
      if (email != null) print('Email: $email');
      if (gender != null) print('Gender: $gender');
      if (imageFile != null) {
        print('Avatar: ${imageFile.path.split('/').last}');
      }

      // Construct the form data
      final formData = FormData();
      if (name != null) formData.fields.add(MapEntry('name', name));
      if (email != null) formData.fields.add(MapEntry('email', email));
      if (gender != null) formData.fields.add(MapEntry('gender', gender));
      if (imageFile != null) {
        formData.files.add(MapEntry(
          'avatar',
          await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.path.split('/').last,
          ),
        ));
      }

      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postProfile,
        data: formData,
        isMultipart: true,
        isAuthorize: true,
      );

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
