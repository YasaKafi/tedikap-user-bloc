import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_reward_page/bloc/cart_reward_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../common/constant.dart';
import 'box_product_checkout.dart';

class BoxCheckoutDetail extends StatelessWidget {
  final double screenWidth;

  const BoxCheckoutDetail({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: Dimensions.paddingSizeDefault),
                    decoration: const BoxDecoration(
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
                  loading: (isPatchQTyLoading, cartModel) => buildShimmer(),
                  success: (cartModel, modelQty, deleteModel, modelPostOrder) {
                    if (cartModel?.cart == null) {
                      return buildShimmer();
                    } else if (cartModel!.cart!.cartItems!.isNotEmpty) {
                      final itemCart = cartModel.cart;
                      return Column(
                        children:
                            List.generate(itemCart!.cartItems!.length, (index) {
                          var productItemsCheckout = itemCart.cartItems![index];

                          return Column(
                            children: [
                              BoxProductCheckout(
                                item: productItemsCheckout,
                                screenWidth: screenWidth,
                              ),
                              const Divider(
                                height: 1,
                                color: grey,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  productItemsCheckout.stock == false
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: redLight,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text('Sold out',
                                              style:
                                                  txtSecondarySubTitle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: redMedium)))
                                      : Row(
                                          children: [
                                            SvgPicture.asset(
                                              icLogoPrimary,
                                              width: 24,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                '${productItemsCheckout.totalPoints}',
                                                style: txtPrimaryTitle.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: blackColor)),
                                          ],
                                        ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.goNamed(
                                              'detail_product_reward',
                                              extra: productItemsCheckout.id!
                                                  .toString(),
                                              pathParameters: {
                                                'productRewardId':
                                                    productItemsCheckout
                                                        .productId!
                                                        .toString()
                                              });
                                        },
                                        child: const Icon(
                                          Icons.mode_edit_outlined,
                                          size: 28,
                                          color: navyColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _onAlertButtonsPressed(context,
                                              title: 'Hapus Item',
                                              titleStyle:
                                                  txtPrimaryTitle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: blackColor),
                                              desc:
                                                  'Apakah anda yakin ingin menghapus item ini?',
                                              descStyle:
                                                  txtPrimarySubTitle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackColor),
                                              bgcolor: baseColor,
                                              onPressed: () {
                                            context.read<CartRewardBloc>().add(
                                                CartRewardEvent.deleteItem(
                                                    cartItem:
                                                        productItemsCheckout
                                                            .id));
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.delete_forever_outlined,
                                          size: 28,
                                          color: navyColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              productItemsCheckout.stock ==
                                                  true && productItemsCheckout.quantity! > 1 ?
                                              context
                                                  .read<CartRewardBloc>()
                                                  .add(CartRewardEvent.patchQty(
                                                      cartRewardItem:
                                                          productItemsCheckout
                                                              .id,
                                                      action: 'decrement')) : null;
                                            },
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: productItemsCheckout.stock ==
                                                  true && productItemsCheckout.quantity! > 1 ? navyColor : grey,
                                              size: 28,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              productItemsCheckout.quantity
                                                  .toString(),
                                              style: txtSecondaryTitle.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: productItemsCheckout.stock ==
                                                      true ? blackColor : grey)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              productItemsCheckout.stock ==
                                                  true && productItemsCheckout.quantity! < 99 ?
                                              context
                                                  .read<CartRewardBloc>()
                                                  .add(CartRewardEvent.patchQty(
                                                      cartRewardItem:
                                                          productItemsCheckout
                                                              .id,
                                                      action: 'increment')) : null;
                                            },
                                            child:  Icon(
                                              Icons.add_circle,
                                              color: productItemsCheckout.stock ==
                                                  true &&  productItemsCheckout.quantity! < 99 ? navyColor : grey,
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
                    } else {
                      return _buildEmptyCartState(context, screenWidth);
                    }
                  },
                  error: (message) => _buildErrorState(context, message!),
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

  _onAlertButtonsPressed(context,
      {String? title,
      TextStyle? titleStyle,
      TextStyle? descStyle,
      String? desc,
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

class DottedDivider extends StatelessWidget {
  final double width;
  final double thickness;
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DottedDivider({
    super.key,
    this.width = double.infinity,
    this.thickness = 1,
    this.color = Colors.black,
    this.dashWidth = 3,
    this.dashSpace = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
