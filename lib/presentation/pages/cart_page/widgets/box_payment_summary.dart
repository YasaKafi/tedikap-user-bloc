import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

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
              InkWell(
                onTap: (){},
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.paddingSizeSmall,
                      horizontal: Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                    color: baseColor,
                    border: Border.all(color: blackColor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            icDiscountActive,
                            width: 32,
                            height: 32,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Makin hemat pakai promo',
                            style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                        color: blackColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black38),
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
                                '2000',
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

