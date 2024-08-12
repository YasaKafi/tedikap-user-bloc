import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxEstimationPickup extends StatelessWidget {
  const BoxEstimationPickup({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

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
          padding: EdgeInsets.symmetric(
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
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
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
                            SizedBox(
                              height: 5,
                            ),
                            DottedDivider(
                              color: primaryColor,
                              dashWidth: 6,
                              dashSpace: 8,
                              thickness: 2,
                              height: 60,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SvgPicture.asset(
                              icClockPrimaryColor,
                              height: 32,
                              width: 32,
                            )
                          ],
                        ),
                        SizedBox(
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
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Tedikap RUS',
                                  style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                ),
                                SizedBox(
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
                            SizedBox(
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
                                SizedBox(
                                  height: 3,
                                ),
                                BlocBuilder<CartRewardBloc, CartRewardState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                        orElse: (){
                                          return Text(
                                            'Failed access data',
                                            style: txtPrimaryTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor),
                                          );
                                        },
                                        success: (cartModel, modelQty, deleteModel, modelPostOrder,
                                            modelPoint){
                                          final itemCart = cartModel?.cart;
                                          if (itemCart != null){
                                            return Text(
                                              itemCart.schedulePickup!,
                                              style: txtPrimaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor),
                                            );
                                          } else {
                                            return Text(
                                              'Failed access data',
                                              style: txtPrimaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor),
                                            );
                                          }
                                        },
                                        loading: () {
                                          return Text(
                                            'Loading...',
                                            style: txtPrimaryTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor),
                                          );
                                        }
                                    );
                                  },
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
    Key? key,
    this.height = 1,
    this.thickness = 1,
    this.color = Colors.black,
    this.dashWidth = 3,
    this.dashSpace = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
