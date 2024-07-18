import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/order_filter.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../widgets/list_box_order_status.dart';
import '../widgets/list_box_order_status_over.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<OrderBloc>().add(OrderEvent.getAllHistoryOrder());
    context.read<OrderBloc>().add(OrderEvent.getAllHistoryOrderReward());
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
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge,
                  ),
                  dividerHeight: 2,
                  dividerColor: grey,
                  indicatorColor: blackColor,
                  labelColor: blackColor,
                  unselectedLabelColor: grey,
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
                        children: [
                          OrderFilter(),
                          BlocBuilder<OrderBloc, OrderState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                loading: () => Center(
                                  child: CircularProgressIndicator(),
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
                                          return InkWell(
                                            onTap: () {
                                              context.pushNamed('detail_order_reward', pathParameters: {'orderRewardId': order.id!});},
                                            child: ListBoxMenuStatus(
                                              status: order.status!,
                                              totalItem: order.orderRewardItems!.length
                                                  .toString(),
                                              totalPrice: order.totalPoint!
                                                  .toString(),
                                              orderItemsReward: order.orderRewardItems,
                                              createdAt: order.createdAt.toString(),
                                            ),
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
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: ListBoxMenuStatusOver(),
                          );
                        },
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
