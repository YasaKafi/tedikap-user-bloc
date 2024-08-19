import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/order_page/widgets/review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../../data/repository/global_variabel.dart';
import '../../../global_components/common_button.dart';
import '../bloc/order_bloc.dart';

class ListBoxMenuStatus extends StatelessWidget {
  const ListBoxMenuStatus({
    super.key,
    required this.status,
    required this.totalItem,
    required this.totalPrice,
    this.orderItems,
    this.orderItemsReward,
    required this.createdAt,
    this.orderId,
    this.orderRewardId,
    required this.waLink, required this.rating,
  });

  final String status;
  final String totalItem;
  final String totalPrice;
  final List<OrderItem>? orderItems;
  final List<OrderRewardItem>? orderItemsReward;
  final String createdAt;
  final String? orderId;
  final String? orderRewardId;
  final String waLink;
  final double? rating;

  String getTimeDifference() {
    DateTime createdTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(createdAt);
    Duration difference = DateTime.now().difference(createdTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mnt yg lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yg lalu';
    } else {
      return '${difference.inDays} hari yg lalu';
    }
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
    String titleCommonButton;
    Color backgroundColor;
    if (status == 'pesanan dibatalkan' || status == 'pesanan ditolak') {
      backgroundColor = navyColor;
      titleCommonButton = 'Pesan Ulang';
    } else if (status == 'pesanan selesai') {
      backgroundColor = navyColor;
      titleCommonButton = 'Pesan Ulang';
    } else if (status == 'menunggu pembayaran') {
      backgroundColor = navyColor;
      titleCommonButton = 'Lanjutkan Pembayaran';
    } else {
      backgroundColor = navyColor;
      titleCommonButton = 'Hubungi Admin';
    }

    return Container(
      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
      margin: const EdgeInsets.only(
        left: Dimensions.marginSizeLarge,
        right: Dimensions.marginSizeLarge,
        top: Dimensions.marginSizeLarge,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.1),
        shape: BoxShape.rectangle,
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: txtSecondaryTitle.copyWith(
                      fontWeight: FontWeight.w600, color: baseColor),
                ),
                Visibility(
                  visible: status == 'pesanan selesai',
                  child: RatingBarIndicator(
                    rating: rating ?? 0,
                    unratedColor: grey,
                    itemSize: 20,
                      itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(icPickUp, width: 24, height: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Pick Up',
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                  ],
                ),
                Text(
                  'Rp$totalPrice',
                  style: txtPrimarySubTitle.copyWith(
                      fontWeight: FontWeight.w500, color: blackColor),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeExtraSmall),
            child: Divider(
              color: grey,
              height: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order ID: ${orderId ?? orderRewardId}',
                      style: txtSecondarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                    Text(
                      getTimeDifference(),
                      style: txtSecondarySubTitle.copyWith(
                          fontWeight: FontWeight.w400, color: blackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(icOutlet, width: 18, height: 18),
                        const SizedBox(width: 5),
                        Text(
                          'Tedikap Raden Umar Said',
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor),
                        ),
                      ],
                    ),
                    Text(
                      '$totalItem Item',
                      style: txtSecondarySubTitle.copyWith(
                          fontWeight: FontWeight.w400, color: blackColor),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (orderItems != null)
                              for (var item in orderItems!)
                                Text(
                                  "${item.productName}, ",
                                  style: txtSecondarySubTitle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                            if (orderItemsReward != null)
                              for (var item in orderItemsReward!)
                                Text(
                                  "${item.productName}, ",
                                  style: txtSecondarySubTitle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Container();
                          },
                          success: (model,
                              modelReward,
                              filterIndex,
                              modelReOrder,
                              modelReOrderReward,
                              modelReview,
                              isPesananDitolak,
                              isPesananDibatalkan,
                              isPesananSelesai,
                              startDate,
                              endDate,
                              isPesananDitolakReward,
                              isPesananSelesaiReward,
                              startDateReward,
                              endDateReward,
                              ) {
                            bool isModelCartNotEmpty =
                                model?.orders?.first.cartLength ?? false;

                            bool isModelCartRewardNotEmpty =
                                modelReward?.orders?.first.cartLength ?? false;
                            print(
                                "INI BOOL MODEL REWARD $isModelCartRewardNotEmpty");
                            return Row(
                              children: [
                                CommonButton(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  text: titleCommonButton,
                                  onPressed: () {
                                    if (model?.orders != null ||
                                        modelReward?.orders != null) {
                                      bool isOrderStatusForReorder =
                                          status == 'pesanan selesai' ||
                                              status == 'pesanan dibatalkan' ||
                                              status == 'pesanan ditolak';

                                      bool isOrderStatusForCallAdmin =
                                          status == 'pesanan diproses' ||
                                              status == 'menunggu konfirmasi' ||
                                              status == 'pesanan siap diambil';

                                      bool isOrderStatusForContinuePayment =
                                          status == 'menunggu pembayaran';

                                      if (isOrderStatusForReorder) {
                                        if (isModelCartNotEmpty == true) {
                                          _showReorderOptions(
                                              context, backgroundColor);
                                        } else if (!isModelCartNotEmpty) {
                                          if (orderId != null) {
                                            context.read<OrderBloc>().add(
                                                OrderEvent.postReOrder(
                                                    orderId!));
                                          } else if (orderRewardId != null) {
                                            context.read<OrderBloc>().add(
                                                OrderEvent.postReOrderReward(
                                                    orderRewardId!));
                                          }
                                        } else if (isModelCartRewardNotEmpty ==
                                            true) {
                                          _showReorderOptions(
                                              context, backgroundColor);
                                          // Check if it's a normal or reward order and trigger the appropriate even
                                        } else {
                                          if (orderId != null) {
                                            context.read<OrderBloc>().add(
                                                OrderEvent.postReOrder(
                                                    orderId!));
                                          } else if (orderRewardId != null) {
                                            context.read<OrderBloc>().add(
                                                OrderEvent.postReOrderReward(
                                                    orderRewardId!));
                                          }
                                        }
                                      } else if (isOrderStatusForCallAdmin) {
                                        launchUrl(Uri.parse(waLink));
                                      } else {
                                        if (GlobalVariables
                                                .linkCheckoutGlobal !=
                                            null) {
                                          launchUrl(Uri.parse(GlobalVariables
                                              .linkCheckoutGlobal!));
                                        }
                                      }
                                    }
                                  },
                                  backgroundColor: backgroundColor,
                                  textColor: baseColor,
                                  borderRadius: 10,
                                  fontSize:
                                      status == 'menunggu pembayaran' ? 10 : 10,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Visibility(
                                  child: CommonButton(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    text: 'Rate Order',
                                    borderRadius: 10,
                                    fontSize: 10,
                                    onPressed: () {
                                      if (orderId != null || orderRewardId != null) {
                                        context.pushNamed('review', extra: {'orderId': orderId, 'orderRewardId': orderRewardId});
                                      } else {
                                        // Handle null values here if needed
                                        print('Order ID or Order Reward ID is null');
                                      }
                                    },
                                    backgroundColor: backgroundColor,
                                    textColor: baseColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  visible: status == 'pesanan selesai',
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    CommonButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      text: 'Detail Pesanan',
                      borderRadius: 10,
                      fontSize: 10,
                      onPressed: () {
                        context.pushNamed(
                          orderId != null
                              ? 'detail_order_common'
                              : 'detail_order_reward',
                          pathParameters: {
                            if (orderId != null)
                              'orderId': orderId!
                            else
                              'orderRewardId': orderRewardId!,
                          },
                        );
                      },
                      backgroundColor: backgroundColor,
                      textColor: baseColor,
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
  }

  void _showReorderOptions(BuildContext context, Color backgroundColor) {
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
                            if (status == 'pesanan selesai' ||
                                status == 'pesanan dibatalkan' ||
                                status == 'pesanan ditolak') {
                              context.read<OrderBloc>().add(orderId != null
                                  ? OrderEvent.postReOrder(orderId!)
                                  : OrderEvent.postReOrderReward(
                                      orderRewardId!));
                            }
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
