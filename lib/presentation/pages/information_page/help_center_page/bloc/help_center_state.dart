part of 'help_center_bloc.dart';

@freezed
class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState({
    required List<bool> isExpanded,
  }) = _HelpCenterState;

  factory HelpCenterState.initial() => HelpCenterState(
    isExpanded: List.generate(5, (_) => false),
  );
}
