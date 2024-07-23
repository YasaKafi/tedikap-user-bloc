part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.started() = _Started;
  const factory FavoriteEvent.postFavorite(int? productId) = _PostFavorite;
  const factory FavoriteEvent.getFavorite() = _GetFavoriteProduct;
}
