import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import 'package:intl/intl.dart';

class ListBoxProduct extends StatelessWidget {
  const ListBoxProduct({
    super.key,
    required this.image,
    required this.title,
    required this.favorite,
    required this.price,
    required this.category,
  });

  final String image;
  final String title;
  final String category;
  final int favorite;
  final String price;

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.only(
          left: Dimensions.marginSizeLarge,
          top: Dimensions.marginSizeSmall,
          bottom: Dimensions.marginSizeSmall),
      width: 160,
      decoration: BoxDecoration(
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
        mainAxisSize: MainAxisSize.max,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: txtSecondaryTitle.copyWith(
                              fontWeight: FontWeight.w600, color: blackColor)),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text('$category series',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400])),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: redMedium,
                            size: Dimensions.iconSizeKindDeafult,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            favorite.toString(),
                            style: const TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold,
                                color: redMedium),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.paddingSizeExtraSmall),
                    child: Text(price,
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: price == 'Out of stock' ? redMedium : blackColor)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
