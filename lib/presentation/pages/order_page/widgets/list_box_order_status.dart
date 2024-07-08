// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

class ListBoxMenuStatus extends StatelessWidget {
  ListBoxMenuStatus({Key? key, required this.status, required this.totalItem, required this.totalPrice, required this.orderItems, }) : super(key: key);

  final String status;
  final String totalItem ;
  final String totalPrice;
  final List<String> orderItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
      margin: const EdgeInsets.only(
        left: Dimensions.marginSizeLarge,
        right: Dimensions.marginSizeLarge,
        top: Dimensions.marginSizeLarge,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge),
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: navyColor,
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(status, style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: baseColor)),
                Row(
                  children: [
                    Text('Detail', style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: baseColor)),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(icPickUp, width: 24, height: 24),
                    SizedBox(width: 8),
                    Text('Pick Up', style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
                  ],
                ),
                Text('5 mnt lalu', style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeMedium),
            child: Divider(
              color: Colors.black,
              height: 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Row(

                    children: [
                      for (var item in orderItems)
                      Text("${item}, ",
                        style: txtSecondarySubTitle.copyWith(
                            fontWeight: FontWeight.w400, color: blackColor),),
                    ],
                  ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${totalItem} Items', style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),),
                    Text('Total : Rp ${totalPrice}', style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
