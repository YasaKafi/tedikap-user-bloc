import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';

class BoxInfoProduct extends StatelessWidget {
  final double screenWidth;

  BoxInfoProduct({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildProductDetail(screenWidth);
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
                  success: (
                      modelProduct,
                      modelProductReward,
                      modelCartPost,
                      modelCartPostReward,
                      modelCartItem,
                      modelCartUpdate,
                      modelCartItemReward,
                      modelCartRewardUpdate,
                      isTempSelected,
                      selectedTemp,
                      isSizeSelected,
                      selectedSize,
                      isIceSelected,
                      selectedIce,
                      isSugarSelected,
                      selectedSugar,
                      qty,
                      totalPrice,
                      note,
                      ) {
                    String? name;
                    String? imageUrl;
                    String? category;
                    String? description;

                    if (modelProduct != null && modelProduct.data != null) {
                      imageUrl = modelProduct.data!.image;
                      name = modelProduct.data!.name;
                      category = modelProduct.data!.category;
                      description = modelProduct.data!.description;
                    } else if (modelProductReward != null && modelProductReward.data != null) {
                      imageUrl = modelProductReward.data!.image;
                      name = modelProductReward.data!.name;
                      category = modelProductReward.data!.category;
                      description = modelProductReward.data!.description;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (imageUrl != null)
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(174, 174, 192, 0.5),
                                    spreadRadius: 3,
                                    blurRadius: 11,
                                    offset: Offset(4, 5), // changes position of shadow
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
                        if (name != null)
                          Text(
                            name,
                            style: txtSecondaryHeader.copyWith(
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (category != null)
                          Text(
                            '$category series',
                            style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
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
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (description != null)
                          Text(
                            description,
                            style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.black38,
                            ),
                          ),
                      ],
                    );
                  },
                  error: (message) => Center(
                    child: Text(message!),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
