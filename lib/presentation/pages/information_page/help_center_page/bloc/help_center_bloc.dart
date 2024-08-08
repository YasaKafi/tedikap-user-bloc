import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/help_center_response_model.dart';

import '../../../../../data/datasource/user_datasource.dart';

part 'help_center_event.dart';
part 'help_center_state.dart';
part 'help_center_bloc.freezed.dart';

class HelpCenterBloc extends Bloc<HelpCenterEvent, HelpCenterState> {
  final UserDatasource datasource;
  HelpCenterBloc(this.datasource) : super(const HelpCenterState.initial()) {
    on<_TogglePanel>((event, emit) {
      state.maybeWhen(
        loaded: (isExpanded, model) {
          final newState = List<bool>.from(isExpanded);
          newState[event.index!] = !newState[event.index!];
          emit(HelpCenterState.loaded(isExpanded: newState, model: model));
        },
        orElse: () {},
      );
    });

    on<_GetHelpCenter>((event, emit) async {
      emit(const HelpCenterState.loading());
      try {
        // Simulate a network call
        final result = await datasource.getHelpCenter();
        await Future.delayed(const Duration(seconds: 2));
        result.fold((l) => emit(const HelpCenterState.error(message: 'Failed to access data help center')), (r) => emit(HelpCenterState.loaded(isExpanded: List.generate(r.data!.length, (_) => false), model: r)));
      } catch (e) {
        emit(HelpCenterState.error(message: 'Failed to load help center data'));
      }
    });
  }
}

