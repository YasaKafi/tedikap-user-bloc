import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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
      padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ringkasan Pembayaran', style: txtPrimaryTitle.copyWith(
              fontWeight: FontWeight.w600, color: blackColor)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: txtPrimarySubTitle.copyWith(
                  fontWeight: FontWeight.w500, color: blackColor)),
              BlocBuilder<DetailOrderBloc, DetailOrderState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                    ),
                    loading: () => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                    ),
                    success: (model, modelReward) {
                      if (model != null) {
                        final order = model.order!;
                        final formattedPriceCommon = NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp',
                          decimalDigits: 0, // Tidak ada digit desimal
                        ).format(int.parse(order.originalPrice.toString()));
                        return Text(formattedPriceCommon, style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor));
                      } else if (modelReward != null) {
                        final order = modelReward.order!;
                        return Text('${order.totalPoint} Point', style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor));
                      } else {
                        return Text('No data available');
                      }
                    },
                    error: (message) => Text(message!),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          BlocBuilder<DetailOrderBloc, DetailOrderState>(
            builder: (context, state) {
              return state.when(
                initial: () => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                ),
                loading: () => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.grey[300],
                  ),
                ),
                success: (model, modelReward) {
                  if (model != null && model.order!.voucherId != null) {
                    final order = model.order!;
                    final formattedDiscountCommon = NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp',
                      decimalDigits: 0, // Tidak ada digit desimal
                    ).format(int.parse(order.discountAmount.toString()));
                    return Visibility(
                      visible: order.voucherId != null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Diskon', style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: redMedium)),
                          Text('- ${formattedDiscountCommon}', style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: redMedium)),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                error: (message) => Text(message!),
              );
            },
          ),
          SizedBox(height: 20),
          Divider(height: 1, color: grey),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Pembayaran', style: txtPrimarySubTitle.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor)),
              BlocBuilder<DetailOrderBloc, DetailOrderState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                    ),
                    loading: () => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                    ),
                    success: (model, modelReward) {
                      if (model != null) {
                        final order = model.order!;
                        final formattedTotalCommon = NumberFormat.currency(
                          locale: 'id_ID',
                          symbol: 'Rp',
                          decimalDigits: 0, // Tidak ada digit desimal
                        ).format(int.parse(order.totalPrice.toString()));
                        return Text(formattedTotalCommon, style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w600, color: blackColor));
                      } else if (modelReward != null) {
                        final order = modelReward.order!;
                        return Text('${order.totalPoint} Point', style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w600, color: blackColor));
                      } else {
                        return Text('No data available');
                      }
                    },
                    error: (message) => Text(message!),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
