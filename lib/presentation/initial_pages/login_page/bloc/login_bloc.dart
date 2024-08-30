import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/request/login_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/login_response_model.dart';

import '../../../../data/datasource/auth_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource datasource;
  LoginBloc(this.datasource) : super(const LoginState.initial()) {
    on<_DoLogin>((event, emit) async {
      emit(const LoginState.loading());
      final result = await datasource.postLogin(event.data!);
      result.fold((l)  => emit(LoginState.error(message: l)), (r) => emit(LoginState.success(model: r))
      );
    });

  }
}
