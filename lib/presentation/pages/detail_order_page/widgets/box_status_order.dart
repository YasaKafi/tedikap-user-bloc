import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
              BlocBuilder<DetailOrderBloc, DetailOrderState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                    success: (model, rewardModel) {
                      if (model != null) {
                        final detailOrder = model.order!;
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detailOrder.status!.toUpperCase(),
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
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
                                  Text(
                                    'ORDER ID: ${detailOrder.id}',
                                    style: txtSecondarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.copy, size: 14, weight: 50,),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tanggal : ${formatDate(detailOrder.createdAt!.toString())}',
                                style: txtSecondarySubTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (rewardModel != null) {
                        final detailOrder = rewardModel.order!;
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detailOrder.status!.toUpperCase(),
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
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
                                  Text(
                                    'ORDER ID: ${detailOrder.id}',
                                    style: txtSecondarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: blackColor,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.copy, size: 14, weight: 50,),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tanggal : ${formatDate(detailOrder.createdAt!.toString())}',
                                style: txtSecondarySubTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(child: Text('No data available'));
                      }
                    },
                    error: (message) => Center(
                      child: Text(message!),
                    ),
                  );
                },
              ),
              Container(
                child: SvgPicture.asset(
                  icStatusOrder,
                  width: 80,
                  height: 80,
                ),
              )
            ],
          ),
        ));
  }
}
