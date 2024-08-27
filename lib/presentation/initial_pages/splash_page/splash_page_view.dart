import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/constant.dart';
import '../../../common/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  GoRouter? _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _router = GoRouter.of(context);
  }

  // void _clearSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  // }

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    print('PRINT TOKEN AUTH $token');

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (token != null) {
          _router?.goNamed('dashboard', pathParameters: {'pageIndex': '0'});
        } else if (!hasSeenOnboarding) {
          _router?.goNamed('onboard');
        } else {
          _router?.goNamed('login');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Center(
          child: SvgPicture.asset(icLogoPrimary),
        ),
      ),
    );
  }
}


