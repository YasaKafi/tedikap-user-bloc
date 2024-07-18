import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../bloc/detail_order_bloc.dart';

class BoxPaymentDetailOrder extends StatelessWidget {
  const BoxPaymentDetailOrder({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding:
      EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan Pembayaran', style: txtPrimaryTitle.copyWith(
              fontWeight: FontWeight.w600, color: blackColor)),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<DetailOrderBloc, DetailOrderState>(
            builder: (context, state) {
              return state.when(
                  initial: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  loading: () => Center(
                    child:
                    CircularProgressIndicator(),
                  ),
                  success: (model, modelReward) {
                    if(model != null ){
                      final order = model.order!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', style: txtPrimarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500, color: blackColor)),
                              Text('Rp ${order.originalPrice}',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: blackColor)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Diskon', style: txtPrimarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500, color: redMedium)),
                              Text('- Rp ${order.discountAmount}',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: redMedium)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1,
                            color: grey,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Pembayaran',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                              Text('Rp ${order.totalPrice}',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                            ],
                          ),
                        ],
                      );

                    } else if(modelReward != null){
                      final order = modelReward.order!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', style: txtPrimarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500, color: blackColor)),
                              Text('${order.totalPoint} Point',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: blackColor)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1,
                            color: grey,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Pembayaran',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                              Text('Rp ${order.totalPoint} Point',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('No data available'),);
                    }

                  },
                  error: (message) => Center(
                    child: Text(message!),
                  ));
            },
          ),

        ],
      ),
    );
  }
}