
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/login_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/onboard_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/register_page/register_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/splash_page/splash_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/cart_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/detail_order_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/detail_product_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/detail_point_page/detail_point_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/view/edit_profile_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/view/help_center_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/language_setting_page/language_setting_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/setting_page/setting_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/terms_of_serive_page/terms_of_serive_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/point_page_view.dart';

import '../presentation/pages/information_page/privacy_policy_page/privacy_policy_view.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/dashboard',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'onboard',
        path: '/onboard',
        builder: (context, state) => const OnboardPage(),
      ),
      GoRoute(
        name: 'register',
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: 'help_center',
        path: '/help_center',
        builder: (context, state) => const HelpCenterPage(),
      ),
      GoRoute(
        name: 'language_setting',
        path: '/language_setting',
        builder: (context, state) => const LanguageSettingPage(),
      ),
      GoRoute(
        name: 'privacy_policy',
        path: '/privacy_policy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        name: 'terms_and_conditions',
        path: '/terms_and_conditions',
        builder: (context, state) => const TermOfServicePage(),
      ),
      GoRoute(
        name: 'setting',
        path: '/setting',
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        name: 'edit_profile',
        path: '/edit_profile',
        builder: (context, state) => EditProfilePage(),
      ),
      GoRoute(
        name: 'detail_point',
        path: '/detail_point',
        builder: (context, state) => DetailPoinPage(),
      ),
      GoRoute(
        name: 'point',
        path: '/point',
        builder: (context, state) => PointPage(),
      ),

      GoRoute(
        name: 'detail_order_reward',
        path: '/detail_order_reward/:orderRewardId',
        builder: (context, state) {
          final orderRewardId = state.pathParameters['orderRewardId'];
          return DetailOrderPage(orderRewardId: orderRewardId);
        },
      ),
      GoRoute(
        name: 'cart_common',
        path: '/cart_common',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        name: 'cart_reward',
        path: '/cart_reward',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        name: 'detail_product_common',
        path: '/detail_product_common/:productId',
        builder: (context, state) {
          final productId = state.pathParameters['productId'];
          final cartItemId = state.extra is String ? state.extra as String : null;
          return DetailProductPage(productId: int.parse(productId!), cartItemId: cartItemId != null ? int.parse(cartItemId) : null,);
        },
      ),
      GoRoute(
        name: 'detail_product_reward',
        path: '/detail_product_reward/:productRewardId',
        builder: (context, state) {
          final productRewardId = int.parse(state.pathParameters['productRewardId']!) ;
          return DetailProductPage(productRewardId: productRewardId);
        },
      ),

    ],
  );
}
