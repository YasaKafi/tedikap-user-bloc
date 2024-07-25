import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/order_filter.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/shimmer_list_box_order.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'widgets/list_box_order_status.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderBloc>().add(const OrderEvent.getFilterOrder('ongoing'));
    });
    context.read<OrderBloc>().add(const OrderEvent.getAllHistoryOrderReward());
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
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Container(
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
                    switch (index) {
                      case 0:
                        context.read<OrderBloc>().add(
                            const OrderEvent.getFilterOrder('ongoing'));
                        break;
                      case 1:
                        context.read<OrderBloc>().add(
                            const OrderEvent.getFilterOrder('history'));
                        break;
                    }
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
                          OrderFilter(query: 'ongoing',),
                          BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () =>  Expanded(
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) => const  ShimmerListBoxMenuStatus(),
                                  ),
                                ),
                                success: (model, modelReward, filterIndex) {

                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: filterIndex == 0 ? model!.orders!.length : modelReward!.orders!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        if(filterIndex == 0){
                                          final order = model!.orders![index];
                                          return ListBoxMenuStatus(
                                            status: order.status!,
                                            totalItem: order.orderItems!.length
                                                .toString(),
                                            totalPrice: order.totalPrice!
                                                .toString(),
                                            orderItems: order.orderItems,
                                            createdAt: order.createdAt.toString(),
                                              orderId: order.id!
                                          );

                                        } else {
                                          final order = modelReward!.orders![index];
                                          return ListBoxMenuStatus(
                                            status: order.status!,
                                            totalItem: order.orderRewardItems!.length
                                                .toString(),
                                            totalPrice: order.totalPoint!
                                                .toString(),
                                            orderItemsReward: order.orderRewardItems,
                                            createdAt: order.createdAt.toString(), orderRewardId: order.id!,
                                          );
                                        }

                                      },
                                    ),
                                  );
                                },
                                error: (message) => Center(
                                  child: Text(message!),
                                ),
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
                                    itemBuilder: (context, index) => const ShimmerListBoxMenuStatus(),
                                  ),
                                ),
                                success: (model, modelReward, filterIndex) {

                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: filterIndex == 0 ? model!.orders!.length : modelReward!.orders!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        if(filterIndex == 0){
                                          final order = model!.orders![index];
                                          return InkWell(
                                            onTap: () {
                                              context.pushNamed('detail_order_common', pathParameters: {'orderId': order.id!});
                                            },
                                            child: ListBoxMenuStatus(
                                              orderId: order.id!,
                                              status: order.status!,
                                              totalItem: order.orderItems!.length
                                                  .toString(),
                                              totalPrice: order.totalPrice!
                                                  .toString(),
                                              orderItems: order.orderItems,
                                              createdAt: order.createdAt.toString(),
                                            ),
                                          );

                                        } else {
                                          final order = modelReward!.orders![index];
                                          return ListBoxMenuStatus(
                                            status: order.status!,
                                            totalItem: order.orderRewardItems!.length
                                                .toString(),
                                            totalPrice: order.totalPoint!
                                                .toString(),
                                            orderItemsReward: order.orderRewardItems,
                                            createdAt: order.createdAt.toString(),
                                            orderRewardId: order.id,
                                          );
                                        }

                                      },
                                    ),
                                  );
                                },
                                error: (message) => Center(
                                  child: Text(message!),
                                ),
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
}
