import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxInfoOutlet extends StatelessWidget {
  const BoxInfoOutlet({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge),
          child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text('Ambil Pesananmu Di', style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      icLogoPrimary,
                      width: 44,
                      height: 44,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Tedikap Store',
                            style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
                        Text(
                            'Jl. Raya Ciputat Parung No. 1',
                            style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
                      ],
                    )
                  ],
                )
              ]),
        ));
  }
}