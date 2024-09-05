import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';
import 'package:flutter/services.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/widgets/qr_code_generator.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxInfoStatus extends StatelessWidget {
  const BoxInfoStatus({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;



  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd MMMM yyyy | HH.mm').format(dateTime);
    return formattedDate;
  }

  void copyToClipboard(String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
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
    double dpi = MediaQuery.of(context).devicePixelRatio * 160;
    TextStyle textInfoStyle = dpi < 380 ? txtThirdSubTitle : txtSecondarySubTitle;
    TextStyle textStatusDescStyle = dpi < 380 ? txtSecondarySubTitle : txtPrimarySubTitle;
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(
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
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<DetailOrderBloc, DetailOrderState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => loadingCard(0.5, 40),
                        success: (model, rewardModel) {
                          final detailOrder = model?.order;
                          final detailOrderReward = rewardModel?.order;
                          if (detailOrder != null) {
                            return Text(
                              detailOrder.statusDescription!.toLowerCase(),
                                style: textStatusDescStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: grey,
                                ),
                            );
                          } else {
                            return Text(
                              detailOrderReward!.status!.toLowerCase(),
                              style: textStatusDescStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: grey,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      BlocBuilder<DetailOrderBloc, DetailOrderState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              final orderId = state.maybeWhen(
                                success: (model, rewardModel) {
                                  final detailOrder = model?.order;
                                  final detailOrderReward = rewardModel?.order;
                                  if (detailOrder != null) {
                                    return detailOrder.id;
                                  } else {
                                    return detailOrderReward!.id;
                                  }
                                },
                                orElse: () => null,
                              );

                              if (orderId != null) {
                                copyToClipboard(orderId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Order ID copied to clipboard')),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                state.maybeWhen(
                                  orElse: () => loadingCard(0.5, 20),
                                  success: (model, rewardModel) {
                                    final detailOrder = model?.order;
                                    final detailOrderReward = rewardModel?.order;
                                    if (detailOrder != null) {
                                      return Text(
                                        'ORDER ID: ${detailOrder.id}',
                                        style: textInfoStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor,
                                        ),
                                      );
                                    }
                                    return Text(
                                      'ORDER ID: ${detailOrderReward!.id}',
                                      style: textInfoStyle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: blackColor,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    final orderId = state.maybeWhen(
                                      success: (model, rewardModel) {
                                        final detailOrder = model?.order;
                                        final detailOrderReward = rewardModel?.order;
                                        if (detailOrder != null) {
                                          return detailOrder.id;
                                        } else {
                                          return detailOrderReward!.id;
                                        }
                                      },
                                      orElse: () => null,
                                    );

                                    if (orderId != null) {
                                      copyToClipboard(orderId);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Order ID copied to clipboard')),
                                      );
                                    }
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    size: 14,
                                    weight: 50,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
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
                              style: textInfoStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            );
                          }
                          return Text(
                            'Tanggal : ${formatDate(
                                rewardModel!.order!.createdAt!.toString())}',
                            style: textInfoStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<DetailOrderBloc, DetailOrderState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => loadingCard(0.5, 20),
                        success: (model, rewardModel) {
                          final detailOrder = model?.order;
                          if (detailOrder != null) {
                            bool statusOrder = detailOrder.status == 'pesanan siap diambil';
                            return Visibility(
                              visible: statusOrder,
                                child: QRCodeGeneratorPage(qrData: detailOrder.id,)
                            );
                          }
                          bool statusOrder = rewardModel?.order!.status == 'pesanan siap diambil';
                          return Visibility(
                              visible: statusOrder,
                              child: QRCodeGeneratorPage(qrData: rewardModel!.order!.id,)
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
                    success: (model, rewardModel) {
                      final detailOrder = model?.order;
                      final detailOrderReward = rewardModel?.order;
                      if (detailOrder != null) {
                        return SvgPicture.network(
                          TedikapApiRepository.getImageStatusOrder +
                              detailOrder.iconStatus!,
                          width: 80,
                          height: 80,
                        );
                      } else {
                        return SvgPicture.network(
                          TedikapApiRepository.getImageStatusOrder +
                              detailOrderReward!.iconStatus!,
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
