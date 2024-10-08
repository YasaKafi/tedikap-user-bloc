import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_request_model.dart';
import 'package:tedikap_user_bloc/data/models/request/post_cart_reward_request_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_reward_response_model.dart';
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
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: BlocConsumer<DetailProductBloc, DetailProductState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
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
                  if (modelCartUpdate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Cart updated successfully!',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: baseColor),
                      ),
                      backgroundColor: greenMedium,
                    ));
                    context.goNamed('cart_common');
                  } else if (modelCartRewardUpdate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Cart Reward updated successfully!',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: baseColor),
                      ),
                      backgroundColor: greenMedium,
                    ));
                    context.goNamed('cart_reward');
                  } else if (modelCartPost != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Cart posted successfully!',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: baseColor),
                      ),
                      backgroundColor: greenMedium,
                    ));
                    context.goNamed('cart_common');
                  } else if (modelCartPostReward != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Cart Reward posted successfully!',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: baseColor),
                      ),
                      backgroundColor: greenMedium,
                    ));
                    context.goNamed('cart_reward');
                  }
                },
              );
            },
            builder: (context, state) {
              return state.when(
                initial: () => buildLoadingShimmer(screenWidth),
                loading: (isPostCartLoading,
                    isPostFavorite,
                    modelProduct,
                    modelProductReward,
                    selectedTemp,
                    selectedSize,
                    selectedIce,
                    selectedSugar,
                    qty,
                    totalPrice,
                    note,
                    modelCart,
                    modelCartReward
                    ) {
                  if (isPostFavorite || isPostCartLoading) {
                    if (modelProduct != null || modelProductReward != null) {
                      int itemPrice;
                      final itemStockCommon = modelProduct?.data?.stock;
                      final itemStockReward = modelProductReward?.data?.stock;
                      final bool? itemStock = modelProduct?.data?.stock != null
                          ? itemStockCommon
                          : itemStockReward;

                      String txtButton;

                      if (itemStock == false) {
                        txtButton = 'Sold out';
                      } else if (cartItemId != null ||
                          cartItemRewardId != null) {
                        txtButton = 'Update Cart';
                      } else {
                        txtButton = 'Add to Cart';
                      }

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

                      final formattedPrice = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: '',
                        decimalDigits: 0, // Tidak ada digit desimal
                      ).format(int.parse(totalPrice.toString()));

                      return buildColumnBoxPrice(
                        modelProduct,
                        formattedPrice,
                        totalPrice,
                        context,
                        qty,
                        itemStock,
                        selectedTemp,
                        selectedSize,
                        selectedIce,
                        selectedSugar,
                        modelProductReward,
                        note,
                        itemPrice,
                        txtButton,
                        isPostFavorite == true ? null : LoadingAnimationWidget.staggeredDotsWave(
                          color: baseColor,
                          size: 25,
                        ),
                      );
                    }
                  }
                  return buildLoadingShimmer(screenWidth);
                },
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
                  int itemPrice;
                  final itemStockCommon = modelProduct?.data?.stock;
                  final itemStockReward = modelProductReward?.data?.stock;
                  final bool? itemStock = modelProduct?.data?.stock != null
                      ? itemStockCommon
                      : itemStockReward;

                  String txtButton;

                  if (itemStock == false) {
                    txtButton = 'Sold out';
                  } else if (cartItemId != null || cartItemRewardId != null) {
                    txtButton = 'Update Cart';
                  } else {
                    txtButton = 'Add to Cart';
                  }

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

                  final formattedPrice = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: '',
                    decimalDigits: 0, // Tidak ada digit desimal
                  ).format(int.parse(totalPrice.toString()));

                  return buildColumnBoxPrice(
                      modelProduct,
                      formattedPrice,
                      totalPrice,
                      context,
                      qty,
                      itemStock,
                      selectedTemp,
                      selectedSize,
                      selectedIce,
                      selectedSugar,
                      modelProductReward,
                      note,
                      itemPrice,
                      txtButton,
                    null,
                  );
                },
                error: (message) => buildLoadingShimmer(screenWidth),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildColumnBoxPrice(
      DetailProductResponseModel? modelProduct,
      String formattedPrice,
      int totalPrice,
      BuildContext context,
      int qty,
      bool? itemStock,
      String selectedTemp,
      String selectedSize,
      String selectedIce,
      String selectedSugar,
      DetailProductRewardResponseModel? modelProductReward,
      String note,
      int itemPrice,
      String txtButton,
      Widget? widgetLoading) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                          const SizedBox(width: 5),
                          Text(
                            formattedPrice,
                            style: txtPrimaryHeader.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Text(
                            totalPrice.toString(),
                            style: txtPrimaryHeader.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Point',
                            style: txtSecondarySubTitle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black38),
                          ),
                        ],
                      ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context
                        .read<DetailProductBloc>()
                        .add(const DetailProductEvent.decrement());
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    size: 28,
                  ),
                  color: qty != 1 ? navyColor : grey,
                ),
                const SizedBox(width: 10),
                Text(qty.toString(),
                    style: txtSecondaryTitle.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor)),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    context
                        .read<DetailProductBloc>()
                        .add(const DetailProductEvent.increment());
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    size: 28,
                  ),
                  color: qty != 99 ? navyColor : grey,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            if (itemStock == true) {
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
                );

                final requestUpdateModel = PostCartRequestModel(
                  productId: itemProductCommon.id,
                  temperatur: selectedTemp,
                  size: selectedSize,
                  ice: selectedIce,
                  sugar: selectedSugar,
                  note: noteController.text,
                  quantity: qty,
                );

                cartItemId != null
                    ? context.read<DetailProductBloc>().add(
                        DetailProductEvent.updateCart(
                            requestUpdateModel, cartItemId!))
                    : context
                        .read<DetailProductBloc>()
                        .add(DetailProductEvent.postCart(requestModel));
              } else {
                final itemProductReward = modelProductReward!.data;
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

                final requestUpdateModel = PostCartRewardRequestModel(
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
                            requestUpdateModel, cartItemRewardId!))
                    : context
                        .read<DetailProductBloc>()
                        .add(DetailProductEvent.postCartReward(requestModel));
              }
            }
          },
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeDefault),
            decoration: BoxDecoration(
              color: (itemStock ?? false) ? navyColor : grey,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: widgetLoading ??
                  Text(
                    txtButton,
                    style: txtPrimaryTitle.copyWith(
                        fontWeight: FontWeight.w600, color: baseColor),
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoadingShimmer(double screenWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.3,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
              ),
              Container(
                width: screenWidth * 0.2,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
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
