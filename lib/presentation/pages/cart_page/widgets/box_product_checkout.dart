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

  String _buildProductDescription(CartItem item) {
    List<String> details = [];
    if (item.temperatur != null) {
      details.add('${item.temperatur} temp');
    }
    if (item.size != null) {
      details.add('${item.size} size');
    }
    if (item.ice != null) {
      details.add('${item.ice} ice');
    }
    if (item.sugar != null) {
      details.add('${item.sugar} sugar');
    }
    return details.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
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
            const SizedBox(
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
                  Visibility(
                    visible: item.temperatur != null || item.size != null || item.ice != null || item.sugar != null,
                    child: Text(
                      _buildProductDescription(item),
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black38),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: greybgNote,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              width: screenWidth,
              padding: const EdgeInsets.symmetric(
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
                  const SizedBox(
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
