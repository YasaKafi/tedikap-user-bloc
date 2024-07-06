part of 'onboard_bloc.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState.initial({int? pageIndex}) = _Initial;
  const factory OnboardState.finished() = _Finished;
}
