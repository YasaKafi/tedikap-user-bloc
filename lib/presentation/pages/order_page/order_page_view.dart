import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/bloc/order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/order_filter.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/shimmer_list_box_order.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../global_components/common_button.dart';
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

  // Future<void> _refreshData(BuildContext context) async {
  //   context
  //       .read<OrderBloc>()
  //       .add(const OrderEvent.getFilterOrder('ongoing', ''));
  //   context
  //       .read<OrderBloc>()
  //       .add(const OrderEvent.getFilterOrderReward('ongoing', ''));
  //   await Future.delayed(Duration(seconds: 1));
  // }

  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate, required int filterIndex}) async {
    DateTime initialDate = isStartDate
        ? DateTime.now().subtract(const Duration(days: 365))
        : DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // header background color
              onPrimary: baseColor, // header text color
              onSurface: blackColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isStartDate) {
        filterIndex == 0
            ? context.read<OrderBloc>().add(OrderEvent.setStartDate(picked))
            : context
                .read<OrderBloc>()
                .add(OrderEvent.setStartDateReward(picked));
      } else {
        filterIndex == 0
            ? context.read<OrderBloc>().add(OrderEvent.setEndDate(picked))
            : context
                .read<OrderBloc>()
                .add(OrderEvent.setEndDateReward(picked));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    context
                        .read<OrderBloc>()
                        .add(OrderEvent.getFilterOrder(query, '', '', ''));
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
                                  success: (model,
                                      modelReward,
                                      filterIndex,
                                      modelReOrder,
                                      modelReOrderReward,
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
                                              : modelReward?.orders?.length ??
                                                  0,
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            if (filterIndex == 0) {
                                              final order =
                                                  model!.orders![index];

                                              return ListBoxMenuStatus(
                                                waLink: order.whatsappLink!,
                                                status: order.status!,
                                                totalItem: order
                                                    .orderItems!.length
                                                    .toString(),
                                                totalPrice: order.totalPrice!
                                                    .toString(),
                                                orderItems: order.orderItems,
                                                createdAt:
                                                    order.createdAt.toString(),
                                                orderId: order.id!,
                                              );
                                            } else {
                                              final order =
                                                  modelReward!.orders![index];

                                              return ListBoxMenuStatus(
                                                waLink: order.whatsapp!,
                                                status: order.status!,
                                                totalItem: order
                                                    .orderRewardItems!.length
                                                    .toString(),
                                                totalPrice: order.totalPoint!
                                                    .toString(),
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
                                  error: (message) =>
                                      _buildErrorState(context, message!));
                            },
                          ),
                        ],
                      ),
                    ),
                    Tab(
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
                                  }, success: (model,
                                      modelReward,
                                      filterIndex,
                                      modelReOrder,
                                      modelReOrderReward,
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

                                    startDateText = startDate != null
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(startDate)
                                        : startDateText;
                                    endDateText = endDate != null
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(endDate)
                                        : endDateText;

                                    String startDateTextReward = DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now().subtract(Duration(days: 365)));
                                    String endDateTextReward =
                                    DateFormat('yyyy-MM-dd').format(DateTime.now());

                                    startDateTextReward = startDateReward != null
                                        ? DateFormat('yyyy-MM-dd').format(startDateReward)
                                        : startDateTextReward;
                                    endDateTextReward = endDateReward != null
                                        ? DateFormat('yyyy-MM-dd').format(endDateReward)
                                        : endDateTextReward;

                                    String status = '';
                                    String statusReward = '';

                                    if (filterIndex == 0) {
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
                                    } else {
                                      if (isPesananSelesaiReward == true &&
                                          isPesananDitolakReward == false) {
                                        statusReward = 'pesanan selesai';
                                      } else if (isPesananSelesaiReward ==
                                              false &&
                                          isPesananDitolakReward == true) {
                                        statusReward = 'pesanan ditolak';
                                      } else if (isPesananSelesaiReward ==
                                              true &&
                                          isPesananDitolakReward == true) {
                                        statusReward = '';
                                      }
                                    }

                                    print('VALUE CURRENT STATUS ORDER COMMON $status');
                                    print('VALUE CURRENT STATUS ORDER REWARD $statusReward');

                                    return OrderFilter(
                                      query: 'history',
                                      statusOrder:  status ,
                                      startDate:  startDateText ,
                                      endDate:  endDateText ,
                                      statusOrderReward: statusReward,
                                      startDateReward: startDateTextReward,
                                      endDateReward: endDateTextReward,
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
                                            return _buildEmptyOrderState(
                                                context);
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

                                                    return ListBoxMenuStatus(
                                                      orderId: order.id!,
                                                      status: order.status!,
                                                      totalItem: order
                                                          .orderItems!.length
                                                          .toString(),
                                                      totalPrice: order
                                                          .totalPrice!
                                                          .toString(),
                                                      orderItems:
                                                          order.orderItems,
                                                      waLink:
                                                          order.whatsappLink!,
                                                      createdAt: order.createdAt
                                                          .toString(),
                                                    );
                                                  } else {
                                                    final order = modelReward!
                                                        .orders![index];

                                                    return ListBoxMenuStatus(
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
                                        error: (message) => _buildErrorState(
                                            context, message!));
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
                                  _showFilter(context, 1, 'history');
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

  void _showFilter(BuildContext context, int? tapIndex, String query) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: EdgeInsets.only(top: 10.0),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.maybeWhen(

                  orElse: () {
                String startDateText = DateFormat('yyyy-MM-dd')
                    .format(DateTime.now().subtract(Duration(days: 365)));
                String endDateText =
                    DateFormat('yyyy-MM-dd').format(DateTime.now());
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              width: 50,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Visibility(
                                visible: tapIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Menunggu pembayaran',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        tristate: true,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleInfo(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Menunguu dikonfirmasi',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        tristate: true,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleInfo(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pesanan diproses',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        tristate: true,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleInfo(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pesanan siap diambil',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        tristate: true,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleInfo(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Selesai',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleInfo(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Dibatalkan',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleVoucher(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ditolak',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: true,
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          // context.read<NotificationBloc>().add(
                                          //     NotificationEvent.toggleVoucher(
                                          //         newValue, newValue));
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Periode Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    // onTap: () =>
                                    //     _selectDate(context, isStartDate: true),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mulai',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                startDateText,
                                                style:
                                                    txtPrimarySubTitle.copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  InkWell(
                                    // onTap: () =>
                                    //     _selectDate(context, isStartDate: false),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Berakhir',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                endDateText,
                                                style:
                                                    txtPrimarySubTitle.copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            borderColor: blackColor,
                            borderWidth: 1,
                            text: 'Reset',
                            onPressed: () {
                              // context.read<NotificationBloc>().add(NotificationEvent.resetFilters());
                              Future.delayed(Duration(seconds: 2), () {
                                context.pop();
                              });
                            },
                            backgroundColor: baseColor,
                            textColor: blackColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            text: 'Terapkan',
                            onPressed: () {


                              Navigator.pop(context);
                            },
                            backgroundColor: primaryColor,
                            textColor: baseColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }, success: (model,
                  modelReward,
                  filterIndex,
                  modelReOrder,
                  modelReOrderReward,
                  isPesananDitolak,
                  isPesananDibatalkan,
                  isPesananSelesai,
                  startDate,
                  endDate,
                  isPesananDitolakReward,
                  isPesananSelesaiReward,
                  startDateReward,
                  endDateReward) {
                String startDateText = DateFormat('yyyy-MM-dd')
                    .format(DateTime.now().subtract(Duration(days: 365)));
                String endDateText =
                    DateFormat('yyyy-MM-dd').format(DateTime.now());

                startDateText = startDate != null
                    ? DateFormat('yyyy-MM-dd').format(startDate)
                    : startDateText;
                endDateText = endDate != null
                    ? DateFormat('yyyy-MM-dd').format(endDate)
                    : endDateText;

                String startDateTextReward = DateFormat('yyyy-MM-dd')
                    .format(DateTime.now().subtract(Duration(days: 365)));
                String endDateTextReward =
                    DateFormat('yyyy-MM-dd').format(DateTime.now());

                startDateTextReward = startDateReward != null
                    ? DateFormat('yyyy-MM-dd').format(startDateReward)
                    : startDateTextReward;
                endDateTextReward = endDateReward != null
                    ? DateFormat('yyyy-MM-dd').format(endDateReward)
                    : endDateTextReward;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              width: 50,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Selesai',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                      value: filterIndex == 0
                                          ? (isPesananSelesai ?? true)
                                          : (isPesananSelesaiReward ?? true),
                                      activeColor: primaryColor,
                                      onChanged: (newValue) {
                                        filterIndex == 0
                                            ? context.read<OrderBloc>().add(
                                                OrderEvent.togglePesananSelesai(
                                                    newValue))
                                            : context.read<OrderBloc>().add(
                                                OrderEvent
                                                    .togglePesananSelesaiReward(
                                                        newValue));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: filterIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Dibatalkan',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: isPesananDibatalkan ?? false,
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          context.read<OrderBloc>().add(
                                              OrderEvent
                                                  .togglePesananDibatalkan(
                                                      newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ditolak',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: filterIndex == 0
                                            ? (isPesananDitolak ?? true)
                                            : (isPesananDitolakReward ?? true),
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          filterIndex == 0
                                              ? context.read<OrderBloc>().add(
                                                  OrderEvent
                                                      .togglePesananDitolak(
                                                          newValue))
                                              : context.read<OrderBloc>().add(
                                                  OrderEvent
                                                      .togglePesananDitolakReward(
                                                          newValue));
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Periode Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => filterIndex == 0
                                        ? _selectDate(context,
                                            isStartDate: true, filterIndex: 0)
                                        : _selectDate(context,
                                            isStartDate: true, filterIndex: 1),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mulai',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                startDateText,
                                                style:
                                                    txtPrimarySubTitle.copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () => filterIndex == 0
                                        ? _selectDate(context,
                                            isStartDate: false, filterIndex: 0)
                                        : _selectDate(context,
                                            isStartDate: false, filterIndex: 1),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Berakhir',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                endDateText,
                                                style:
                                                    txtPrimarySubTitle.copyWith(
                                                        color: blackColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            borderColor: blackColor,
                            borderWidth: 1,
                            text: 'Reset',
                            onPressed: () {
                              // context.read<NotificationBloc>().add(NotificationEvent.resetFilters());
                              Future.delayed(Duration(seconds: 2), () {
                                context.pop();
                              });
                            },
                            backgroundColor: baseColor,
                            textColor: blackColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonButton(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            text: 'Terapkan',
                            onPressed: () {
                              print(
                                  'isPesananSelesaiReward: $isPesananSelesaiReward, isPesananDitolakReward: $isPesananDitolakReward');
                              if (filterIndex == 0) {
                                if (isPesananSelesai == true &&
                                    isPesananDibatalkan == true &&
                                    isPesananDitolak == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: ''));
                                } else if (isPesananSelesai == true &&
                                    isPesananDibatalkan == false &&
                                    isPesananDitolak == false) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'pesanan selesai',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                } else if (isPesananSelesai == false &&
                                    isPesananDibatalkan == true &&
                                    isPesananDitolak == false) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'pesanan dibatalkan',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                } else if (isPesananSelesai == false &&
                                    isPesananDibatalkan == false &&
                                    isPesananDitolak == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'pesanan ditolak',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                } else if (isPesananSelesai == true &&
                                    isPesananDibatalkan == true &&
                                    isPesananDitolak == false) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'finished_canceled',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                } else if (isPesananSelesai == true &&
                                    isPesananDibatalkan == false &&
                                    isPesananDitolak == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'finished_rejected',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                } else if (isPesananSelesai == false &&
                                    isPesananDibatalkan == true &&
                                    isPesananDitolak == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrder: 'canceled_rejected',
                                          startDate: startDateText,
                                          endDate: endDateText));
                                }
                              } else if (filterIndex == 1) {
                                if (isPesananSelesaiReward == true &&
                                    isPesananDitolakReward == false) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrderReward: 'pesanan selesai',
                                          startDateReward: startDateTextReward,
                                          endDateReward: endDateTextReward));
                                } else if (isPesananSelesaiReward == false &&
                                    isPesananDitolakReward == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrderReward: 'pesanan ditolak',
                                          startDateReward: startDateTextReward,
                                          endDateReward: endDateTextReward));
                                  print(
                                      'INI VALUE $query dan VALUE START DATE $startDateTextReward');
                                } else if (isPesananSelesaiReward == true &&
                                    isPesananDitolakReward == true) {
                                  context.read<OrderBloc>().add(
                                      OrderEvent.doFilterOrder(
                                          filterIndex: filterIndex,
                                          query: query,
                                          statusOrderReward: '',
                                          startDateReward: startDateTextReward,
                                          endDateReward: endDateTextReward));
                                }
                              }

                              Navigator.pop(context);
                            },
                            backgroundColor: primaryColor,
                            textColor: baseColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        );
      },
    );
  }
}
