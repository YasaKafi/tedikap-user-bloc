import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';

import '../../../../data/datasource/user_datasource.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserDatasource datasource;

  ProfileBloc(this.datasource) : super(const _Initial()) {
    on<_GetUser>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getCurrentUser();
      result.fold((l) => emit(const _Error('Failed to get data user')), (r) => emit(_Loaded(r)));

    });
  }
}
