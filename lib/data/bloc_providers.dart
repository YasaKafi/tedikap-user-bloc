import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/bloc/login_bloc.dart';

import '../presentation/initial_pages/onboard_page/bloc/onboard_bloc.dart';
import '../presentation/initial_pages/register_page/bloc/register_bloc.dart';
import 'datasource/auth_datasource.dart';

class AppProviders{

  final providers = [
    BlocProvider<OnboardBloc>(
      create: (context) => OnboardBloc(),
    ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(AuthDatasource()),
    ),
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(AuthDatasource()),
    ),
  ];

}
