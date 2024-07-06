part of 'onboard_bloc.dart';

@freezed
class OnboardEvent with _$OnboardEvent {
  const factory OnboardEvent.pageChanged({int? index}) = _PageChanged;
  const factory OnboardEvent.skipOnboard() = _SkipOnboard;
  const factory OnboardEvent.onPressedButton() = _OnPressedButton;
}
