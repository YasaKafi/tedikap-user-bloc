import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class InputNotes extends StatelessWidget {
  final TextEditingController notesController;

  InputNotes({super.key, required this.notesController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Notes',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor)),
                  SizedBox(
                    width: 5,
                  ),
                  Text('(Optional)',
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor)),
                ],
              ),
              SizedBox(height: 10),
              BlocBuilder<DetailProductBloc, DetailProductState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => buildLoadingShimmer(context),
                    loading: () => buildLoadingShimmer(context),
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
                      if (modelCartItem != null) {
                        notesController.text = note;
                      } else if (modelCartItemReward != null) {
                        notesController.text = note;
                      }
                      return TextFormField(
                        controller: notesController,
                        maxLength: 50,
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor),
                        decoration: InputDecoration(
                          hintText: 'Add notes here..',
                          hintStyle: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: grey),
                          ),
                        ),
                      );
                    },
                    error: (message) => Center(
                      child: Text(message!),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLoadingShimmer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.3,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: screenWidth * 0.8,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}