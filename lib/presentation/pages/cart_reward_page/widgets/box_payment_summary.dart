import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class BoxCheckoutSummary extends StatelessWidget {
  const BoxCheckoutSummary({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

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
          ),
          child: Column(
            children: [
              BlocConsumer<CartRewardBloc, CartRewardState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: (cartModel, modelQty, deleteModel, modelPostOrder,
                        ) {
                      if(cartModel != null){
                        if (cartModel.cart!.pointsEnough! == false && cartModel.cart!.cartItems!.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Your Point is not enough',
                              style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w500, color: baseColor),
                            ),
                            backgroundColor: redMedium,
                          ));
                        }
                      }

                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildShimmerEffect(context),
                    loading: (isPatchQTyLoading, cartModel) => _buildShimmerEffect(context),
                    success: (cartModel, modelQty, deleteModel, modelPostOrder,
                        ) {
                      if (cartModel != null) {
                        final itemCart = cartModel.cart;
                        final isPhone = cartModel.cart?.isPhone;
                        final isCartItemEmpty =
                            itemCart?.cartItems?.isEmpty ?? true;
                        final isStockItemEmpty = itemCart?.cartItems?.any((e) => e.stock == false) ?? false;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black38),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(icLogoPrimary, width: 18,),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      itemCart!.totalPoints.toString(),
                                      style: txtPrimaryHeader.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (!isCartItemEmpty) {
                                      if (isStockItemEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                            'Stock product is out of stock',
                                            style: txtSecondaryTitle.copyWith(
                                                fontWeight: FontWeight.w500, color: baseColor),
                                          ),
                                          backgroundColor: redMedium,
                                        ));
                                      } else {
                                        isPhone == true ?
                                        _onAlertButtonsPressed(context,
                                            bgcolor: baseColor,
                                            title: 'Kebijakan Privasi',
                                            titleStyle: txtSecondaryHeader.copyWith(
                                                fontWeight: FontWeight.w600, color: blackColor),
                                            descStyle: txtPrimarySubTitle.copyWith(
                                                fontWeight: FontWeight.w500, color: blackColor),
                                            desc: 'Kamu tidak dapat melakukan pembatalan atau perubahan apapun pada pesanan setelah melakukan pembayaran.',
                                            icon: icAlert,
                                            onPressed: () {
                                              if (cartModel.cart!.pointsEnough! == false) {
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Text(
                                                    'Your Point is not enough',
                                                    style: txtSecondaryTitle.copyWith(
                                                        fontWeight: FontWeight.w500, color: baseColor),
                                                  ),
                                                  backgroundColor: redMedium,
                                                ));
                                                context.pop();
                                              } else {

                                                _showLoadingDialog(context);
                                                context.read<CartRewardBloc>().add(
                                                    CartRewardEvent.postOrder(
                                                      cartId: itemCart.id,
                                                      onOrderSuccess: (orderId) {
                                                        // Pastikan ini dipanggil
                                                        context.goNamed(
                                                          'detail_order_reward',
                                                          pathParameters: {'orderRewardId': orderId},
                                                        );
                                                      },
                                                    ));
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Text(
                                                    'Successfully order reward product',
                                                    style: txtSecondaryTitle.copyWith(
                                                        fontWeight: FontWeight.w500, color: baseColor),
                                                  ),
                                                  backgroundColor: greenMedium,
                                                ));
                                              }
                                            }) : _showPhoneRequiredAlert(context);
                                      }

                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: Dimensions.paddingSizeDefault,
                                        horizontal:
                                            Dimensions.paddingSizeLarge),
                                    decoration: BoxDecoration(
                                      color: isCartItemEmpty ? grey : navyColor,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(25)),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          icMoney,
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Pay',
                                          style: txtSecondaryTitle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: baseColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return _buildShimmerEffect(context);
                      }
                    },
                    error: (message) => _buildShimmerEffect(context),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showPhoneRequiredAlert(BuildContext context) {
    Alert(
      context: context,
      title: 'Phone Number Required',
      padding: const EdgeInsets.all(20),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        backgroundColor: baseColor,
        overlayColor: Colors.black38,
        titleStyle:
        txtSecondaryHeader
            .copyWith(
            fontWeight:
            FontWeight
                .w600,
            color:
            blackColor),
        descStyle: txtPrimarySubTitle
            .copyWith(
            fontWeight:
            FontWeight
                .w400,
            color:
            blackColor),
      ),
      desc: 'Please fill your phone number before proceeding with the payment',
      image: SvgPicture.asset(
        icPhoneNumberEmpty,
        width: 120,
        height: 120,
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: redMedium,
          child: Text(
            "Cancel",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),
        DialogButton(
            color: navyColor,
            onPressed: (){
              Navigator.of(context).pop(); // Menutup dialog
              context.pushNamed('edit_profile');
            },
            child: Text(
              "Edit Profile",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            ))
      ],
    ).show();
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            insetPadding: EdgeInsets.zero,
            backgroundColor: baseColor,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(navyColor),
                    ),
                    const SizedBox(height: 20,),
                    Text('Harap tunggu...', style: txtSecondaryTitle.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShimmerEffect(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 3),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeDefault,
                    horizontal: Dimensions.paddingSizeLarge),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onAlertButtonsPressed(context,
      {String? title,
      TextStyle? titleStyle,
      TextStyle? descStyle,
      String? desc,
      String? icon,
      Color? bgcolor,
      VoidCallback? onPressed}) {
    Alert(
      context: context,
      title: title,
      padding: const EdgeInsets.all(20),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        backgroundColor: bgcolor,
        overlayColor: Colors.black38,
        titleStyle: titleStyle!,
        descStyle: descStyle!,
      ),
      desc: desc,
      image: SvgPicture.asset(
        icon!,
        width: 80,
        height: 80,
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: redMedium,
          child: Text(
            "Cancel",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),
        DialogButton(
            color: navyColor,
            onPressed: onPressed,
            child: Text(
              "Confirm",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            ))
      ],
    ).show();
  }
}

