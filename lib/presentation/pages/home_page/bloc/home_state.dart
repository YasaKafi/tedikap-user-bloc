part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({
    MostPopularProductResponseModel? model, CurrentUserModel? user, int? newIndex, UserPointResponseModel? pointModel, StatusOutletResponseModel? statusOutletModel
  }) = _Success;
  const factory HomeState.error({String? message}) = _Error;
}
