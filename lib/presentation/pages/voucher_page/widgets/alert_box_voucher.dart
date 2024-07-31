import 'package:flutter/material.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';


class AlertBox extends StatelessWidget {
  const AlertBox({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor2,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeDefault),
      width: screenWidth,
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 28,
            color: primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              'Vouchers can only be used on the cart page',
              style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w600, color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}