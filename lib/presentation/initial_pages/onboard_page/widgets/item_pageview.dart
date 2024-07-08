import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class ItemOnBoarding extends StatelessWidget {
  final String imgBoarding;
  final String titleBoarding;
  final String subtitleBoarding;
  final double screenWidth;


  const ItemOnBoarding({
    super.key, required this.imgBoarding, required this.titleBoarding, required this.subtitleBoarding, required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60,),
        Column(

          children: [
            Center(child: SvgPicture.asset(imgBoarding)),
            const SizedBox(height: Dimensions.marginSizeLarge,),
            SizedBox(
              width: screenWidth,
              child: Text(
                textAlign: TextAlign.center,
                titleBoarding,
                style: txtPrimaryHeader.copyWith(fontWeight: FontWeight.w600, color: blackColor),
              ),
            ),
            const SizedBox(height: Dimensions.marginSizeSmall,),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                child: Center(
                    child: Text(
                        textAlign: TextAlign.center,
                        subtitleBoarding,
                        style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)
                    ))),
          ],
        ),
      ],
    );
  }
}