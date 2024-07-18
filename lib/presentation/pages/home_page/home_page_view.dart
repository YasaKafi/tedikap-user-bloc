import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/base_section.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/poin_section.dart';

import '../../../common/theme.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeEvent.getUser());
    Future.delayed(Duration(seconds: 2), () {
      context.read<HomeBloc>().add(HomeEvent.getProduct());
    });

    double screenWidth = MediaQuery.of(context).size.width;

    Future<void> _refreshData() async {
      context.read<HomeBloc>().add(HomeEvent.getUser());
      Future.delayed(Duration(seconds: 2), () {
        context.read<HomeBloc>().add(HomeEvent.getProduct());
      });
      // You can add a delay if needed to simulate the fetch time
      await Future.delayed(Duration(seconds: 1));
    }

    return Scaffold(
      backgroundColor: baseColor,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(), // Ensures scrolling is always possible
          child: Stack(
            children: [
              BaseSection(
                screenWidth: screenWidth,
              ),
              PoinSection(),
            ],
          ),
        ),
      ),
    );
  }
}
