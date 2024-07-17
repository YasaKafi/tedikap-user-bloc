

import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/products_response_model.dart';

import '../dio_instance.dart';
import '../repository/tedikap_repository.dart';

class ProductDatasource {
  final DioInstance _dioInstance = DioInstance();

  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getAllProduct, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(ProductsResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data product');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, ProductsResponseModel>> getFilterCategory(String query) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getFilterProduct,
        isAuthorize: true,
        queryParameters: {
          'category': query
        },
      );
      if (response.statusCode == 200) {
        return Right(ProductsResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data product');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, ProductsResponseModel>> getFilterSearch(String query) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getFilterProduct,
        isAuthorize: true,
        queryParameters: {
          'search': query
        },
      );
      if (response.statusCode == 200) {
        return Right(ProductsResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data product');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

}