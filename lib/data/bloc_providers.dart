import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/user_datasource.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/bloc/login_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/bloc/help_center_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/menu_page/bloc/menu_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/bloc/point_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';

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
    BlocProvider<HelpCenterBloc>(
      create: (context) => HelpCenterBloc(),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(UserDatasource()),
    ),
    BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(UserDatasource()),
    ),
    BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(ProductDatasource()),
    ),
    BlocProvider<OrderBloc>(
      create: (context) => OrderBloc(OrderDatasource()),
    ),
    BlocProvider<DetailOrderBloc>(
      create: (context) => DetailOrderBloc(OrderDatasource()),
    ),
    BlocProvider<PointBloc>(
      create: (context) => PointBloc(ProductDatasource()),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(datasource: UserDatasource(), productDatasource: ProductDatasource()),
    ),
  ];

}
