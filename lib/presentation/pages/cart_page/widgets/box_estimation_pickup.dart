import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxEstimationPickup extends StatelessWidget {
  const BoxEstimationPickup({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(15),
        ),
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Pick Up',
                style: txtPrimaryTitle.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              icOutletActive,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const DottedDivider(
                              color: primaryColor,
                              dashWidth: 6,
                              dashSpace: 8,
                              thickness: 2,
                              height: 60,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SvgPicture.asset(
                              icClockPrimaryColor,
                              height: 32,
                              width: 32,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokasi Outlet',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Tedikap RUS',
                                  style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  'Jalan Sukun Raya No.09, Besito, Kudus',
                                  style: txtSecondarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Waktu Pick Up',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: blackColor),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Closed',
                                  style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class DottedDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DottedDivider({
    super.key,
    this.height = 1,
    this.thickness = 1,
    this.color = Colors.black,
    this.dashWidth = 3,
    this.dashSpace = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          thickness: thickness,
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  _DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = thickness;

    double startX = 0;
    final space = (dashWidth + dashSpace);

    while (startX < size.height) {
      // Change to vertical height
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth),
          paint); // Draw vertical line
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
