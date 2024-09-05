
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constant.dart';
import '../../common/theme.dart';

class EmptyStateWidgetStatic {
  static  Widget buildEmptyState(BuildContext context,{ String? icon, String? title, String? desc, double? widthIcon,double? widthBox}) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon ?? icSearchEmpty, width: widthIcon ?? screenWidth * 0.5),
          const SizedBox(height: 10),
          SizedBox(
            width: widthBox ?? screenWidth * 0.8,
            child: Column(
              children: [
                Text(
                  title ?? 'Oops, something went wrong. Please try again later',
                  style: txtPrimaryTitle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  desc ?? '',
                  style: txtSecondarySubTitle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}