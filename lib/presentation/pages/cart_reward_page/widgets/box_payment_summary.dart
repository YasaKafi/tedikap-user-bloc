import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxCheckoutSummary extends StatelessWidget {
  BoxCheckoutSummary({
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
          ),
          child: Column(
            children: [

              BlocBuilder<CartRewardBloc, CartRewardState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => Center(child: CircularProgressIndicator()),
                      loading: () => Center(child: CircularProgressIndicator()),
                      success: (cartModel, productModel, modelQty, deleteModel){
                        if(cartModel != null){
                          final itemCart = cartModel.cart;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black38),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rp',
                                        style: txtSecondarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        itemCart!.totalPoints.toString(),
                                        style: txtPrimaryHeader.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: blackColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _onAlertButtonsPressed(context,
                                          bgcolor: baseColor,
                                          title: 'Kebijakan Privasi',
                                          titleStyle: txtSecondaryHeader.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor),
                                          descStyle: txtPrimarySubTitle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: blackColor),
                                          desc:
                                          'Kamu tidak dapat melakukan pembatalan atau perubahan apapun pada pesanan setelah melakukan pembayaran.',
                                          icon: icAlert,
                                          onPressed: () {
                                            // Get.back();
                                            // controller.handleOrderPayment();
                                          });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Dimensions.paddingSizeDefault,
                                          horizontal: Dimensions.paddingSizeLarge),
                                      decoration: BoxDecoration(
                                        color: navyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            icMoney,
                                            width: 24,
                                            height: 24,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Select Payment',
                                            style: txtSecondaryTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: baseColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Center(child: Text("No product details available"));
                        }



                      },
                    error: (message) => Center(child: Text(message!)),


                  );

                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onAlertButtonsPressed(context,
      {String? title,
        TextStyle? titleStyle,
        TextStyle? descStyle,
        String? desc,
        String? icon,
        Color? bgcolor,
        VoidCallback? onPressed}) {
    Alert(
      context: context,
      title: title,
      padding: EdgeInsets.all(20),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        backgroundColor: bgcolor,
        overlayColor: Colors.black38,
        titleStyle: titleStyle!,
        descStyle: descStyle!,
      ),
      desc: desc,
      image: SvgPicture.asset(
        icon!,
        width: 80,
        height: 80,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Cancel",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
          onPressed: () => Navigator.pop(context),
          color: redMedium,
        ),
        DialogButton(
            child: Text(
              "Confirm",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            ),
            color: navyColor,
            onPressed: onPressed)
      ],
    ).show();
  }
}


void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

      );
    },
  );
}

