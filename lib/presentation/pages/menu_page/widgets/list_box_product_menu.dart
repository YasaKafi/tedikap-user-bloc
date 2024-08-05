import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

class ListBoxProductMenu extends StatelessWidget {
  const ListBoxProductMenu({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.rating,
    required this.category,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final double rating;
  final int price;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: Dimensions.marginSizeLarge,
            right: Dimensions.marginSizeLarge,
            top: Dimensions.marginSizeLarge),
        height: screenHeight * 0.09,
        width: screenWidth,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: Dimensions.marginSizeSmall),
                width: 70,
                height: 70,
                decoration: ShapeDecoration(
                  color: const Color(0x0C56473C),
                  shape: const OvalBorder(),
                  image: DecorationImage(
                    image: NetworkImage(TedikapApiRepository.getImage + image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: Dimensions.marginSizeLarge,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(title,
                        style: txtPrimaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: screenWidth * 0.45,
                  child: Text(
                    'Racikan teh spesial Tedikap dari beberapa daun teh kering pilihan terbaik.',
                    style: txtSecondarySubTitle.copyWith(
                        fontWeight: FontWeight.w500, color: blackColor90),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
                    height: screenHeight,
                    child: Center(
                      child: Text('Rp${price.toString()}',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor)),
                    )))
          ],
        ));
  }
}
