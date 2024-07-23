part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.success(
      {
        PostFavoriteResponseModel? modelPostFavorite,
        FavoriteResponseModel? modelFavorite,
        ProductsResponseModel? modelProduct,
        @Default(false) bool isLiked,

      }) = _Success;
  const factory FavoriteState.error({String? message}) = _Error;
}
