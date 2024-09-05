import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_kind_of_payment.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_order_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_payment_order_detail.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_status_order.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_timeline_pickup.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/section_button.dart';


import '../../../../../common/theme.dart';

class DetailOrderPage extends StatefulWidget {
  final String? orderId;
  final String? orderRewardId;
  final String? linkCheckout;

  const DetailOrderPage({super.key, this.orderId, this.orderRewardId, this.linkCheckout});

  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    if (widget.orderId != null) {
      WidgetsBinding.instance.addObserver(this);
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrder(widget.orderId!));
    }

    if (widget.orderRewardId != null) {
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrderReward(widget.orderRewardId!));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        if (widget.orderId != null) {
          WidgetsBinding.instance.addObserver(this);
          context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrder(widget.orderId!));
        }

        if (widget.orderRewardId != null) {
          context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrderReward(widget.orderRewardId!));
        }
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _refreshData() async {
    if (widget.orderId != null) {
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrder(widget.orderId!));
    }

    if (widget.orderRewardId != null) {
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrderReward(widget.orderRewardId!));
    }
    await Future.delayed(const Duration(seconds: 1));
  }



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: baseColor50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor,
          ),
          padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
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
                    context.goNamed('dashboard', pathParameters: {'pageIndex': '2'});
                  }
                },
              ),
              Text(
                'Order Status Detail',
                style: txtSecondaryHeader.copyWith(fontWeight: FontWeight.w600, color: blackColor),
              ),
              Container(
                width: 40,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          LiquidPullToRefresh(
            backgroundColor: baseColor,
            color: primaryColor,
            borderWidth: 2,
            showChildOpacityTransition: false,
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    BoxInfoStatus(screenWidth: screenWidth),
                    const SizedBox(height: 20),
                    BoxTimelinePickup(screenWidth: screenWidth),
                    const SizedBox(height: 20),
                    BoxProductOrder(screenWidth: screenWidth),
                    const SizedBox(height: 20),
                    BoxPaymentDetailOrder(screenWidth: screenWidth),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: widget.orderRewardId == null,
                        child: BoxKindOfPayment(screenWidth: screenWidth)),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SectionButton(linkCheckout: widget.linkCheckout, orderId: widget.orderId, orderRewardId: widget.orderRewardId),
          ),
        ],
      ),
    );
  }
}

