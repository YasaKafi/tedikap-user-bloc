import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/empty_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/order_filter.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/shimmer_list_box_order.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/show_filter.dart';

import '../../../common/dimensions.dart';
import '../../global_components/error_state.dart';
import '../../../common/theme.dart';
import 'widgets/list_box_order_status.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    context
        .read<OrderBloc>()
        .add(const OrderEvent.getFilterOrder('ongoing', '', '', ''));
  }

  Future<void> _refreshDataHistory(BuildContext context) async {
    context
        .read<OrderBloc>()
        .add(const OrderEvent.getAllFilterOrder('history', '', '', ''));
    await Future.delayed(Duration(seconds: 1));

  }

  Future<void> _refreshDataOngoing(BuildContext context) async {
    context
        .read<OrderBloc>()
        .add(const OrderEvent.getAllFilterOrder('ongoing', '', '', ''));
    await Future.delayed(Duration(seconds: 1));
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double dpi = MediaQuery.of(context).devicePixelRatio * 160;
    TextStyle textDateStyle = dpi < 380 ? txtSecondarySubTitle : txtPrimarySubTitle;

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
                    context
                        .read<OrderBloc>()
                        .add(OrderEvent.getAllFilterOrder(query, '', '', ''));
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
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Tab(
                      child: LiquidPullToRefresh(
                        backgroundColor: baseColor,
                        color: primaryColor,
                        borderWidth: 2,
                        showChildOpacityTransition: false,
                        onRefresh: () async {
                          // Call your refresh method here
                          await _refreshDataOngoing(context);
                        },
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
                                    success: (model,
                                        modelReward,
                                        filterIndex,
                                        modelReOrder,
                                        modelReOrderReward,
                                        modelReview,
                                        isPesananDitolak,
                                        isPesananDibatalkan,
                                        isPesananSelesai,
                                        startDate,
                                        endDate,
                                        isPesananDitolakReward,
                                        isPesananSelesaiReward,
                                        startDateReward,
                                        endDateReward) {
                                      if ((model?.orders == null ||
                                              model?.orders?.isEmpty == true) && filterIndex == 0) {
                                        return EmptyOrderWidget();
                                      } else if ((modelReward?.orders == null ||
                                          modelReward?.orders?.isEmpty ==
                                              true) && filterIndex == 1) {
                                        return EmptyOrderWidget();

                                      } else {
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount: filterIndex == 0
                                                ? model?.orders?.length ?? 0
                                                : modelReward?.orders?.length ??
                                                    0,
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              if (filterIndex == 0) {

                                                final order =
                                                    model!.orders![index];

                                                final formattedPrice = NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  symbol: 'Rp',
                                                  decimalDigits: 0, // Tidak ada digit desimal
                                                ).format(int.parse(order.totalPrice!
                                                    .toString()));

                                                print('VALUE DARI LINK INVOICE ${order.linkInvoice}');

                                                return ListBoxMenuStatus(
                                                  rating: order.rating ?? 0,
                                                  waLink: order.whatsapp!,
                                                  status: order.status!,
                                                  linkInvoice: order.linkInvoice,
                                                  totalItem: order
                                                      .orderItems!.length
                                                      .toString(),
                                                  totalPrice: formattedPrice,
                                                  orderItems: order.orderItems,
                                                  createdAt:
                                                      order.createdAt.toString(),
                                                  orderId: order.id!,
                                                );
                                              } else {
                                                final order =
                                                modelReward!.orders![index];

                                                return ListBoxMenuStatus(
                                                  rating: order.rating ?? 0,
                                                  waLink: order.whatsapp!,
                                                  status: order.status!,
                                                  totalItem: order
                                                      .orderRewardItems!.length
                                                      .toString(),
                                                  totalPrice: order.totalPoint!.toString(),
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
                                    error: (message) => ErrorWidgetStatic
                                        .buildErrorState(context, message!));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      child: LiquidPullToRefresh(
                        backgroundColor: baseColor,
                        color: primaryColor,
                        borderWidth: 2,
                        showChildOpacityTransition: false,
                        onRefresh: () async {
                          // Call your refresh method here
                          await _refreshDataHistory(context);
                        },
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocBuilder<OrderBloc, OrderState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(orElse: () {
                                      return OrderFilter(
                                        query: 'history',
                                        statusOrder: '',
                                      );
                                    },
                                        success: (model,
                                        modelReward,
                                        filterIndex,
                                        modelReOrder,
                                        modelReOrderReward,
                                        modelReview,
                                        isPesananDitolak,
                                        isPesananDibatalkan,
                                        isPesananSelesai,
                                        startDate,
                                        endDate,
                                        isPesananDitolakReward,
                                        isPesananSelesaiReward,
                                        startDateReward,
                                        endDateReward) {

                                      String startDateText =
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.now()
                                                  .subtract(Duration(days: 365)));
                                      String endDateText =
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now());

                                      String startDateRewardText =
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.now()
                                                  .subtract(Duration(days: 365)));
                                      String endDateRewardText =
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now());

                                      startDateText = startDate != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(startDate)
                                          : startDateText;
                                      endDateText = endDate != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(endDate)
                                          : endDateText;

                                      startDateRewardText = startDateReward != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(startDateReward)
                                          : startDateText;
                                      endDateRewardText = endDateReward != null
                                          ? DateFormat('yyyy-MM-dd')
                                              .format(endDateReward)
                                          : endDateText;

                                      String status = '';

                                      if (filterIndex == 1) {
                                        if (isPesananSelesai == true &&
                                            isPesananDibatalkan == false &&
                                            isPesananDitolak == false) {
                                          status = 'pesanan selesai';
                                        } else if (isPesananDibatalkan == true &&
                                            isPesananSelesai == false &&
                                            isPesananDitolak == false) {
                                          status = 'pesanan dibatalkan';
                                        } else if (isPesananDitolak == true &&
                                            isPesananSelesai == false &&
                                            isPesananDibatalkan == false) {
                                          status = 'pesanan ditolak';
                                        } else if (isPesananSelesai == true &&
                                            isPesananDibatalkan == true &&
                                            isPesananDitolak == false) {
                                          status = 'finished_canceled';
                                        } else if (isPesananSelesai == true &&
                                            isPesananDibatalkan == false &&
                                            isPesananDitolak == true) {
                                          status = 'finished_rejected';
                                        } else if (isPesananSelesai == false &&
                                            isPesananDibatalkan == true &&
                                            isPesananDitolak == true) {
                                          status = 'canceled_rejected';
                                        }
                                      } else if (filterIndex == 0) {
                                        if (isPesananSelesaiReward == true &&
                                            isPesananDitolakReward == false) {
                                          status = 'pesanan selesai';
                                        } else if (isPesananSelesaiReward ==
                                                false &&
                                            isPesananDitolakReward == true) {
                                          status = 'pesanan ditolak';
                                        } else if (isPesananSelesaiReward ==
                                                true &&
                                            isPesananDitolakReward == true) {
                                          status = '';
                                        }
                                      }
                                      return OrderFilter(
                                        query: 'history',
                                        statusOrder:  status ,
                                        startDate: filterIndex == 1 ?  startDateText : startDateRewardText,
                                        endDate: filterIndex == 1 ?  endDateText : endDateRewardText ,
                                      );
                                    });
                                  },
                                ),
                                BlocListener<OrderBloc, OrderState>(
                                  listener: (context, state) {
                                    print('Current state: $state');
                                    state.maybeWhen(
                                        orElse: () {},
                                        success: (model,
                                            modelReward,
                                            filterIndex,
                                            modelReOrder,
                                            modelReOrderReward,
                                            modelReview,
                                            isPesananDitolak,
                                            isPesananDibatalkan,
                                            isPesananSelesai,
                                            startDate,
                                            endDate,
                                            isPesananDitolakReward,
                                            isPesananSelesaiReward,
                                            startDateReward,
                                            endDateReward) {
                                          if (modelReOrder?.cart != null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                'Cart updated successfully!',
                                                style: txtSecondaryTitle.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: baseColor),
                                              ),
                                              backgroundColor: greenMedium,
                                            ));
                                            context.goNamed('cart_common');
                                          }

                                          if (modelReOrderReward?.cart != null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                'Cart updated successfully!',
                                                style: txtSecondaryTitle.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: baseColor),
                                              ),
                                              backgroundColor: greenMedium,
                                            ));
                                            context.goNamed('cart_reward');
                                          }
                                        });
                                  },
                                  child: BlocBuilder<OrderBloc, OrderState>(
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
                                          success: (model,
                                              modelReward,
                                              filterIndex,
                                              modelReOrder,
                                              modelReOrderReward,
                                              modelReview,
                                              isPesananDitolak,
                                              isPesananDibatalkan,
                                              isPesananSelesai,
                                              startDate,
                                              endDate,
                                              isPesananDitolakReward,
                                              isPesananSelesaiReward,
                                              startDateReward,
                                              endDateReward) {
                                            if ((model?.orders == null ||
                                                    model?.orders?.isEmpty ==
                                                        true) &&
                                                (modelReward?.orders == null ||
                                                    modelReward
                                                            ?.orders?.isEmpty ==
                                                        true)) {
                                              return const EmptyOrderWidget();
                                            } else {
                                              return Expanded(
                                                child: ListView.builder(
                                                  itemCount: filterIndex == 0
                                                      ? model?.orders?.length ?? 0
                                                      : modelReward
                                                              ?.orders?.length ??
                                                          0,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (context, index) {
                                                    if (filterIndex == 0) {
                                                      final order =
                                                          model!.orders![index];

                                                      final formattedPrice = NumberFormat.currency(
                                                        locale: 'id_ID',
                                                        symbol: 'Rp',
                                                        decimalDigits: 0, // Tidak ada digit desimal
                                                      ).format(int.parse(order.totalPrice!
                                                          .toString()));

                                                      String formatDate(String dateString) {
                                                        DateTime date = DateTime.parse(dateString);
                                                        String formattedDate = DateFormat('d MMMM yyyy • HH.mm').format(date);
                                                        return formattedDate;
                                                      }


                                                      return ListBoxMenuStatus(
                                                        pickUpTime: formatDate(order.updatedAt.toString()),
                                                        rating: order.rating ?? 0,
                                                        orderId: order.id!,
                                                        status: order.status!,
                                                        totalItem: order
                                                            .orderItems!.length
                                                            .toString(),
                                                        totalPrice: formattedPrice,
                                                        orderItems:
                                                            order.orderItems,
                                                        waLink:
                                                            order.whatsapp!,
                                                        createdAt: order.createdAt
                                                            .toString(),
                                                      );
                                                    } else {
                                                      final order = modelReward!
                                                          .orders![index];

                                                      String formatDate(String dateString) {
                                                        DateTime date = DateTime.parse(dateString);
                                                        String formattedDate = DateFormat('d MMMM yyyy • HH.mm').format(date);
                                                        return formattedDate;
                                                      }
                                                      return ListBoxMenuStatus(
                                                        pickUpTime: formatDate(order.updatedAt.toString()),
                                                        rating: order.rating ?? 0,
                                                        waLink: order.whatsapp!,
                                                        status: order.status!,
                                                        totalItem: order
                                                            .orderRewardItems!
                                                            .length
                                                            .toString(),
                                                        totalPrice: order
                                                            .totalPoint!
                                                            .toString(),
                                                        orderItemsReward: order
                                                            .orderRewardItems,
                                                        createdAt: order.createdAt
                                                            .toString(),
                                                        orderRewardId: order.id!,
                                                      );
                                                    }
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                          error: (message) => ErrorWidgetStatic
                                              .buildErrorState(context, message!));
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    ShowFilter showFilter = ShowFilter(context: context, tapIndex: 1, query: 'history', mounted, titleDateStyle: textDateStyle);
                                    showFilter.call();
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 20,
                                            height: 20,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 3),
                                            decoration: BoxDecoration(
                                                color: baseColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: SvgPicture.asset(
                                              icFilter,
                                              width: 18,
                                              height: 18,
                                              color: primaryColor,
                                            )),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'Filter',
                                          style: txtSecondarySubTitle.copyWith(
                                              color: baseColor,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
