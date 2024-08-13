import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';


class BoxNotification extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final String? title;
  final String? description;
  const BoxNotification({
    super.key, required this.onTap,  this.color, this.title, this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeMedium),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icNotification,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20 May 2024 • 12.00',
                        style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        title ?? 'Lorem Ipsum',
                        style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Text(
                        description ?? 'Lorem Ipsum Dolor Sit Amet',
                        style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(color: grey, height: 1),
        ],
      ),
    );
  }
}