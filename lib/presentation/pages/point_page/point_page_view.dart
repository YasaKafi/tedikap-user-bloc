import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/global_components/error_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/bloc/point_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/box_information_poin.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/list_box_product_poin.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../home_page/widgets/base_section.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key, this.schedulePickUp});

  final String? schedulePickUp;
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PointBloc _pointBloc;

  @override
  void initState() {
    super.initState();
    _pointBloc = context.read<PointBloc>();
    _pointBloc.isPointFetched = false;
    _tabController = TabController(length: 4, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return; // To avoid triggering when the tab is still changing

      switch (_tabController.index) {
        case 0:
          context.read<PointBloc>().add(const PointEvent.getFilterCategory('tea'));
          break;
        case 1:
          context.read<PointBloc>().add(const PointEvent.getFilterCategory('nontea'));
          break;
        case 2:
          context.read<PointBloc>().add(const PointEvent.getFilterCategory('yakult'));
          break;
          case 3:
          context.read<PointBloc>().add(const PointEvent.getFilterCategory('merchandise'));
          break;
      }
    });

    _fetchInitialData();
  }

  void _fetchInitialData() async {
    context.read<PointBloc>().add(const PointEvent.getFilterCategory('tea'));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    print('DPI NOW $dpi');
    TextStyle textStyleTitle = dpi < 380 ? txtThirdSubTitle : txtSecondarySubTitle;

    return DefaultTabController(
      length: 4,
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
                ButtonCircleIcon(onTap: (){
                  context.goNamed('cart_reward');
                }, icon: icCart, )
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
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: screenWidth,
                child: TabBar(
                  controller: _tabController,
                  dividerHeight: 2,
                  dividerColor: grey,
                  indicatorColor: blackColor,
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
                        context.read<PointBloc>().add(const PointEvent.getFilterCategory('yakult'));
                        break;
                        case 3:
                        context.read<PointBloc>().add(const PointEvent.getFilterCategory('merchandise'));
                        break;
                    }
                  },
                  tabs: [
                    Tab(
                      child: Text('Tea',
                          style: textStyleTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                    Tab(
                      child: Text('Non Tea',
                          style: textStyleTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                    Tab(
                      child: Text('Yakult',
                          style: textStyleTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                    Tab(
                      child: Text('Merchandise',
                          style: textStyleTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: blackColor)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildTabGridViewProduct(screenHeight, screenWidth),
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
        print('CURRENT STATE: $state');
        return state.when(
          initial: () => buildShimmer(screenHeight, screenWidth),
          success: (model, pointModel, ) {
            return GridView.builder(
              itemCount: model!.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final rewardProduct = model.data![index];
                final String priceProduct = rewardProduct.stock == true ? rewardProduct.regularPoint!.toString() : 'Sold out';
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
                    price: priceProduct,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
            );
          },
          loading: () => buildShimmer(screenHeight, screenWidth),
          error: (message) => ErrorWidgetStatic.buildErrorState(context, message!)
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

