import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';


class CardFeature extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;

  const CardFeature({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFF3EAD5),
                Color(0xFFF3DFB3),
                Color(0xFFF3DBA3),
              ],
              stops: [0.0, 0.54, 0.79, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp,
            ),
            color: blackColor20,
            border: Border.all(color: primaryColor, width: 3),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: txtSecondaryHeader.copyWith(fontWeight: FontWeight.w600, color: baseColor),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    subtitle,
                    style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                SvgPicture.asset(
                  icon,
                  width: 54,
                  height: 54,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
