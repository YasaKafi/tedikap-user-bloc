import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/bloc/point_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/box_information_poin.dart';
import 'package:tedikap_user_bloc/presentation/pages/point_page/widgets/list_box_product_poin.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../home_page/widgets/base_section.dart';
import '../menu_page/widgets/list_box_product_menu.dart';

class PointPage extends StatelessWidget {
  const PointPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PointBloc>().add(PointEvent.getFilterCategory('tea'));
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                      context.pop();
                    },
                  ),
                  Text(
                    'TEDIKAPwards',
                    style: txtSecondaryHeader.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),
                  ),
                  ButtonCircleIcon(routes: '', icon: icCart)
                ],
              ),
            ),
          ),
          body: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              width: screenWidth,
              height: screenHeight,
              child: Column(
                children: [
                  BoxInformationPoin(screenWidth: screenWidth),
                  SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<PointBloc, PointState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () =>
                            Center(child: CircularProgressIndicator()),
                        success: (model) {
                          return Container(
                            width: screenWidth,
                            child: BlocBuilder<PointBloc, PointState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Center(
                                      child: CircularProgressIndicator()),
                                  success: (model) {
                                    return TabBar(
                                      indicatorPadding:
                                          EdgeInsets.symmetric(
                                              horizontal: -10, vertical: 5),
                                      indicator: BoxDecoration(
                                        border:
                                            Border.all(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.paddingSizeLarge,
                                      ),
                                      dividerHeight: 2,
                                      dividerColor: Colors.transparent,
                                      indicatorColor: Colors.transparent,
                                      labelColor: blackColor,
                                      unselectedLabelColor: grey,
                                      onTap: (index) {
                                        switch (index) {
                                          case 0:
                                            context.read<PointBloc>().add(
                                                PointEvent
                                                    .getFilterCategory(
                                                        'tea'));
                                            break;
                                          case 1:
                                            context.read<PointBloc>().add(
                                                PointEvent
                                                    .getFilterCategory(
                                                        'nontea'));
                                            break;
                                          case 2:
                                            context.read<PointBloc>().add(
                                                PointEvent
                                                    .getFilterCategory(
                                                        'snack'));
                                            break;
                                        }
                                      },
                                      tabs: [

                                        Tab(
                                          child: Text('Tea',
                                              style: txtPrimarySubTitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: blackColor)),
                                        ),
                                        Tab(
                                          child: Text('Non Tea',
                                              style: txtPrimarySubTitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: blackColor)),
                                        ),
                                        Tab(
                                          child: Text('Snack',
                                              style: txtPrimarySubTitle
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: blackColor)),
                                        ),
                                      ],
                                    );
                                  },
                                  loading: () => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  error: (message) => Center(
                                    child: Text(
                                      message!,
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        loading: () =>
                            Center(child: CircularProgressIndicator()),
                        error: (message) => Center(
                          child: Text(
                            message!,
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor),
                          ),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildTabGridViewProduct(
                            screenHeight, screenWidth),
                        buildTabGridViewProduct(
                            screenHeight, screenWidth),
                        buildTabGridViewProduct(
                            screenHeight, screenWidth),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget buildTabGridViewProduct(double screenHeight, double screenWidth) {
    return BlocBuilder<PointBloc, PointState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(child: CircularProgressIndicator()),
          success: (model) {
            return Tab(
                child: GridView.builder(
              itemCount: model!.data!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final rewardProduct = model!.data![index];
                // final imageUrl =
                // rewardProduct.image!;
                return InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.DETAIL_PRODUCT_PAGE, arguments: {'source': 'point', 'productId': rewardProduct.id});
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
            ));
          },
          loading: () => Center(child: CircularProgressIndicator()),
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
}
