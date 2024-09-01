import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../../data/models/response/most_like_product_response_model.dart';

class ListBoxProduct extends StatelessWidget {
  const ListBoxProduct({
    super.key,
    required this.image,
    required this.title,
    required this.favorite,
    required this.price,
    required this.category, required this.lastItem,
  });

  final String image;
  final String title;
  final String category;
  final int favorite;
  final String price;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle textStyleTitleValidationDPI = dpi < 380 ? txtPrimarySubTitle : txtSecondaryTitle;
    double fontSizeFav = dpi < 380 ? Dimensions.fontSizeSmall : Dimensions.fontSizeDefault;
    double IconSizeFav = dpi < 380 ? Dimensions.iconSizeMedium : Dimensions.iconSizeKindDefault;
    TextStyle textStyleCategory = dpi < 380 ? txtSecondarySubTitle : txtPrimarySubTitle;
    TextStyle textStyleTitle = title.length < 13 ? txtSecondaryTitle : textStyleTitleValidationDPI;
    double widthBox = dpi < 380 ? 160 : 180;

    return Container(
      margin:  EdgeInsets.only(
          left: Dimensions.marginSizeLarge,
          top: Dimensions.marginSizeSmall,
          bottom: Dimensions.marginSizeSmall,
        right: lastItem ? Dimensions.marginSizeLarge : 0
        ,
      ),
      width: widthBox,
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
              height: 120,
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
                          style: textStyleTitle.copyWith(
                              fontWeight: FontWeight.w600, color: blackColor)),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text('$category series',
                          style: textStyleCategory.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400])),
                      const SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: redMedium,
                            size: IconSizeFav,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            favorite.toString(),
                            style: TextStyle(
                                fontSize: fontSizeFav,
                                fontWeight: FontWeight.bold,
                                color: redMedium),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: price == 'Sold out' ? 10 : 0,  vertical: 5),
                    decoration: BoxDecoration(
                        color: price == 'Sold out' ? redLight : Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(price,
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: price == 'Sold out' ? redMedium : blackColor)),
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
