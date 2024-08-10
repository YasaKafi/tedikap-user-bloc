import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';


class InfoBoxProfile extends StatelessWidget {
  const InfoBoxProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: BoxDecoration(
                color: baseColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            margin: const EdgeInsets.only(top: 210, left: 20, right: 20),
            padding: const EdgeInsets.only(
                top: Dimensions.paddingSizeLarge, bottom: Dimensions.paddingSizeLarge, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    context.pushNamed('voucher', extra: false);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Voucher',
                        style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      const SizedBox(
                        height: 6 ,
                      ),
                      SvgPicture.asset(
                        icVoucher,
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    context.pushNamed('point', extra: false);
                  },
                  child: Column(
                    children: [
                      Text(
                        'Tedikap Poin',
                        style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SvgPicture.asset(
                        icLogoPrimary,
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    context.pushNamed('favorite');
                  },
                  child: Column(
                    children: [
                      Text(
                        'Favorit',
                        style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SvgPicture.asset(
                        icHeartOutline,
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}