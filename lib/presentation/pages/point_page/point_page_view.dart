import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/bloc/point_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/box_information_poin.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/list_box_product_poin.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../home_page/widgets/base_section.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  void _fetchInitialData() {
    context.read<PointBloc>().add(const PointEvent.getFilterCategory('tea'));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: baseColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: screenHeight,
            decoration: const BoxDecoration(
              color: baseColor,
            ),
            padding: const EdgeInsets.only(
                top: 30, bottom: 10, left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      context.pop();
                    } else {
                      context.goNamed('dashboard',
                          pathParameters: {'pageIndex': '0'});
                    }
                  },
                ),
                Text(
                  'TEDIKAPwards',
                  style: txtSecondaryHeader.copyWith(
                      fontWeight: FontWeight.w600, color: blackColor),
                ),
                ButtonCircleIcon(routes: 'cart_reward', icon: icCart)
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              BoxInformationPoin(screenWidth: screenWidth),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: screenWidth,
                child: TabBar(
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: -10, vertical: 5),
                  indicator: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                  ),
                  dividerHeight: 2,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelColor: blackColor,
                  unselectedLabelColor: grey,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        context.read<PointBloc>().add(const PointEvent.getFilterCategory('tea'));
                        break;
                      case 1:
                        context.read<PointBloc>().add(const PointEvent.getFilterCategory('nontea'));
                        break;
                      case 2:
                        context.read<PointBloc>().add(const PointEvent.getFilterCategory('snack'));
                        break;
                    }
                  },
                  tabs: [
                    Tab(
                      child: Text('Tea',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                    Tab(
                      child: Text('Non Tea',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                    Tab(
                      child: Text('Snack',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildTabGridViewProduct(screenHeight, screenWidth),
                    buildTabGridViewProduct(screenHeight, screenWidth),
                    buildTabGridViewProduct(screenHeight, screenWidth),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabGridViewProduct(double screenHeight, double screenWidth) {
    return BlocBuilder<PointBloc, PointState>(
      builder: (context, state) {
        return state.when(
          initial: () => buildShimmer(screenHeight, screenWidth),
          success: (model, pointModel, ) {
            return GridView.builder(
              itemCount: model!.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final rewardProduct = model.data![index];
                return InkWell(
                  onTap: () {
                    context.pushNamed('detail_product_reward', pathParameters: {
                      'productRewardId': rewardProduct.id!.toString()
                    });
                  },
                  child: ListBoxProductPoin(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    image: rewardProduct.image!,
                    category: rewardProduct.category!,
                    title: rewardProduct.name!,
                    price: rewardProduct.largePoint!,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            );
          },
          loading: () => buildShimmer(screenHeight, screenWidth),
          error: (message) => Center(
            child: Text(
              message!,
              style: txtSecondaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmer(double screenHeight, double screenWidth) {
    return GridView.builder(
      itemCount: 6, // Number of shimmer items to display
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: screenHeight * 0.2,
                width: screenWidth * 0.4,
                color: grey,
              ),
              Container(
                margin: const EdgeInsets.all(5),
                height: 30,
                width: screenWidth * 0.3,
                color: grey,
              ),
            ],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}

