import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';


class PoinSection extends StatelessWidget {

  const PoinSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: baseColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(
                    0, 4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        padding:
        const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        child: InkWell(
          onTap: () {

          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    icLogoPrimary,
                    width: 44,
                    height: 44,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                 Text(
                      '100 Poin',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Divider(
                  color: grey,
                  height: 2,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Tukarkan poinmu dengan hadiah menarik',
                      style: txtSecondarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                  ),
                  SvgPicture.asset(
                    icArrowRight,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}