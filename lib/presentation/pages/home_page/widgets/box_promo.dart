import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

class BoxPromoWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final double screenWidth;

  const BoxPromoWidget({
    super.key,
    required this.screenWidth,
    this.title,
    this.subtitle,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeSmall,
          horizontal: Dimensions.paddingSizeLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'No Title',
            style: txtSecondaryHeader.copyWith(
                fontWeight: FontWeight.w600, color: blackColor),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeExtraSmall,
          ),
          Text(
            subtitle ?? 'No Description',
            style: txtPrimarySubTitle.copyWith(
                fontWeight: FontWeight.w400, color: blackColor),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          if (imageUrl != null && imageUrl!.isNotEmpty)
            SizedBox(
              width: screenWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  TedikapApiRepository.getImageBoxPromo + imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
