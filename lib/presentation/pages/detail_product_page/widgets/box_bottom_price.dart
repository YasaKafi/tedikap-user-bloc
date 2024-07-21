import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/bloc/detail_product_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxBottomPrice extends StatelessWidget {
  const BoxBottomPrice({
    super.key,
    required this.screenWidth,
    required this.noteController,
    required this.cartItemId,
    required this.cartItemRewardId,
  });

  final double screenWidth;
  final TextEditingController noteController;
  final int? cartItemId;
  final int? cartItemRewardId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            color: baseColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<DetailProductBloc, DetailProductState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                        success: (modelProduct,
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
                            note) {
                          int itemPrice;

                          if (modelProduct != null) {
                            itemPrice = selectedSize == 'regular'
                                ? modelProduct.data?.regularPrice ?? 0
                                : modelProduct.data?.largePrice ?? 0;
                          } else {
                            itemPrice = selectedSize == 'regular'
                                ? modelProductReward?.data?.regularPoint ?? 0
                                : modelProductReward?.data?.largePoint ?? 0;
                          }
                          totalPrice = itemPrice * qty;
                          print(totalPrice);

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              modelProduct != null
                                  ? Row(
                                      children: [
                                        Text(
                                          'Rp',
                                          style: txtSecondarySubTitle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          totalPrice.toString(),
                                          style: txtPrimaryHeader.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          totalPrice.toString(),
                                          style: txtPrimaryHeader.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Poin',
                                          style: txtSecondarySubTitle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38),
                                        ),
                                      ],
                                    ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  BlocBuilder<DetailProductBloc, DetailProductState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => Center(
                                child: CircularProgressIndicator(),
                              ),
                          success: (modelProduct,
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
                              note) {
                            return Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<DetailProductBloc>()
                                        .add(DetailProductEvent.decrement());
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    size: 28,
                                  ),
                                  color: grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(qty.toString(),
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: blackColor)),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<DetailProductBloc>()
                                        .add(DetailProductEvent.increment());
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    size: 28,
                                  ),
                                  color: navyColor,
                                ),
                              ],
                            );
                          });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<DetailProductBloc, DetailProductState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('Failed to post Cart!', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: baseColor),),
                      //   backgroundColor: redMedium,
                      // ));
                      // context.pushNamed('dashboard');
                    },
                    success: (modelProduct,
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
                        note) {
                      if (modelCartUpdate != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Cart  updated successfully!',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: greenMedium,
                        ));
                        context.pushNamed('cart_common');
                      } else if (modelCartRewardUpdate != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Cart Reward updated successfully!',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: greenMedium,
                        ));
                        context.pushNamed('cart_reward');
                      } else if (modelCartPost != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Cart posted successfully!',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: greenMedium,
                        ));
                        context.pushNamed('dashboard');
                      } else if (modelCartPostReward != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Cart Reward posted successfully!',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: greenMedium,
                        ));
                        context.pushNamed('dashboard');
                      }
                    },
                  );
                },
                builder: (context, state) {
                  return state.when(
                      initial: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      success: (modelProduct,
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
                          note) {
                        return InkWell(
                          onTap: () {
                            int itemPrice;
                            if (modelProduct != null) {
                              itemPrice = selectedSize == 'regular'
                                  ? modelProduct.data?.regularPrice ?? 0
                                  : modelProduct.data?.largePrice ?? 0;
                            } else {
                              itemPrice = selectedSize == 'regular'
                                  ? modelProductReward?.data?.regularPoint ?? 0
                                  : modelProductReward?.data?.largePoint ?? 0;
                            }
                            totalPrice = itemPrice * qty;
                            if (modelProduct != null) {
                              final itemProductCommon = modelProduct.data;
                              final requestModel = PostCartRequestModel(
                                productId: itemProductCommon!.id,
                                temperatur: selectedTemp,
                                size: selectedSize,
                                ice: selectedIce,
                                sugar: selectedSugar,
                                note: noteController.text,
                                quantity: qty,
                                price: itemPrice,
                              );
                              final requestUpdateModel = PostCartRequestModel(
                                temperatur: selectedTemp,
                                size: selectedSize,
                                ice: selectedIce,
                                sugar: selectedSugar,
                                note: noteController.text,
                                quantity: qty,
                                price: itemPrice,
                              );
                              cartItemId != null
                                  ? context.read<DetailProductBloc>().add(
                                      DetailProductEvent.updateCart(
                                          requestUpdateModel, cartItemId!))
                                  : context.read<DetailProductBloc>().add(
                                      DetailProductEvent.postCart(
                                          requestModel));
                            } else {
                              final itemProductReward =
                                  modelProductReward!.data;
                              note = noteController.text;
                              final requestModel = PostCartRewardRequestModel(
                                rewardProductId: itemProductReward!.id,
                                temperatur: selectedTemp,
                                size: selectedSize,
                                ice: selectedIce,
                                sugar: selectedSugar,
                                note: noteController.text,
                                quantity: qty,
                                points: itemPrice,
                              );

                              final requestUpdateModel =
                                  PostCartRewardRequestModel(
                                temperatur: selectedTemp,
                                size: selectedSize,
                                ice: selectedIce,
                                sugar: selectedSugar,
                                note: noteController.text,
                                quantity: qty,
                                points: itemPrice,
                              );
                              cartItemRewardId != null
                                  ? context.read<DetailProductBloc>().add(
                                      DetailProductEvent.updateCartReward(
                                          requestUpdateModel,
                                          cartItemRewardId!))
                                  : context.read<DetailProductBloc>().add(
                                      DetailProductEvent.postCartReward(
                                          requestModel));
                            }
                          },
                          child: Container(
                            width: screenWidth,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeDefault),
                            decoration: BoxDecoration(
                              color: navyColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                                child: Text(
                              cartItemId != null || cartItemRewardId != null
                                  ? 'Update Cart'
                                  : 'Add to Cart',
                              style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: baseColor),
                            )),
                          ),
                        );
                      },
                      error: (message) => Center(
                            child: Text(message!),
                          ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
