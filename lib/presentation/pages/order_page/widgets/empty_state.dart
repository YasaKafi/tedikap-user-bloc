import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constant.dart';
import '../../../../common/theme.dart';

class EmptyOrderWidget extends StatelessWidget {
  const EmptyOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icOrderEmpty, width: screenWidth * 0.5),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                children: [
                  Text(
                    'No order placed yet',
                    style: txtPrimaryTitle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'You have not placed an order yet. Please add items to your cart and checkout when you are ready.',
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
      ),
    );
  }
}
