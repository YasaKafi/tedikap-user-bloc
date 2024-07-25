import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';
import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../global_components/common_button.dart';

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
  });

  final String status;
  final String totalItem;
  final String totalPrice;
  final List<OrderItem>? orderItems;
  final List<OrderRewardItem>? orderItemsReward;
  final String createdAt;
  final String? orderId;
  final String? orderRewardId;

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

  @override
  Widget build(BuildContext context) {
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
        color: Colors.white,
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: navyColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: txtSecondaryTitle.copyWith(
                      fontWeight: FontWeight.w600, color: baseColor),
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
            padding:  EdgeInsets.symmetric(
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
                    CommonButton(
                      text: 'Hubungi Admin',
                      onPressed: () {},
                      backgroundColor: navyColor,
                      textColor: baseColor,
                      borderRadius: 10,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    CommonButton(
                      text: 'Detail Pesanan',
                      borderRadius: 10,
                      fontSize: 12,
                      onPressed: () {
                        context.pushNamed(
                          orderId != null ? 'detail_order_common' : 'detail_order_reward',
                          pathParameters: {
                            if (orderId != null)
                              'orderId': orderId!
                            else
                              'orderRewardId': orderRewardId!,
                          },
                        );
                      },
                      backgroundColor: navyColor,
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
}
