import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/base_section.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/poin_section.dart';

import '../../../common/theme.dart';
import '../../global_components/alert_dialog.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.getUser());
  }

  Future<void> _refreshData() async {
    context.read<HomeBloc>().add(const HomeEvent.getUser(forceRefresh: true));
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        print('onPopInvoked didPop? $didPop');
        if (didPop == false) {
          final shouldPop = await onShowAlertDialog(
            context,
            title: 'Are you sure?',
            desc: 'Do you want to exit the app?',
            textBtn1: 'Cancel',
            textBtn2: 'Exit',
            bgColorBtn1: navyColor,
            bgColorBtn2: redMedium,
            titleStyle: txtPrimaryTitle.copyWith(
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
            descStyle: txtSecondarySubTitle.copyWith(
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
            icon: null,
            onPressed: () => SystemNavigator.pop(),
            bgColor: baseColor,
          );
          return shouldPop; // Return the result of the dialog
        }
      },
      child: Scaffold(
        backgroundColor: baseColor,
        body: LiquidPullToRefresh(
          backgroundColor: baseColor,
          color: primaryColor,
          borderWidth: 2,
          showChildOpacityTransition: false,
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(), // Ensures scrolling is always possible
            child: Stack(
              children: [
                BaseSection(
                  screenWidth: screenWidth,
                ),
                const PoinSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
