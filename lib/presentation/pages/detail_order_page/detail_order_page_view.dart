import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_kind_of_payment.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_order_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_payment_order_detail.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_status_order.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/box_timeline_pickup.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/section_button.dart';


import '../../../../../common/theme.dart';
import '../../../common/dimensions.dart';

class DetailOrderPage extends StatelessWidget {
  DetailOrderPage({super.key , this.orderId, this.orderRewardId, this.linkCheckout});

  String? orderId;
  String? orderRewardId;
  String? linkCheckout;

  @override
  Widget build(BuildContext context) {
    if (orderId != null) {
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrder(orderId!));
    }
    if (orderRewardId != null) {
      context.read<DetailOrderBloc>().add(DetailOrderEvent.getDetailHistoryOrderReward(orderRewardId!));
    }
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
          padding:
          const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (Navigator.canPop(context)){
                  context.pop();
                  } else {
                    context.goNamed('dashboard', pathParameters: {'pageIndex': '2'});
                  }

                },
              ),
              Text(
                'Detail Status Order',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  BoxInfoStatus(screenWidth: screenWidth),
                  SizedBox(height: 20,),
                  BoxTimelinePickup(screenWidth: screenWidth,),
                  SizedBox(height: 20,),
                  BoxProductOrder(screenWidth: screenWidth,),
                  SizedBox(height: 20,),
                  BoxPaymentDetailOrder(screenWidth: screenWidth),
                  SizedBox(height: 20,),
                  BoxKindOfPayment(screenWidth: screenWidth),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),

          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SectionButton(linkCheckout: linkCheckout ,)
          ),
        ],
      ),

    );
  }
}
