import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxEstimationPickup extends StatelessWidget {
  const BoxEstimationPickup({
    super.key,
    required this.screenWidth,
    this.schedule,
  });

  final double screenWidth;
  final String? schedule;

  @override
  Widget build(BuildContext context) {
    double dpi = MediaQuery.of(context).devicePixelRatio * 170;
    TextStyle textStyleTitle = dpi < 380 ? txtThirdSubTitle : txtSecondarySubTitle;
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
                                  style: textStyleTitle.copyWith(
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Waktu Pick Up',
                                      style: txtPrimarySubTitle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: blackColor),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    BlocBuilder<CartBloc, CartState>(
                                      builder: (context, state) {
                                        return InkWell(
                                            onTap: () {
                                              state.maybeWhen(
                                                  orElse: (){},
                                                success: (cartModel, modelQty,
                                                    deleteModel, modelPostOrder,
                                                    modelPostPayment, orderId){

                                                  if (cartModel?.cart != null) {
                                                    final session1 = cartModel?.cart!.session1;
                                                    final session2 = cartModel?.cart!.session2;
                                                    final endOrder1 = cartModel?.cart!.endSession1;
                                                    final endOrder2 = cartModel?.cart!.endSession2;

                                                    print('VALUE END ORDER 1 : $endOrder1');

                                                    // Pastikan format waktu sesuai dengan HH.mm
                                                    if (endOrder1 != null && endOrder2 != null) {
                                                      try {
                                                        // Konversi endOrder1 menjadi DateTime dan tambahkan 1 menit
                                                        DateTime parsedEndOrder1 = DateFormat("HH:mm").parse(endOrder1);
                                                        String endOrder1PlusOne = DateFormat("HH:mm").format(parsedEndOrder1.add(Duration(minutes: 1)));

                                                        _onAlertButtonsPressed(
                                                          context,
                                                          title: 'Pick-Up Schedule Information',
                                                          desc:
                                                          "Jadwal pick-up di aplikasi ini terbagi menjadi dua sesi: \n \n• Sesi 1 : $session1 \n• Sesi 2 : $session2 \n \nSedangkan, jadwal untuk melakukan order diatur sebagai berikut:  \n \n• Order untuk Sesi 1: Bisa dilakukan sejak toko dibuka hingga pukul $endOrder1. Pesanan yang dilakukan dalam rentang waktu ini akan masuk ke dalam Sesi 1 \n \n• Order untuk Sesi 2: Bisa dilakukan mulai pukul $endOrder1PlusOne hingga pukul $endOrder2. Pesanan yang masuk dalam rentang waktu ini akan dimasukkan ke dalam Sesi 2. \n \nPerlu diketahui bahwa pesanan tidak akan diterima lagi setelah pukul $endOrder2, karena toko sudah ditutup.",
                                                          titleStyle: txtSecondaryHeader.copyWith(
                                                            fontWeight: FontWeight.w600,
                                                            color: blackColor,
                                                          ),
                                                          descStyle: txtPrimarySubTitle.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            color: blackColor,
                                                          ),
                                                        );
                                                      } catch (e) {
                                                        print('Error parsing time: $e');
                                                      }
                                                    }
                                                  }
                                                  }
                                              );

                                            },
                                            child: const Icon(
                                              Icons.info_outline_rounded,
                                              size: 18,
                                            ));
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                BlocBuilder<CartBloc, CartState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                        orElse: () {
                                          return Text(
                                            'Failed access data',
                                            style: txtPrimaryTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor),
                                          );
                                        },
                                        success: (cartModel, modelQty,
                                            deleteModel, modelPostOrder,
                                            modelPostPayment, orderId) {
                                          final itemCart = cartModel?.cart
                                              ?.schedulePickup;
                                          if (itemCart != null) {
                                            return Text(
                                              itemCart,
                                              style: txtPrimaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor),
                                            );
                                          } else {
                                            return Text(
                                              'CLOSED',
                                              style: txtPrimaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor),
                                            );
                                          }
                                        },
                                        loading: (isPatchQTyLoading, cartModel) {
                                          if (isPatchQTyLoading){
                                            final itemCart = cartModel?.cart
                                                ?.schedulePickup;
                                            if (itemCart != null) {
                                              return Text(
                                                itemCart,
                                                style: txtPrimaryTitle.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: blackColor),
                                              );
                                            }
                                          }
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

  _onAlertButtonsPressed(BuildContext context,
      {String? title,
        TextStyle? titleStyle,
        TextStyle? descStyle,
        String? desc,
      }) {
    Alert(
      context: context,
      title: title,
      padding: const EdgeInsets.all(20),
      style: AlertStyle(
          animationType: AnimationType.grow,
          isCloseButton: false,
          backgroundColor: baseColor,
          overlayColor: Colors.black38,
          titleStyle: titleStyle!,
          descStyle: descStyle!,
          descTextAlign: TextAlign.start
      ),
      desc: desc,
      buttons: [
        DialogButton(
            color: baseColor,
            border: Border.all(color: navyColor, width: 1),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: navyColor),
            )),
        DialogButton(
            color: navyColor,
            onPressed: () {
              context.pushNamed('help_center');
            },
            child: Text(
              "More Info",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            )),
      ],
    ).show();
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
