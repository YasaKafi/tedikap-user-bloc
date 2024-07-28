part of 'menu_bloc.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.initial() = _Initial;
  const factory MenuState.loading() = _Loading;
  const factory MenuState.success(ProductsResponseModel? model, {@Default(false) bool isSearching}) = _Success;
  const factory MenuState.error({String? message}) = _Error;
  const factory MenuState.empty() = _Empty;
}
