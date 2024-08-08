part of 'help_center_bloc.dart';

@freezed
class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState.initial() = _Initial;
  const factory HelpCenterState.loading() = _Loading;
  const factory HelpCenterState.loaded({
    required List<bool> isExpanded,
    required HelpCenterResponseModel model,
  }) = _Loaded;
  const factory HelpCenterState.error({required String message}) = _Error;
}

