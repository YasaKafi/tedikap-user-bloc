import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/base_section.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/poin_section.dart';

import '../../../common/theme.dart';
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

    return Scaffold(
      backgroundColor: baseColor,
      body: RefreshIndicator(
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
    );
  }
}
