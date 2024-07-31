import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailVoucherShimmer extends StatelessWidget {
  final double screenWidth;

  DetailVoucherShimmer({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            width: screenWidth,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,

            ),
          ),
          SizedBox(height: 10),
          Container(
            width: screenWidth * 0.3,
            height: 30,
            margin: EdgeInsets.only( left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,

            ),
          ),SizedBox(height: 10),
          Container(
            width: screenWidth * 0.4,
            height: 30,
            margin: EdgeInsets.only( left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,

            ),
          ),SizedBox(height: 10),
          Container(
            width: screenWidth * 0.2,
            height: 30,
            margin: EdgeInsets.only( left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,

            ),
          ),
        ],
      ),
    );
  }
}
