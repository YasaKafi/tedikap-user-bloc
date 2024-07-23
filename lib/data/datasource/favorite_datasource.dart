

import 'package:dartz/dartz.dart';
import 'package:tedikap_user_bloc/data/models/response/favorite_response_model.dart';

import '../dio_instance.dart';
import '../models/response/check_if_favorite_response_model.dart';
import '../repository/tedikap_repository.dart';

class FavoriteDatasource {

  final DioInstance _dioInstance = DioInstance();


  Future<Either<String, FavoriteResponseModel>> getFavoriteProduct() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: TedikapApiRepository.getAllProductFavorite, isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(FavoriteResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data favorite');
      }
    } catch (e) {
      return Left('Failed to access data favorite : ${e.toString()}');
    }
  }

  Future<Either<String, PostFavoriteResponseModel>> postFavoriteProduct(int productId) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: '${TedikapApiRepository.postProductFavorite}/$productId', isAuthorize: true);
      if (response.statusCode == 200) {
        return Right(PostFavoriteResponseModel.fromMap(response.data));
      } else {
        return const Left('Failed to access data favorite');
      }
    } catch (e) {
      return Left('Failed to access data favorite : ${e.toString()}');
    }
  }
}