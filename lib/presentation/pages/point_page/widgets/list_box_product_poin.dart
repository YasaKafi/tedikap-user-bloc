import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';


class ListBoxProductPoin extends StatelessWidget {
  const ListBoxProductPoin({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.category,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String price;
  final String category;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle textTitleStyle = dpi < 380 ? txtSecondaryTitle : txtPrimaryTitle;
    double heightImage = dpi < 380 ? screenHeight * 0.17 : screenHeight * 0.2;

    return SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: heightImage,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
                  image: DecorationImage(
                    image: NetworkImage(TedikapApiRepository.getImageRewardProduct + image),
                    fit: BoxFit.cover,
              )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: screenWidth,
                    child: Text(title, style: textTitleStyle.copyWith(fontWeight: FontWeight.w500, color: blackColor),)),
              ],
            ),
            price == 'Sold out'
                ?
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: price == 'Sold out' ? 10 : 0,  vertical: 5),
                decoration: BoxDecoration(
                    color: price == 'Sold out' ? redLight : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(price,
                    style: txtPrimarySubTitle.copyWith(
                        fontWeight: FontWeight.w500, color: price == 'Sold out' ? redMedium : blackColor)),
              ),
            )
                :
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                    width: screenWidth,
                    child: Row(
                      children: [
                        SvgPicture.asset(icLogoPrimary, width: 24, height: 24,),
                        const SizedBox(
                          width: Dimensions.marginSizeSmall,
                        ),
                        Text('$price poin', style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),

                      ],
                    )),
              ],
            )
          ],
        ));
  }
}
