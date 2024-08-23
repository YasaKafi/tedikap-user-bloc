import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_user_bloc/common/theme.dart';

import '../../common/constant.dart';

class ErrorWidgetStatic {
  static Widget buildErrorState(BuildContext context, String message, {double? width}) {
    final double screenWidth = width ?? MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icServerError, width: screenWidth * 0.5),
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.7,
            child: Text(
              message,
              style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
