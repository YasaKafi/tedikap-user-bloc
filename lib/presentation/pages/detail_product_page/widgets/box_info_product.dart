import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';

class BoxInfoProduct extends StatelessWidget {
  BoxInfoProduct(
      {Key? key,
        required this.screenWidth,
        this.productId,
        this.productRewardId})
      : super(key: key);

  final double screenWidth;

  int? productId;
  int? productRewardId;

  @override
  Widget build(BuildContext context) {
    if (productId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailProduct(productId!));
    }
    if (productRewardId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailProductReward(productRewardId!));
    }
    return buildProductDetail(screenWidth);
  }

  Widget buildRewardProductDetail(
      double screenWidth,
      ) {
    return buildCommonDetail(screenWidth);
  }

  Widget buildProductDetail(double screenWidth) {
    return buildCommonDetail(screenWidth);
  }

  Widget buildCommonDetail(double screenWidth) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge,
            ),
            child: BlocBuilder<DetailProductBloc, DetailProductState>(
              builder: (context, state) {
                return state.when(
                    initial: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (model, modelReward) {
                      final itemProduct = model?.data;
                      final itemProductReward = modelReward?.data;
                      final imageUrl = itemProduct?.image ?? itemProductReward?.image ?? '';
                      final name = itemProduct?.name ?? itemProductReward?.name ?? 'Unknown';
                      final category = itemProduct?.category ?? itemProductReward?.category ?? 'Unknown';
                      final description = itemProduct?.description ?? itemProductReward?.description ?? 'No description';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(174, 174, 192, 0.5),
                                    spreadRadius: 3,
                                    blurRadius: 11,
                                    offset: Offset(
                                        4, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(imageUrl),
                                radius: 80,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            name,
                            style: txtSecondaryHeader.copyWith(
                                fontWeight: FontWeight.w700, color: blackColor),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '$category series',
                            style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: Colors.black38),
                          ),
                          const SizedBox(height: 15),
                          Divider(
                            height: 5,
                            color: grey,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Description',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            description,
                            style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w400, color: Colors.black38),
                          ),
                        ],
                      );
                    },
                    error: (message) => Center(
                      child: Text(message!),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}
