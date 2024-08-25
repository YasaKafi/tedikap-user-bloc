import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/logout_response_model.dart';

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
      result.fold((l) => emit(const _Error('Failed to get data user')), (r) => emit(_Loaded(model: r,)));
    });

    on<_DoLogout>((event, emit) async {
      final currentState = state;
      if (currentState is _Loading) return;
      emit(const _Loading());
      final result = await datasource.postLogout();
      result.fold((l) => emit(const _Error('Failed to logout')), (r) {
        emit(_Loaded(logModel:  r));
      }
      );
    });
  }

  void _clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}
