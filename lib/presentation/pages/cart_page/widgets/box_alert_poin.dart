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

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: (){
              return _buildAlertGetPoint(screenWidth: screenWidth);
            },
          success: (cartModel, modelQty, deleteModel, modelPostOrder,
              modelPostPayment, orderId){
              if (cartModel?.cart != null){
                if (cartModel!.cart!.cartItems!.isNotEmpty) {
                  return _buildAlertGetPoint(screenWidth: screenWidth);
                } else {
                  return const SizedBox();
                }
              }
              return const SizedBox();
          }
        );
      },
    );
  }
}

class _buildAlertGetPoint extends StatelessWidget {
  const _buildAlertGetPoint({
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle tsAlertPoint = dpi < 380 ? txtThirdSubTitle : txtSecondarySubTitle;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icLogoPrimary,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  'Kamu berpotensi mendapatkan',
                  style: tsAlertPoint.copyWith(
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () =>
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 50,
                              height: 20,
                              color: Colors.white,
                            ),
                          ),
                      success: (cartModel, modelQty, deleteModel,
                          modelPostOrder, modelPostPayment, orderId) {
                        final itemPoint = cartModel?.cart;

                        if (itemPoint != null) {
                          return Flexible(
                            child: Text(
                              '${itemPoint.rewardPoint} Point',
                              style: tsAlertPoint.copyWith(
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else {
                          return Flexible(
                            child: Text(
                              '0 Point',
                              style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
