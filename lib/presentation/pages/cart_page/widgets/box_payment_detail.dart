import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../global_components/currency_formatter.dart';

class BoxPaymentDetail extends StatelessWidget {
  const BoxPaymentDetail({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rincian Pembayaran',
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor)),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.when(
                initial: () => buildShimmer(),
                loading: () => buildShimmer(),
                success: (cartModel, modelQty, deleteModel, modelPostOrder,
                    modelPostPayment, orderId) {
                  if (cartModel != null) {
                    final itemCart = cartModel.cart;
                    final formattedsubTotal = CurrencyFormatter.formatToCurrency(itemCart!.originalPrice!);
                    final formattedDiscount = CurrencyFormatter.formatToCurrency(itemCart.discountAmount!);
                    final formattedTotalPrice = CurrencyFormatter.formatToCurrency(itemCart.totalPrice!);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor)),
                            Text(formattedsubTotal,
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor)),
                          ],
                        ),
                        Visibility(
                          visible: itemCart.voucherId != null ? true : false,
                          child: const SizedBox(
                            height: 10,
                          ),
                        ),
                        Visibility(
                          visible: itemCart.voucherId != null ? true : false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Diskon',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: redMedium)),
                              Text('- $formattedDiscount',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: redMedium)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          height: 1,
                          color: grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor)),
                            Text(formattedTotalPrice,
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor)),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return  buildShimmer();
                  }
                },
                error: (message) => buildShimmer(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.3,
                height: 20,
                color: Colors.grey,
              ),
              Container(
                width: screenWidth * 0.2,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.2,
                height: 20,
                color: Colors.grey,
              ),
              Container(
                width: screenWidth * 0.1,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
            color: grey,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: 20,
                color: Colors.grey,
              ),
              Container(
                width: screenWidth * 0.3,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}