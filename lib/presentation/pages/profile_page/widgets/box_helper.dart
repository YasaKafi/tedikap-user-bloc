import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constant.dart';
import '../../../../common/theme.dart';


class BoxHelper extends StatelessWidget {
  const BoxHelper({
    required this.iconPath,
    required this.text,
    super.key,
  });

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)
            )
          ],
        ),
        SvgPicture.asset(
          icArrowRight, // Replace with your actual asset path
          width: 24,
          height: 24,
        )
      ],
    );
  }
}