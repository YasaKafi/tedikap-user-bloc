import 'package:flutter/material.dart';

import '../../../../common/dimensions.dart';


class VoucherShimmer extends StatelessWidget {
  final double screenWidth;

  const VoucherShimmer({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.marginSizeLarge),
      width: screenWidth,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}