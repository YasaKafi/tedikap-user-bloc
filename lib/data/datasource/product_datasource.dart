

import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/products_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/products_reward_response_model.dart';

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
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, ProductsRewardResponseModel>> getAllProductReward() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getAllRewardProduct, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(ProductsRewardResponseModel.fromMap(response.data));
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, DetailProductResponseModel>> getDetailProductByID(int id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getProductByID}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(DetailProductResponseModel.fromMap(response.data));
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, DetailProductRewardResponseModel>> getDetailProductRewardByID(int id) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${TedikapApiRepository.getRewardProductByID}/$id', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(DetailProductRewardResponseModel.fromMap(response.data));
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
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
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

  Future<Either<String, ProductsRewardResponseModel>> getFilterCategoryReward(String query) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getFilterRewardProduct,
        isAuthorize: true,
        queryParameters: {
          'category': query
        },
      );
      if (response.statusCode == 200) {
        return Right(ProductsRewardResponseModel.fromMap(response.data));
      } else if (response.statusCode == 404) {
        return const Left('Oops, something went wrong. Please try again later');
      } else {
        return const Left('Oops, something went wrong. Please try again later');
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
        if (response.statusCode == 429) {
          return const Left('Too many requests. Please try again later.');
        } else if (response.statusCode == 404){
          return const Left('Oops, something went wrong. Please try again later');
        }
        return const Left('Oops, something went wrong. Please try again later');
      }
    } catch (e) {
      return Left('Failed to access data: ${e.toString()}');
    }
  }

}
