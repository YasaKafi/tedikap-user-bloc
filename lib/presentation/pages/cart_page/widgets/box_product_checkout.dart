import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../bloc/cart_bloc.dart';

class BoxProductCheckout extends StatelessWidget {
  const BoxProductCheckout({
    super.key,
    required this.screenWidth,
    required this.item,
  });

  final double screenWidth;
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              item.productImage ?? '',
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.productName ?? '',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor)),
                  Text('${item.temperatur} temp, ${item.size} size, ${item.ice} ice, ${item.sugar} sugar',
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black38)),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: greybgNote,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              width: screenWidth,
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeDefault,
                  horizontal: Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    icNote,
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                        item.note ?? '',
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: greytxtNote),
                        maxLines: 1,
                      )),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

