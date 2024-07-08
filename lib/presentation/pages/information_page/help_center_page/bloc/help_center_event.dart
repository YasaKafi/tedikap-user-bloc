part of 'help_center_bloc.dart';

@freezed
class HelpCenterEvent with _$HelpCenterEvent {
  const factory HelpCenterEvent.togglePanel(int? index) = _TogglePanel;
}
