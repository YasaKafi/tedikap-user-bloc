import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/order_filter.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/shimmer_list_box_order.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'widgets/list_box_order_status.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  Future<void> _refreshData(BuildContext context) async {
    context.read<OrderBloc>().add(const OrderEvent.getFilterOrder('ongoing'));
    context.read<OrderBloc>().add(const OrderEvent.getFilterOrderReward('ongoing'));
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {

    context.read<OrderBloc>().add(const OrderEvent.getFilterOrder('ongoing'));

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: baseColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: baseColor,
          title: Center(
            child: Text(
              'Order',
              style: txtSecondaryHeader.copyWith(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth,
                child: TabBar(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                  ),
                  dividerHeight: 2,
                  dividerColor: grey,
                  indicatorColor: blackColor,
                  labelColor: blackColor,
                  unselectedLabelColor: grey,
                  onTap: (index) {
                    final query = index == 0 ? 'ongoing' : 'history';
                    context.read<OrderBloc>().add(OrderEvent.getFilterOrder(query));
                  },
                  tabs: [
                    Tab(
                      child: Text(
                        'Ongoing',
                        style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'History',
                        style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Tab(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderFilter(
                            query: 'ongoing',
                          ),
                          BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () => Expanded(
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) =>
                                    const ShimmerListBoxMenuStatus(),
                                  ),
                                ),
                                success: (model, modelReward, filterIndex) {
                                  if ((model?.orders == null ||
                                      model?.orders?.isEmpty == true) &&
                                      (modelReward?.orders == null ||
                                          modelReward?.orders?.isEmpty ==
                                              true)) {
                                    return _buildEmptyOrderState(context);
                                  } else {
                                    return Expanded(
                                      child: ListView.builder(
                                        itemCount: filterIndex == 0
                                            ? model?.orders?.length ?? 0
                                            : modelReward?.orders?.length ?? 0,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          if (filterIndex == 0) {
                                            final order = model!.orders![index];

                                            return ListBoxMenuStatus(
                                              status: order.status!,
                                              totalItem: order
                                                  .orderItems!.length
                                                  .toString(),
                                              totalPrice:
                                              order.totalPrice!.toString(),
                                              orderItems: order.orderItems,
                                              createdAt:
                                              order.createdAt.toString(),
                                              orderId: order.id!,
                                            );
                                          } else {
                                            final order =
                                            modelReward!.orders![index];

                                            return ListBoxMenuStatus(
                                              status: order.status!,
                                              totalItem: order
                                                  .orderRewardItems!.length
                                                  .toString(),
                                              totalPrice:
                                              order.totalPoint!.toString(),
                                              orderItemsReward:
                                              order.orderRewardItems,
                                              createdAt:
                                              order.createdAt.toString(),
                                              orderRewardId: order.id!,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  }
                                },
                                error: (message) => _buildErrorState(context, message!)
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderFilter(query: 'history'),
                          BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () => Expanded(
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) =>
                                    const ShimmerListBoxMenuStatus(),
                                  ),
                                ),
                                success: (model, modelReward, filterIndex) {
                                  if ((model?.orders == null ||
                                      model?.orders?.isEmpty == true) &&
                                      (modelReward?.orders == null ||
                                          modelReward?.orders?.isEmpty ==
                                              true)) {
                                    return _buildEmptyOrderState(context);
                                  } else {
                                    return Expanded(
                                      child: ListView.builder(
                                        itemCount: filterIndex == 0
                                            ? model?.orders?.length ?? 0
                                            : modelReward?.orders?.length ?? 0,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          if (filterIndex == 0) {
                                            final order = model!.orders![index];

                                            return ListBoxMenuStatus(
                                              orderId: order.id!,
                                              status: order.status!,
                                              totalItem: order
                                                  .orderItems!.length
                                                  .toString(),
                                              totalPrice: order.totalPrice!
                                                  .toString(),
                                              orderItems: order.orderItems,
                                              createdAt:
                                              order.createdAt.toString(),
                                            );
                                          } else {
                                            final order =
                                            modelReward!.orders![index];

                                            return ListBoxMenuStatus(
                                              status: order.status!,
                                              totalItem: order
                                                  .orderRewardItems!.length
                                                  .toString(),
                                              totalPrice:
                                              order.totalPoint!.toString(),
                                              orderItemsReward:
                                              order.orderRewardItems,
                                              createdAt:
                                              order.createdAt.toString(),
                                              orderRewardId: order.id!,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  }
                                },
                                error: (message) => _buildErrorState(context, message!)
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildErrorState(BuildContext context, String message) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icServerError, width: screenWidth * 0.5),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.7,
              child: Text(
                message,
                style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyOrderState(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icOrderEmpty, width: screenWidth * 0.5),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                children: [
                  Text(
                    'No order placed yet',
                    style: txtPrimaryTitle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'You have not placed an order yet. Please add items to your cart and checkout when you are ready.',
                    style: txtSecondarySubTitle.copyWith(
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
