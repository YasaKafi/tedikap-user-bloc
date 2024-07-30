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
  BoxCheckoutSummary({
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

              BlocBuilder<CartRewardBloc, CartRewardState>(
                builder: (context, state) {
                  return state.when(
                      initial: () =>  _buildShimmerEffect(context),
                      loading: () => _buildShimmerEffect(context),
                      success: (cartModel,  modelQty, deleteModel, modelPostOrder){
                        if(cartModel != null){
                          final itemCart = cartModel.cart;
                          final isCartItemEmpty = itemCart?.cartItems?.isEmpty ?? true;
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rp',
                                        style: txtSecondarySubTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38),
                                      ),
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
                                      isCartItemEmpty ? null :
                                      _onAlertButtonsPressed(context,
                                          bgcolor: baseColor,
                                          title: 'Kebijakan Privasi',
                                          titleStyle: txtSecondaryHeader.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor),
                                          descStyle: txtPrimarySubTitle.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: blackColor),
                                          desc:
                                          'Kamu tidak dapat melakukan pembatalan atau perubahan apapun pada pesanan setelah melakukan pembayaran.',
                                          icon: icAlert,
                                          onPressed: () {
                                            context.read<CartRewardBloc>().add(CartRewardEvent.postOrder(cartId: itemCart.id));
                                            context.goNamed('dashboard', pathParameters: {'pageIndex': '2'});
                                          });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Dimensions.paddingSizeDefault,
                                          horizontal: Dimensions.paddingSizeLarge),
                                      decoration: BoxDecoration(
                                        color: isCartItemEmpty ? grey : navyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            icMoney,
                                            width: 24,
                                            height: 24,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Select Payment',
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
                          return  _buildShimmerEffect(context);
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
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 3),
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
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeDefault,
                    horizontal: Dimensions.paddingSizeLarge),
                decoration: BoxDecoration(
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
                    SizedBox(width: 10),
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
      padding: EdgeInsets.all(20),
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
          child: Text(
            "Cancel",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
          onPressed: () => Navigator.pop(context),
          color: redMedium,
        ),
        DialogButton(
            child: Text(
              "Confirm",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            ),
            color: navyColor,
            onPressed: onPressed)
      ],
    ).show();
  }
}


void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

      );
    },
  );
}

