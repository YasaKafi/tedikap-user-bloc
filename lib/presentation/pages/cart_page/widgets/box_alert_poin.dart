import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxAlertPoin extends StatelessWidget {
  const BoxAlertPoin({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: screenWidth,
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        decoration: BoxDecoration(
          color: primaryColor2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icLogoPrimary,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text('Kamu berpotensi mendapatkan',
                    style: txtPrimarySubTitle.copyWith(
                        fontWeight: FontWeight.w400, color: blackColor)),
                const SizedBox(
                  width: 3,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: () => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 50,
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                        success: (cartModel, modelQty, deleteModel,
                            modelPostOrder, modelPostPayment, orderId, ) {
                          final itemPoint = cartModel?.cart;

                          if (itemPoint != null) {
                            return Text('${itemPoint.rewardPoint} Point',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor));
                          } else {
                            return Text('0 Point',
                                style: txtPrimarySubTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: blackColor));
                          }
                        });
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
