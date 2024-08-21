import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 6),
          Container(
            width: 100,
            height: 16,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
