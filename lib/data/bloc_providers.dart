import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/favorite_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/product_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/user_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/voucher_datasource.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/bloc/login_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_voucher_page/bloc/detail_voucher_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/bloc/favorite_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/bloc/help_center_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/menu_page/bloc/menu_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/notification_page/bloc/notification_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/bloc/point_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/bloc/voucher_bloc.dart';

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
      create: (context) => HelpCenterBloc(UserDatasource()),
    ),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(UserDatasource()),
    ),
    BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(),
    ),
    BlocProvider<EditProfileBloc>(
      create: (context) => EditProfileBloc(UserDatasource()),
    ),
    BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(ProductDatasource()),
    ),
    BlocProvider<OrderBloc>(
      create: (context) => OrderBloc(OrderDatasource(), CartDatasource()),
    ),
    BlocProvider<DetailOrderBloc>(
      create: (context) => DetailOrderBloc(OrderDatasource()),
    ),
    BlocProvider<PointBloc>(
      create: (context) => PointBloc(ProductDatasource(), UserDatasource()),
    ),
    BlocProvider<DetailVoucherBloc>(
      create: (context) => DetailVoucherBloc(VoucherDatasource()),
    ),
    BlocProvider<VoucherBloc>(
      create: (context) => VoucherBloc(VoucherDatasource(), CartDatasource()),
    ),
    BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(FavoriteDatasource(), ProductDatasource()),
    ),
    BlocProvider<DetailProductBloc>(
      create: (context) => DetailProductBloc(datasource: ProductDatasource(), cartDatasource: CartDatasource(), favoriteDatasource: FavoriteDatasource(),),
    ),
    BlocProvider<CartBloc>(
      create: (context) => CartBloc(productDatasource: ProductDatasource(), cartDatasource: CartDatasource(), orderDatasource: OrderDatasource()),
    ),
    BlocProvider<CartRewardBloc>(
      create: (context) => CartRewardBloc(productDatasource: ProductDatasource(), cartDatasource: CartDatasource(), orderDatasource: OrderDatasource(), userDatasource: UserDatasource()),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(datasource: UserDatasource(), productDatasource: ProductDatasource()),
    ),
  ];

}
