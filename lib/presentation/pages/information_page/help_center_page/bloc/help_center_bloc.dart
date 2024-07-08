import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_center_event.dart';
part 'help_center_state.dart';
part 'help_center_bloc.freezed.dart';

class HelpCenterBloc extends Bloc<HelpCenterEvent, HelpCenterState> {
  HelpCenterBloc() : super(HelpCenterState.initial()) {
    on<_TogglePanel>((event, emit) {
      final newState = List<bool>.from(state.isExpanded);
      newState[event.index!] = !newState[event.index!];
      emit(state.copyWith(isExpanded: newState));
    });
  }
}
