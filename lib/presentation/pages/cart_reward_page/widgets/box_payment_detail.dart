import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../common/constant.dart';
import '../bloc/cart_reward_bloc.dart';

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
          BlocBuilder<CartRewardBloc, CartRewardState>(
            builder: (context, state) {
              return state.when(
                  initial: () => buildShimmer(),
                  loading: () => buildShimmer(),
                  success: (cartModel,  modelQty, deleteModel, modelPostOrder, ){
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
                              Row(
                                children: [
                                  SvgPicture.asset(icLogoPrimary, width: 18,),
                                  SizedBox(width: 5,),
                                  Text('${itemCart!.totalPoints.toString()}',
                                      style: txtPrimarySubTitle.copyWith(
                                          fontWeight: FontWeight.w500, color: blackColor)),
                                ],
                              ),
                            ],
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
                                      fontWeight: FontWeight.w600, color: blackColor)),
                              Row(
                                children: [
                                  SvgPicture.asset(icLogoPrimary, width: 18,),
                                  SizedBox(width: 5,),
                                  Text('${itemCart.totalPoints}',
                                      style: txtPrimarySubTitle.copyWith(
                                          fontWeight: FontWeight.w600, color: blackColor)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return buildShimmer();
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
