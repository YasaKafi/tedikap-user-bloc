import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import 'custom_bottom_sheet_information_voucher.dart';


class ListBoxInformationVoucher extends StatelessWidget {
  ListBoxInformationVoucher({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final double screenWidth;
  final String title;
  final String subtitle;
  final String icon;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _showCustomBottomSheet(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(icon, height: 32, width: 32,),
                      SizedBox(
                        width: Dimensions.marginSizeLarge,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(child: Text(title, style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor))),
                                SizedBox(
                                  height: 3,
                                ),
                                Container(

                                  child: Text(subtitle, style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor90),
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, size: 20, color: grey,)
                ],
              )),
        ],
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheetInformationVoucher(
          title: 'Syarat & Ketentuan Voucher',
          contentList: ['1. This is the content of the custom bottom sheet.','2. This is the content of the custom bottom sheet', '3. This is the content of the custom bottom sheet' ],
        );
      },
      isScrollControlled: true,
    );
  }
}