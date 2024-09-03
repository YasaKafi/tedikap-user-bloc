import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_item_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_product_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_bottom_price.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_info_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_option_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/input_notes.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import 'bloc/detail_product_bloc.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({
    super.key,
    this.productId,
    this.productRewardId,
    this.cartItemId,
    this.cartItemRewardId,
  });

  final int? productId;
  final int? productRewardId;
  final int? cartItemId;
  final int? cartItemRewardId;

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late TextEditingController notesController;
  bool isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();

    if (widget.cartItemId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailItemCart(widget.cartItemId!));
    } else if (widget.cartItemRewardId != null) {
      context.read<DetailProductBloc>().add(
          DetailProductEvent.getDetailItemCartReward(widget.cartItemRewardId!));
    } else if (widget.productId != null) {
      context
          .read<DetailProductBloc>()
          .add(DetailProductEvent.getDetailProduct(widget.productId!));
    } else if (widget.productRewardId != null) {
      context.read<DetailProductBloc>().add(
          DetailProductEvent.getDetailProductReward(widget.productRewardId!));
    }
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  } else if (widget.cartItemId != null) {
                    context.goNamed('cart_common');
                  } else if (widget.cartItemRewardId != null) {
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
                          final itemIsLiked = modelPostFavorite?.message;
                          if (itemIsLiked == 'Liked') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Successfully added to my favorite!',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: baseColor),
                              ),
                              backgroundColor: greenMedium,
                            ));
                          } else if (itemIsLiked == 'Unliked') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Successfully removed from my favorite!',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: baseColor),
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
                            modelCartItem,
                            modelCartItemReward) {
                          if (isPostCartLoading) {
                            return buildInkWellFavorite(context, modelCartItem,
                                modelCartItemReward, modelProduct);
                          }
                          return buildLoadingShimmer();
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
                          return buildInkWellFavorite(context, modelCartItem,
                              modelCartItemReward, modelProduct);
                        },
                        error: (message) => buildLoadingShimmer(),
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
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
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
                      const BoxOptionProduct(),
                      const SizedBox(height: 20),
                      InputNotes(
                        notesController: notesController,
                        isFirstLoad: isFirstLoad,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: BoxBottomPrice(
                screenWidth: screenWidth,
                noteController: notesController,
                cartItemId: widget.cartItemId,
                cartItemRewardId: widget.cartItemRewardId,
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell buildInkWellFavorite(
      BuildContext context,
      CartItemResponseModel? modelCartItem,
      CartItemRewardResponseModel? modelCartItemReward,
      DetailProductResponseModel? modelProduct) {
    return InkWell(
      onTap: () {
        if (widget.productId != null) {
          context
              .read<DetailProductBloc>()
              .add(DetailProductEvent.postFavorite(widget.productId!));
        } else if (widget.productRewardId != null) {
          context
              .read<DetailProductBloc>()
              .add(DetailProductEvent.postFavorite(widget.productRewardId!));
        } else if (widget.cartItemId != null) {
          context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(
              modelCartItem!.cartItem!.productId!));
        } else if (widget.cartItemRewardId != null) {
          context.read<DetailProductBloc>().add(DetailProductEvent.postFavorite(
              modelCartItemReward!.cartItem!.productId!));
        }
      },
      child: (widget.productRewardId == null && widget.cartItemRewardId == null)
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
                    ),
            )
          : Container(width: 24),
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
