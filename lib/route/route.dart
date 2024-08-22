
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/login_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/onboard_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/register_page/register_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/splash_page/splash_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/cart_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/cart_reward_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/detail_order_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_point_page/detail_point_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/detail_product_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/favorite_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/view/edit_profile_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/view/help_center_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/language_setting_page/language_setting_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/setting_page/setting_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/terms_of_serive_page/terms_of_serive_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/notification_page/notification_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/review.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/point_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/voucher_page_view.dart';

import '../firebase/notification_service.dart';
import '../presentation/pages/detail_voucher_page/detail_voucher_page_view.dart';
import '../presentation/pages/information_page/privacy_policy_page/privacy_policy_view.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/splash',
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
        path: '/dashboard/:pageIndex',
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['pageIndex'] ?? '0');
          return DashboardPage(pageIndex: pageIndex);
        },
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
        builder: (context, state) => DetailPointPage(),
      ),
      GoRoute(
        name: 'point',
        path: '/point',
        builder: (context, state) => PointPage(),
      ),
      GoRoute(
        name: 'favorite',
        path: '/favorite',
        builder: (context, state) => FavoritePage(),
      ),
      GoRoute(
        name: 'review',
        path: '/review',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final orderId = extraData?['orderId'] as String? ?? '0';
          final orderRewardId = extraData?['orderRewardId'] as String? ?? '0';
          return RateAndReviewSheet(orderId: orderId, orderRewardId: orderRewardId, );
        }
      ),
      GoRoute(
        name: 'notification',
        path: '/notification',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final messageNotification = extraData?['message'] as RemoteMessage? ?? null;

          return NotificationPage(message: messageNotification,);
        },
      ),
      GoRoute(
        name: 'voucher',
        path: '/voucher',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;

          final isFromCart = extraData?['isFromCart'] as bool? ?? false;
          final isNotification = extraData?['isNotification'] as bool? ?? false;

          return VoucherPage(isFromCart: isFromCart, isFromNotification: isNotification);
        },
      ),

      GoRoute(
        name: 'detail_order_common',
        path: '/detail_order_common/:orderId',
        builder: (context, state) {
          final orderId = state.pathParameters['orderId'] ?? '0';
          final checkoutLink = state.extra is String ? state.extra as String : null;
          return DetailOrderPage(orderId: orderId, linkCheckout: checkoutLink,);
        },
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
        name: 'detail_voucher',
        path: '/detail_voucher/:voucherId',
        builder: (context, state) {
          final voucherId = state.pathParameters['voucherId'];
          return DetailVoucherPage(voucherId: int.parse(voucherId!));
        },
      ),
      GoRoute(
        name: 'cart_common',
        path: '/cart_common',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>?;
          final schedulePickUp = extraData?['schedulePickUp'] as String?;
          return CartPage(schedulePickUp: schedulePickUp,);
        },
      ),
      GoRoute(
        name: 'cart_reward',
        path: '/cart_reward',
        builder: (context, state) => const CartRewardPage(),
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
          final cartItemRewardId = state.extra is String ? state.extra as String : null;
          return DetailProductPage(productRewardId: productRewardId, cartItemRewardId: cartItemRewardId != null ? int.parse(cartItemRewardId) : null, );
        },
      ),

    ],
  );
}
