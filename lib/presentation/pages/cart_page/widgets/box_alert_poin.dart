import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxAlertPoin extends StatelessWidget {
  const BoxAlertPoin({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        width: screenWidth,
        padding:
        EdgeInsets.all(Dimensions.paddingSizeLarge),
        decoration: BoxDecoration(
          color: primaryColor2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icLogoPrimary,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text('Kamu berpotensi mendapatkan',
                    style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)),
                SizedBox(
                  width: 3,
                ),
                Text('3 Poin', style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
              ],
            ),
          ],
        ));
  }
}