part of 'menu_bloc.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.started() = _Started;
  const factory MenuEvent.getProduct() = _GetProduct;
  const factory MenuEvent.getFilterCategory(String query) = _GetFilterCategory;
  const factory MenuEvent.getFilterSearch(String query) = _GetSearchCategory;
  const factory MenuEvent.clearSearch() = _ClearSearch;
  const factory MenuEvent.tabSwitched(int index, {String? searchQuery}) = _TabSwitched;
}
