part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.reset() = _Reset;
  const factory HomeEvent.getPoint() = _GetPoint;
  const factory HomeEvent.getUser({@Default(false) bool forceRefresh,
  }) = _GetUser;
  const factory HomeEvent.changeIndex({required int index}) = _ChangeIndex;

}
