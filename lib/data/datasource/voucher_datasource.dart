

import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/voucher_active_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/voucher_applied_remove_response_model.dart';

import '../dio_instance.dart';
import '../repository/tedikap_repository.dart';

class VoucherDatasource {

  final DioInstance _dioInstance = DioInstance();


  Future<Either<String, VoucherActiveResponseModel>> getVoucher() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getAllVoucherActive, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(VoucherActiveResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data voucher');
      }
    } catch (e) {
      return Left('Failed to access data voucher : ${e.toString()}');
    }
  }

  Future<Either<String, VoucherAppliedRemoveResponseModel>> postApplyVoucher(int voucherId) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: TedikapApiRepository.postApplyVoucher,
          data: {
            'voucher_id': voucherId
          },
          isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(VoucherAppliedRemoveResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data favorite');
      }
    } catch (e) {
      return Left('Failed to access data favorite : ${e.toString()}');
    }
  }

  Future<Either<String, VoucherAppliedRemoveResponseModel>> postRemoveVoucher(int voucherId) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: TedikapApiRepository.postRemoveVoucher,
          data: {
            'voucher_id': voucherId
          },
          isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(VoucherAppliedRemoveResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data favorite');
      }
    } catch (e) {
      return Left('Failed to access data favorite : ${e.toString()}');
    }
  }
}