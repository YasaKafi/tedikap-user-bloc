import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/data/repository/global_variabel.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import 'dart:async';

import '../../order_page/bloc/order_bloc.dart';

// ignore: must_be_immutable
class SectionButton extends StatefulWidget {
  SectionButton(
      {super.key, this.linkCheckout, this.orderId, this.orderRewardId});
  String? linkCheckout;
  String? orderId;
  String? orderRewardId;

  @override
  _SectionButtonState createState() => _SectionButtonState();
}

class _SectionButtonState extends State<SectionButton> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;
  bool _timerEnded = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(DateTime createdAt, DateTime expiredAt) {
    // Calculate the difference between expiredAt and createdAt
    final Duration durationDifference = expiredAt.difference(createdAt);

    // To get the total minutes as an int
    final int totalMinutes = durationDifference.inMinutes;

    print('MENIT : $totalMinutes');

    final endTime = createdAt.add(Duration(minutes: totalMinutes));
    _remainingTime = endTime.difference(DateTime.now());

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        if (now.isBefore(endTime)) {
          _remainingTime = endTime.difference(now);
        } else {
          _remainingTime = Duration.zero;
          _timerEnded = true;
          timer.cancel();
        }
      });
    });
  }

  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<DetailOrderBloc, DetailOrderState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () =>  buildShimmer(width: screenWidth, height: 50),
            success: (model, modelReward) {
              if (model != null && model.order != null) {
                final isPayment = model.order?.paymentChannel == null;
                final bool statusOrderOngoing =
                    model.order?.status == 'menunggu konfirmasi' ||
                        model.order?.status == 'pesanan diproses' ||
                        model.order?.status == 'pesanan siap diambil';

                final bool isCartItemEmpty =
                    !(model.order?.cartLength ?? false);
                final bool isCartRewardItemEmpty =
                    !(modelReward?.order?.cartLength ?? false);

                print("INI HASIL BOOL CART ITEM COMMON :   $isCartItemEmpty");

                if (isPayment) {
                  final createdAt = model.order?.createdAt!;
                  final expiredAt = model.order?.expiresAt!;
                  if (_remainingTime == Duration.zero &&
                      (_timer == null || !_timer!.isActive)) {
                    startTimer(createdAt!, expiredAt!);
                  }
                  final minutes = _remainingTime.inMinutes.remainder(60);
                  final seconds = _remainingTime.inSeconds.remainder(60);
                  final timerText =
                      'Lanjutkan Pembayaran ($minutes:${seconds.toString().padLeft(2, '0')})';
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: CommonButton(
                        width: screenWidth,
                        text: _timerEnded == true
                            ? 'Pembayaran Berakhir'
                            : timerText,
                        onPressed: _timerEnded
                            ? null
                            : () async {
                                if (GlobalVariables.linkCheckoutGlobal !=
                                    null) {
                                  await launchUrl(Uri.parse(
                                      GlobalVariables.linkCheckoutGlobal!));
                                }
                              },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textColor: baseColor,
                        backgroundColor: _timerEnded ? grey : redMedium,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        borderRadius: 15,
                      ),
                    ),
                  );
                } else if (statusOrderOngoing) {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: CommonButton(
                        width: screenWidth,
                        borderColor: blackColor,
                        borderWidth: 1,
                        text: 'Bantuan',
                        onPressed: () {
                          launchUrl(Uri.parse(model.order!.whatsapp!));
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textColor: blackColor,
                        backgroundColor: baseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        borderRadius: 30,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            width: screenWidth * 0.4,
                            borderColor: blackColor,
                            borderWidth: 1,
                            text: 'Bantuan',
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textColor: blackColor,
                            backgroundColor: baseColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            borderRadius: 30,
                          ),
                          CommonButton(
                            width: screenWidth * 0.4,
                            text: 'Pesan Ulang',
                            onPressed: () {
                              if (model.order != null ||
                                  modelReward?.order != null) {
                                if (isCartItemEmpty == true) {
                                  _showReorderOptions(context);
                                } else if (!isCartItemEmpty) {
                                  if (widget.orderId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrder(
                                            widget.orderId!));
                                  } else if (widget.orderRewardId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrderReward(
                                            widget.orderRewardId!));
                                  }
                                } else if (isCartRewardItemEmpty == true) {
                                  _showReorderOptions(context);

                                } else {
                                  if (widget.orderId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrder(
                                            widget.orderId!));
                                  } else if (widget.orderRewardId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrderReward(
                                            widget.orderRewardId!));
                                  }
                                }
                              }
                            },
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textColor: baseColor,
                            backgroundColor: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            borderRadius: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                }

              } else if (modelReward != null && modelReward.order != null) {
                print("Else block triggered");

                final bool statusOrderOngoing =
                    modelReward.order?.status == 'menunggu konfirmasi' ||
                        modelReward.order?.status == 'pesanan diproses' ||
                        modelReward.order?.status == 'pesanan siap diambil';

                final bool isCartItemEmpty =
                !(model?.order?.cartLength ?? false);
                final bool isCartRewardItemEmpty =
                !(modelReward.order?.cartLength ?? false);

                if (statusOrderOngoing) {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: CommonButton(
                        width: screenWidth,
                        borderColor: blackColor,
                        borderWidth: 1,
                        text: 'Bantuan',
                        onPressed: () {
                          launchUrl(Uri.parse(modelReward.order!.whatsapp!));
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textColor: blackColor,
                        backgroundColor: baseColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        borderRadius: 30,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            width: screenWidth * 0.4,
                            borderColor: blackColor,
                            borderWidth: 1,
                            text: 'Bantuan',
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textColor: blackColor,
                            backgroundColor: baseColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            borderRadius: 30,
                          ),
                          CommonButton(
                            width: screenWidth * 0.4,
                            text: 'Pesan Ulang',
                            onPressed: () {
                              if (model?.order != null ||
                                  modelReward.order != null) {
                                if (isCartItemEmpty == true) {
                                  _showReorderOptions(context);
                                } else if (!isCartItemEmpty) {
                                  if (widget.orderId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrder(
                                            widget.orderId!));
                                  } else if (widget.orderRewardId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrderReward(
                                            widget.orderRewardId!));
                                  }
                                } else if (isCartRewardItemEmpty == true) {
                                  _showReorderOptions(context);

                                } else {
                                  if (widget.orderId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrder(
                                            widget.orderId!));
                                  } else if (widget.orderRewardId != null) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.postReOrderReward(
                                            widget.orderRewardId!));
                                  }
                                }
                              }
                            },
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textColor: baseColor,
                            backgroundColor: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            borderRadius: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              } else {
                return Container();
              }
            });
      },
    );
  }

  Widget buildShimmer({double? width, double? height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 15),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }

  void _showReorderOptions(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      icOrderDone,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    Text(
                      'Pesan ulang pesanan ini?',
                      style: txtSecondaryTitle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Keranjang anda sudah terisi dengan produk lain. Pesan ulang akan mengganti isi keranjang anda.',
                      style: txtSecondarySubTitle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          borderColor: blackColor,
                          borderWidth: 1,
                          text: 'Kembali',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: baseColor,
                          textColor: blackColor,
                          borderRadius: 30,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          text: 'Pesan Ulang',
                          onPressed: () {
                            Navigator.pop(context);

                            context.read<OrderBloc>().add(widget.orderId != null
                                ? OrderEvent.postReOrder(widget.orderId!)
                                : OrderEvent.postReOrderReward(
                                    widget.orderRewardId!));
                          },
                          backgroundColor: primaryColor,
                          textColor: baseColor,
                          borderRadius: 30,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
