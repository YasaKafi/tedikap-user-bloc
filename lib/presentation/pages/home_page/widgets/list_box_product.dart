import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';


class ListBoxProduct extends StatelessWidget {
  ListBoxProduct({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.price,
  });

  final String image;
  final String title;
  final double rating;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Dimensions.marginSizeLarge,
          top: Dimensions.marginSizeSmall,
          bottom: Dimensions.marginSizeSmall),
      width: 160,
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        shape: BoxShape.rectangle,
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              TedikapApiRepository.getImage + image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: txtPrimaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
                const SizedBox(
                  height: Dimensions.paddingSizeExtraSmall,
                ),
                Text(price, style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
                const SizedBox(
                  height: Dimensions.paddingSizeExtraSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.orange,
                      size: Dimensions.iconSizeKindDeafult,
                    ),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
