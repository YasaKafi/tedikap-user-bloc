
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/onboard_page_view.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/splash_page/splash_page_view.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        name: 'onboard',
        path: '/onboard',
        builder: (context, state) => OnboardPage(),
      ),
    ],
  );
}
