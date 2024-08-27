import 'package:flutter/material.dart';
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
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle textStyleTitle = dpi < 380 ? txtSecondaryTitle : txtPrimaryTitle;
    double sizeImageProduct = dpi < 380 ? 60 : 70;
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
                width: sizeImageProduct,
                height: sizeImageProduct,
                decoration: ShapeDecoration(
                  color: const Color(0x0C56473C),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  image: DecorationImage(
                    image: NetworkImage(TedikapApiRepository.getImage + image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: Dimensions.marginSizeDefault,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(title,
                        style: textStyleTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: screenWidth * 0.38,
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
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,  vertical: 5),
                        decoration: BoxDecoration(
                            color: price == 'Out of stock' ? redLight : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(price,
                            style: (price == 'Out of stock' ? txtSecondarySubTitle : txtPrimarySubTitle).copyWith(
                                fontWeight: FontWeight.w500, color: price == 'Out of stock' ? redMedium : blackColor)),
                      ),
                    )))
          ],
        ));
  }
}
