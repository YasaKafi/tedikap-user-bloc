import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_user_bloc/common/constant.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../bloc/detail_order_bloc.dart';

class BoxKindOfPayment extends StatelessWidget {
  const BoxKindOfPayment({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
        builder: (context, state) {
          return state.when(
              initial: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: () =>
                  Center(
                    child:
                    CircularProgressIndicator(),
                  ),
              success: (model, modelReward) {
                if (model != null) {
                  final order = model.order!;
                  String? logoPayment;

                  if (order.paymentChannel == 'DANA'){
                    logoPayment = icDana;
                  } else if (order.paymentChannel == 'SHOPEEPAY'){
                    logoPayment = icShopee;
                  } else if (order.paymentChannel == 'OVO'){
                    logoPayment = icOvo;
                  } else if (order.paymentChannel == 'LINKAJA'){
                    logoPayment = icLinkAja;
                  } else if (order.paymentChannel == 'ASTRAPAY'){
                    logoPayment = icAstraPay;
                  } else if (order.paymentChannel == 'JENIUSPAY'){
                    logoPayment = icJeniusPay;
                  } else if (order.paymentChannel == 'QRIS'){
                    logoPayment = icQris;
                  }

                  if (order.paymentChannel != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Metode Pembayaran',
                            style: txtPrimaryTitle.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(logoPayment!, width: 24,),
                                SizedBox(width: 5,),
                                Text(order.paymentChannel ?? '',
                                    style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor)),
                              ],
                            ),
                            Text('Rp ${order.totalPrice}',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor)),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Center();
                  }
                } else if (modelReward != null) {
                  return Center();
                } else {
                  return Center(child: Text('No data available'),);
                }
              },
              error: (message) =>
                  Center(
                    child: Text(message!),
                  ));
        },
      ),
    );
  }
}
