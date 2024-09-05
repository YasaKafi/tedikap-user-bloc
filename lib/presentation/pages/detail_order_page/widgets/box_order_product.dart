import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../data/models/response/cart_item_reward_response_model.dart';
import '../../../../data/repository/tedikap_repository.dart';

class BoxProductOrder extends StatelessWidget {
  const BoxProductOrder({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  String _buildProductDescription(OrderRewardItem item) {
    List<String> details = [];
    if (item.temperatur != null) {
      details.add('${item.temperatur} temp');
    }
    if (item.size != null) {
      details.add('${item.size} size');
    }
    if (item.ice != null) {
      details.add('${item.ice} ice');
    }
    if (item.sugar != null) {
      details.add('${item.sugar} sugar');
    }
    return details.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingCard(double width, double height) {
      double screenWidth = MediaQuery.of(context).size.width;
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: screenWidth * width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Daftar Pesanan',
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<DetailOrderBloc, DetailOrderState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      Center(
                        child: loadingCard(screenWidth, 200),
                      ),
                  loading: () => loadingCard(screenWidth, 200),
                  success: (model, rewardModel) {
                    if (model != null && model.order != null &&
                        model.order!.orderItems != null) {
                      return Column(
                        children: List.generate(model.order!.orderItems!
                            .length, (index) {
                          final detailOrderItem = model.order!
                              .orderItems![index];
                          final formattedPriceCommon = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp',
                            decimalDigits: 0, // Tidak ada digit desimal
                          ).format(int.parse(detailOrderItem.price.toString()));
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: Dimensions.marginSizeSmall),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: ShapeDecoration(
                                        color: const Color(0x0C56473C),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(12))),
                                        image: DecorationImage(
                                          image: NetworkImage(TedikapApiRepository.getImage + detailOrderItem.productImage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(detailOrderItem.productName!,
                                              style: txtSecondaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor)),
                                          Text(
                                              '${detailOrderItem
                                                  .temperatur} temp, ${detailOrderItem
                                                  .size} size, ${detailOrderItem
                                                  .ice} ice, ${detailOrderItem
                                                  .sugar} sugar',
                                              style: txtPrimarySubTitle.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black38)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              detailOrderItem.note == null ? SizedBox() :
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: greybgNote,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    width: screenWidth,
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.paddingSizeDefault,
                                        horizontal: Dimensions
                                            .paddingSizeDefault),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        SvgPicture.asset(
                                          icNote,
                                          width: 18,
                                          height: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Text(
                                              detailOrderItem.note ?? '',
                                              style: txtPrimarySubTitle
                                                  .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: greytxtNote),
                                              maxLines: 1,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(formattedPriceCommon,
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                  Text('${detailOrderItem.quantity}x',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        }),
                      );
                    } else
                    if (rewardModel != null && rewardModel.order != null &&
                        rewardModel.order!.orderRewardItems != null) {
                      return Column(
                        children: List.generate(rewardModel.order!
                            .orderRewardItems!.length, (index) {
                          final detailOrderItemReward = rewardModel.order!
                              .orderRewardItems![index];
                          return Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: ShapeDecoration(
                                      color: const Color(0x0C56473C),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12))),
                                      image: DecorationImage(
                                        image: NetworkImage(TedikapApiRepository.getImageRewardProduct + detailOrderItemReward.productImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                            detailOrderItemReward.productName!,
                                            style: txtSecondaryTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor)),
                                        Visibility(
                                          visible: detailOrderItemReward.temperatur != null || detailOrderItemReward.size != null || detailOrderItemReward.ice != null || detailOrderItemReward.sugar != null,
                                          child: Text(
                                            _buildProductDescription(detailOrderItemReward),
                                            style: txtPrimarySubTitle.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              detailOrderItemReward.note == null ? SizedBox() :
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: greybgNote,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    width: screenWidth,
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.paddingSizeDefault,
                                        horizontal: Dimensions
                                            .paddingSizeDefault),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        SvgPicture.asset(
                                          icNote,
                                          width: 18,
                                          height: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Text(
                                              detailOrderItemReward.note ?? '',
                                              style: txtPrimarySubTitle
                                                  .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: greytxtNote),
                                              maxLines: 1,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(icLogoPrimary, width: 24, height: 24),
                                      const SizedBox(width: 5),
                                      Text('${detailOrderItemReward.points}',
                                          style: txtSecondaryTitle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor)),
                                    ],
                                  ),
                                  Text('${detailOrderItemReward.quantity}x',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        }),
                      );
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
                  error: (message) => Center(child: Text(message!)),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}