
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/widgets/box_alert_poin.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/widgets/box_checkout_detail.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/widgets/box_estimation_pickup.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/widgets/box_payment_detail.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/widgets/box_payment_summary.dart';

import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, this.schedulePickUp});

  final String? schedulePickUp;
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    context.read<CartBloc>().add(const CartEvent.getCart());
  }

  Future<void> _refreshData() async {
    context.read<CartBloc>().add(const CartEvent.getCart());
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor50,
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
                    context.goNamed('dashboard', pathParameters: {'pageIndex': '0'});
                  }
                },
              ),
              Text(
                'My Cart',
                style: txtSecondaryHeader.copyWith(fontWeight: FontWeight.w600, color: blackColor),
              ),
              Container(
                width: 40,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: baseColor50,
      body: Stack(
        fit: StackFit.expand,
        children: [
          LiquidPullToRefresh(
            backgroundColor: baseColor,
            color: primaryColor,
            borderWidth: 2,
            showChildOpacityTransition: false,
            onRefresh: _refreshData,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(bottom: 200),
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            BoxEstimationPickup(screenWidth: screenWidth, schedule: widget.schedulePickUp,),
                            const SizedBox(
                              height: 20,
                            ),
                            BoxCheckoutDetail(screenWidth: screenWidth),
                            const SizedBox(
                              height: 20,
                            ),
                            BoxPaymentDetail(screenWidth: screenWidth),
                            BoxAlertPoin(screenWidth: screenWidth),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BoxCheckoutSummary(screenWidth: screenWidth),
          )
        ],
      ),
    );
  }
}

