import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                            Text(order.paymentChannel ?? '',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor)),
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
                  final order = modelReward!.order!;
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
