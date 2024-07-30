import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../common/constant.dart';
import 'box_product_checkout.dart';


class BoxCheckoutDetail extends StatelessWidget {
  final double screenWidth;

  BoxCheckoutDetail({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge,
            vertical: Dimensions.paddingSizeLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Detail Pesanan',
                  style: txtPrimaryTitle.copyWith(
                      fontWeight: FontWeight.w600, color: blackColor),
                ),
                InkWell(
                  onTap: () {
                    context.goNamed('point');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: Dimensions.paddingSizeDefault),
                    decoration: BoxDecoration(
                      color: navyColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      'Tambah',
                      style: txtPrimarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: baseColor),
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<CartRewardBloc, CartRewardState>(
              builder: (context, state) {
                return state.when(
                  initial: () => buildShimmer(),
                  loading: () => buildShimmer(),
                  success: (cartModel,  modelQty, deleteModel, modelPostOrder) {
                    if (cartModel == null || cartModel.cart == null) {
                      return buildShimmer();
                    } else if (cartModel.cart!.cartItems!.isEmpty) {
                      return _buildEmptyCartState(context, screenWidth);
                    } else {
                      final itemCart = cartModel.cart;
                      return Column(
                        children: List.generate(itemCart!.cartItems!.length, (index) {
                          var productItemsCheckout = itemCart.cartItems![index];

                          return Column(
                            children: [
                              BoxProductCheckout(
                                item: productItemsCheckout,
                                screenWidth: screenWidth,
                              ),
                              Divider(
                                height: 1,
                                color: grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Rp ${productItemsCheckout.totalPoints}',
                                      style: txtPrimaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.goNamed('detail_product_reward', extra: productItemsCheckout.id!.toString(),  pathParameters: {'productRewardId': productItemsCheckout.productId!.toString()});
                                        },
                                        child: Icon(
                                          Icons.mode_edit_outlined,
                                          size: 28,
                                          color: navyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<CartRewardBloc>().add(CartRewardEvent.deleteItem(cartItem: productItemsCheckout.id));
                                          Future.delayed(Duration(milliseconds: 500), ()=>context.read<CartRewardBloc>().add(CartRewardEvent.getCart())
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete_forever_outlined,
                                          size: 28,
                                          color: navyColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.read<CartRewardBloc>().add(CartRewardEvent.patchQty(cartRewardItem: productItemsCheckout.id, action: 'decrement'));
                                              Future.delayed(Duration(milliseconds: 500), ()=>context.read<CartRewardBloc>().add(CartRewardEvent.getCart())
                                              );
                                            },
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: navyColor,
                                              size: 28,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(productItemsCheckout.quantity.toString(),
                                              style: txtSecondaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: blackColor)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.read<CartRewardBloc>().add(CartRewardEvent.patchQty(cartRewardItem: productItemsCheckout.id, action: 'increment'));
                                              Future.delayed(Duration(milliseconds: 500), ()=>context.read<CartRewardBloc>().add(CartRewardEvent.getCart())
                                              );
                                            },
                                            child: Icon(
                                              Icons.add_circle,
                                              color: navyColor,
                                              size: 28,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      );
                    }
                  },
                  error: (message) => Center(child: Text(message!)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          ...List.generate(3, (index) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * 0.5,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: screenWidth * 0.3,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: screenWidth * 0.8,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icServerError, width: screenWidth * 0.5),
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.7,
            child: Text(
              message,
              style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCartState(BuildContext context, double screenWidth) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SvgPicture.asset(icCartEmpty, width: screenWidth * 0.3),
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.8,
            child: Column(
              children: [
                Text(
                  'Nothing in your cart yet.',
                  style: txtSecondaryTitle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'There is nothing in your cart. Add items to continue.',
                  style: txtSecondarySubTitle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class DottedDivider extends StatelessWidget {
  final double width;
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DottedDivider({
    Key? key,
    this.width = double.infinity,
    this.thickness = 1,
    this.color = Colors.black,
    this.dashWidth = 3,
    this.dashSpace = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          thickness: thickness,
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  _DottedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = thickness;

    double startX = 0;
    final space = (dashWidth + dashSpace);

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
