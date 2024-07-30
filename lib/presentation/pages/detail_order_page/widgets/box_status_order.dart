import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxInfoStatus extends StatelessWidget {
  const BoxInfoStatus({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMM yyyy | HH.mm').format(dateTime);
    return formattedDate;
  }

  Widget loadingCard(double width, double height) {
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
          vertical: Dimensions.paddingSizeDefault,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<DetailOrderBloc, DetailOrderState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => loadingCard(0.5, 20),
                        success: (model, rewardModel) {
                          final detailOrder = model?.order;
                          final detailOrderReward = rewardModel?.order;
                          if (detailOrder != null) {
                            return Text(
                              detailOrder.status!.toUpperCase(),
                              style: txtPrimaryTitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            );
                          } else {
                            return Text(
                              detailOrderReward!.status!.toUpperCase(),
                              style: txtPrimaryTitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Silahkan buka aplikasi E wallet kamu untuk melakukan pembayaran',
                    style: txtPrimarySubTitle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      BlocBuilder<DetailOrderBloc, DetailOrderState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => loadingCard(0.5, 20),
                            success: (model, rewardModel) {
                              final detailOrder = model?.order;
                              final detailOrderReward = rewardModel?.order;
                              if (detailOrder != null) {
                                return Text(
                                  'ORDER ID: ${detailOrder.id}',
                                  style: txtSecondarySubTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                );
                              }
                              return Text(
                                'ORDER ID: ${detailOrderReward!.id}',
                                style: txtSecondarySubTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.copy,
                        size: 14,
                        weight: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<DetailOrderBloc, DetailOrderState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => loadingCard(0.5, 20),
                        success: (model, rewardModel) {
                          final detailOrder = model?.order;
                          if (detailOrder != null) {
                            return Text(
                              'Tanggal : ${formatDate(
                                  detailOrder.createdAt!.toString())}',
                              style: txtSecondarySubTitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            );
                          }
                          return Text(
                            'Tanggal : ${formatDate(
                                rewardModel!.order!.createdAt!.toString())}',
                            style: txtSecondarySubTitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<DetailOrderBloc, DetailOrderState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => loadingCard(0.12, 50),
                  success: (model, rewardModel){
                    final detailOrder = model?.order;
                    final detailOrderReward = rewardModel?.order;
                    if (detailOrder != null) {
                      return SvgPicture.network(
                        TedikapApiRepository.getImageStatusOrder + detailOrder.iconStatus!,
                        width: 80,
                        height: 80,
                      );
                    } else {
                      return SvgPicture.network(
                        TedikapApiRepository.getImageStatusOrder + detailOrderReward!.iconStatus!,
                        width: 80,
                        height: 80,
                      );
                    }
                  }
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
