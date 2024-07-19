import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxBottomPrice extends StatelessWidget {
  const BoxBottomPrice({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: baseColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp',
                        style: txtSecondarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black38),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '5000',
                        style: txtPrimaryHeader.copyWith(
                            fontWeight: FontWeight.w600, color: blackColor),
                      )
                    ],
                  ),
                  BlocBuilder<DetailProductBloc, DetailProductState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => Center(
                                child: CircularProgressIndicator(),
                              ),
                        success: (a,b,c,d,e,f,g,h,i,k, qty){
                          return Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<DetailProductBloc>().add(DetailProductEvent.decrement());
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  size: 28,
                                ),
                                color: grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  qty.toString(),
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor)),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<DetailProductBloc>().add(DetailProductEvent.increment());
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: 28,
                                ),
                                color: navyColor,
                              ),
                            ],
                          );

                        }
                      );

                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  //
                  // if (controller.isFromCart == false && controller.isFromRewardCart == false){
                  //   controller.handlePostCart();
                  // } else {
                  //   controller.handlePutCart();
                  // }
                },
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                    color: navyColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                      child: Text(
                    'Add to Cart',
                    style: txtPrimaryTitle.copyWith(
                        fontWeight: FontWeight.w600, color: baseColor),
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
