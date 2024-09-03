import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';

class BoxInfoProduct extends StatelessWidget {
  final double screenWidth;

  const BoxInfoProduct({super.key, required this.screenWidth});

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
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge,
            ),
            child: BlocBuilder<DetailProductBloc, DetailProductState>(
              builder: (context, state) {
                return state.when(
                  initial: () => buildLoadingShimmer(),
                  loading: (isPostCartLoading, isPostFavorite, model, modelReward, selectedTemp, selectedSize, selectedIce,selectedSugar, qty , totalPrice, note, modelCart,
                      modelCartReward) {
                    if (isPostCartLoading || isPostFavorite) {
                      if (model != null || modelReward != null) {
                        return _buildProductDetailContent(state, model, modelReward);
                      }
                    }
                    return buildLoadingShimmer();

                  } ,
                  success: (
                      modelProduct,
                      modelProductReward,
                      modelCartPost,
                      modelCartPostReward,
                      modelCartItem,
                      modelCartUpdate,
                      modelCartItemReward,
                      modelCartRewardUpdate,
                      modelPostFavorite,
                      modelFavorite,
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


                    if (modelProduct != null || modelProductReward != null){
                      return _buildProductDetailContent(state, modelProduct, modelProductReward);

                    }
                    return SizedBox();
                  },
                  error: (message) => buildLoadingShimmer(),

                );
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget buildLoadingShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: grey,
              ),
              width: 160,
              height: 160,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            height: 20,
            width: screenWidth * 0.5,
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            height: 20,
            width: screenWidth * 0.3,
          ),
          const SizedBox(height: 15),
          const Divider(
            height: 5,
            color: grey,
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            height: 20,
            width: screenWidth * 0.4,
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            height: 20,
            width: screenWidth * 0.8,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetailContent(DetailProductState state, DetailProductResponseModel? modelProduct, DetailProductRewardResponseModel? modelProductReward) {
    String? name;
    String? imageUrl;
    String? category;
    String? description;

    if (modelProduct != null && modelProduct.data != null) {
      imageUrl = TedikapApiRepository.getImage+ modelProduct.data!.image!;
      name = modelProduct.data!.name;
      category = modelProduct.data!.category;
      description = modelProduct.data!.description;
    } else if (modelProductReward != null && modelProductReward.data != null) {
      imageUrl =TedikapApiRepository.getImageRewardProduct +  modelProductReward.data!.image!;
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
              decoration: const BoxDecoration(
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
        const Divider(
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



  }

}
