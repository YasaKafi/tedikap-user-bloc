part of 'point_bloc.dart';

@freezed
class PointEvent with _$PointEvent {
  const factory PointEvent.started() = _Started;
  const factory PointEvent.getProduct() = _GetProduct;
  const factory PointEvent.getFilterCategory(String query) = _GetFilterCategory;
}
