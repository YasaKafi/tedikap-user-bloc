import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_bottom_price.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_info_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_option_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/input_notes.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'bloc/detail_product_bloc.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage(
      {super.key,
        this.productId,
        this.productRewardId,
        this.cartItemId,
        this.cartItemRewardId});

  int? productId;
  int? productRewardId;
  int? cartItemId;
  int? cartItemRewardId;

  TextEditingController notesController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    if (cartItemId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailItemCart(cartItemId!));

    } else if (cartItemRewardId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailItemCartReward(cartItemRewardId!));
    } else if (productId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailProduct(productId!));

    } else if (productRewardId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailProductReward(productRewardId!));
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor50,
          ),
          padding:
          const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    context.pop();
                  } else if (cartItemId != null) {
                    context.goNamed('cart_common');
                  } else if (cartItemRewardId != null) {
                    context.goNamed('cart_reward');
                  }
                },
              ),
              Text(
                'Detail Product',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocConsumer<DetailProductBloc, DetailProductState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: (modelProduct,
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
                            note,) {
                          final itemIsLiked = modelPostFavorite?.message;
                          if (itemIsLiked == 'Liked') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Successfully added from my favorite!',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: baseColor),
                              ),
                              backgroundColor: greenMedium,
                            ));
                          } else if (itemIsLiked == 'Unliked') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Successfully removed from my favorite!',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: baseColor),
                              ),
                              backgroundColor: redMedium,
                            ));
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.when(
                        initial: () => buildLoadingShimmer(),
                        loading: () => buildLoadingShimmer(),
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
                          return InkWell(
                              onTap: () {
                                if(productId != null){
                                  context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(productId!));
                                } else if (productRewardId != null){
                                  context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(productRewardId!));
                                } else if (cartItemId != null) {
                                  context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(modelCartItem!.cartItem!.productId!));
                                } else if (cartItemRewardId != null) {
                                  context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(modelCartItemReward!.cartItem!.productId!));
                                }
                              },
                              child: (productRewardId == null && cartItemRewardId == null)
                                  ? Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: (modelProduct?.data?.isLiked ?? false) == false
                                      ? SvgPicture.asset(
                                    icHeart,
                                    width: 24,
                                    height: 24,
                                  )
                                      : SvgPicture.asset(
                                    icHeartActive,
                                    width: 24,
                                    height: 24,
                                  )
                              )
                                  : Container(width: 24),
                          );
                        },
                        error: (message) => Center(
                          child: Text(message!),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: baseColor50,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BoxInfoProduct(
                          screenWidth: screenWidth,
                        ),
                        const SizedBox(height: 20),
                        BoxOptionProduct(),
                        const SizedBox(height: 20),
                        InputNotes(
                          notesController: notesController,
                        ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: BoxBottomPrice(
                screenWidth: screenWidth,
                noteController: notesController,
                cartItemId: cartItemId,
                cartItemRewardId: cartItemRewardId,
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildLoadingShimmer() {

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
      ),
    );
  }
}

