import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

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
      padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
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
          SizedBox(
            height: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.when(
                  initial: () => Center(child: CircularProgressIndicator()),
                  loading: () => Center(child: CircularProgressIndicator()),
                  success: (cartModel, modelQty, deleteModel, modelPostOrder, modelPostPayment){
                    if(cartModel != null){
                      final itemCart = cartModel.cart;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: blackColor)),
                              Text('Rp ${itemCart!.originalPrice.toString()}',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: blackColor)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Diskon',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: redMedium)),
                              Text('- ${itemCart.discountAmount ?? 0}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Pembayaran',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                              Text('Rp ${itemCart.totalPrice}',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor)),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('Cart kosong'),);
                    }

                  },
                error: (message) => Center(child: Text(message!)),
              );

            },
          )
        ],
      ),
    );
  }
}
