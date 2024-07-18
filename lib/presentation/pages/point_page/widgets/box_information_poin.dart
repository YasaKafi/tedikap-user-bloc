import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';


class BoxInformationPoin extends StatelessWidget {
  const BoxInformationPoin({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge),
          margin: EdgeInsets.only(top: Dimensions.marginSizeLarge),
          width: screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color(0xFFFFFFFF).withOpacity(1.0),
                const Color(0xFFFEF1D3).withOpacity(1.0),
                const Color(0xFFFEE6AF).withOpacity(1.0),
                const Color(0xFFFDD16F).withOpacity(1.0),
                const Color(0xFFFCC548).withOpacity(1.0),
              ],
              stops: const [0.14, 0.39, 0.57, 0.73, 0.90],
            ),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    icLogoPrimary,
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                        '100 Poin',
                        style: txtPrimaryHeader.copyWith(
                            fontWeight: FontWeight.w600, color: primaryColor),
                      )
                ],
              ),
              SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: transparentWhite70,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall,
                        vertical: Dimensions.paddingSizeMedium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Dapatkan Poin setiap transaksi',
                            style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNamed('detail_point');
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Detail',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
