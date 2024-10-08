import 'package:flutter/material.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

class CustomBottomSheetInformationVoucher extends StatelessWidget {
  final List<String> contentList;
  final String title;

  const CustomBottomSheetInformationVoucher({super.key, required this.title, required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge, horizontal: Dimensions.paddingSizeLarge),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: txtPrimaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(contentList.length, (index) {
              return Text(
                contentList[index],
                style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
              );
            }),
          ),


        ],
      ),
    );
  }
}
