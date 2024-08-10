part of 'point_bloc.dart';

@freezed
class PointEvent with _$PointEvent {
  const factory PointEvent.getPointUser() = _GetPointUser;
  const factory PointEvent.getFilterCategory(String query) = _GetFilterCategory;
}
