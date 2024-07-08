
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/login_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/onboard_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/register_page/register_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/splash_page/splash_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/help_center_page/view/help_center_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/language_setting_page/language_setting_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/setting_page/setting_page_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/terms_of_serive_page/terms_of_serive_view.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/profile_page_view.dart';

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
    ],
  );
}
