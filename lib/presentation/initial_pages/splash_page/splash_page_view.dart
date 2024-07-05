import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/constant.dart';
import '../../../common/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),);
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Center(
            child: SvgPicture.asset(icLogoPrimary)
        ),
      ),
    );
  }
}
