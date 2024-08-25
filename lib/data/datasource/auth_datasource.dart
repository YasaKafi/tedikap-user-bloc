import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_user_bloc/data/models/request/login_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/reset_password_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/login_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/otp_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/reset_password_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/update_fcm_token_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/verify_otp_email_response_model.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../dio_instance.dart';
import '../models/request/register_request_model.dart';
import '../models/response/register_response_model.dart';

class AuthDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, RegisterResponseModel>> postRegister(
      RegisterRequestModel model) async {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postRegister,
        data: model.toJson(),
          validateStatus: (status) {
            return status != null && status < 500;
          },
      );

      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        final token = response.data['token'];
        if (token != null) {
          await prefs.setString('token', token);
        }
        return Right(RegisterResponseModel.fromMap(response.data));
      } else if (response.statusCode == 400 || response.statusCode == 422 || response.statusCode == 404) {
        final errorMessage = response.data['message'] ?? 'Failed to register null';
        return Left(errorMessage);
      } else {
        return Left('Failed to register  ${response.statusCode}');
      }

  }

  Future<Either<String, LoginResponseModel>> postLogin(
      LoginRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postLogin,
        data: model.toJson(),
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final token = response.data['token'];
        if (token != null) {
          await prefs.setString('token', token);
        }
        return Right(LoginResponseModel.fromMap(response.data));
      } else {
        final errorMessage = response.data['message'] ?? 'Failed to register';
        return Left(errorMessage);
      }
    } catch (e) {
      return Left('Failed to register: ${e.toString()}');
    }
  }

  Future<Either<String, ResetPasswordResponseModel>> postResetPassword(
      ResetPasswordRequestModel model) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postResetPassword,
        data: model.toJson(),
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );
      if (response.statusCode == 200) {
        return Right(ResetPasswordResponseModel.fromMap(response.data));
      } else {
        final errorMessage = response.data['message'] ?? 'Failed to register';
        return Left(errorMessage);
      }
    } catch (e) {
      return Left('Failed to register: ${e.toString()}');
    }
  }

  Future<Either<String, OtpResponseModel>> postOtpResetPass(
      String email) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postOtpVerificationResetPass,
        data: {
          'email': email,
        },
        validateStatus: (status) {
          return status != null && status < 500;
        },
      );
      if (response.statusCode == 200) {
        return Right(OtpResponseModel.fromMap(response.data));
      } else {
        final errorMessage = response.data['message'] ?? 'Failed to register null';
        return Left(errorMessage);
      }
    } catch (e) {
      return Left('get OTP: ${e.toString()}');
    }
  }

  Future<Either<String, OtpResponseModel>> postOtpRegister(
      String email) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postOtpVerificationRegister,
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        return Right(OtpResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed get OTP');
      }
    } catch (e) {
      return Left('get OTP: ${e.toString()}');
    }
  }

  Future<Either<String, VerifyOtpResponseModel>> postVerifyOtp(
      String email, String otp) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: TedikapApiRepository.postOtpEmailVerification,
        validateStatus: (status) {
          return status != null && status < 500;
        },
        data: {
          'email': email,
          'otp': otp,
        },
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        final token = response.data['reset_token'];
        if (token != null) {
          await prefs.setString('reset_token', token);
        }
        return Right(VerifyOtpResponseModel.fromMap(response.data));
      } else {
        final errorMessage = response.data['message'] ?? 'Failed to register null';
        return Left(errorMessage);      }
    } catch (e) {
      return Left('get OTP: ${e.toString()}');
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

