import 'package:flutter/material.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class InputVoucherCode extends StatelessWidget {
  const InputVoucherCode({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          width: screenWidth,
          child: Row(
            children: [
              SizedBox(
                width: screenWidth * 0.65,
                child: TextField(
                  style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Input Promo Code',
                      hintStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w600, color: grey),
                      focusColor: Colors.transparent
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Sorry, voucher not found!',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w500, color: baseColor),
                    ),
                    backgroundColor: redMedium,
                  ));
                },
                child: Expanded(
                    child: Center(
                      child: Text(
                        'Apply',
                        style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w600, color: primaryColor)
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}