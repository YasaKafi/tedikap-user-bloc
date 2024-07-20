import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import 'box_product_checkout.dart';


class BoxCheckoutDetail extends StatelessWidget {
  final double screenWidth;

  BoxCheckoutDetail({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartEvent.getCart());

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
                  onTap: () {},
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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Center(child: CircularProgressIndicator()),
                  loading: () => Center(child: CircularProgressIndicator()),
                  success: (cartModel, productDetails, modelQty) {
                    if (cartModel?.cart != null && productDetails != null) {
                      final itemCart = cartModel!.cart;
                      return Column(
                        children: List.generate(itemCart!.cartItems!.length, (index) {
                          var productItemsCheckout = itemCart.cartItems![index];
                          var productDetail = productDetails[index];

                          return Column(
                            children: [
                              BoxProductCheckout(
                                item: productItemsCheckout,
                                screenWidth: screenWidth,
                                productDetail: productDetail,
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
                                  Text('Rp ${productItemsCheckout.totalPrice}',
                                      style: txtPrimaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Get.offNamed(Routes.DETAIL_PRODUCT_PAGE,
                                          //     arguments: {'source': 'cart', 'id': productItemsCheckout.id}
                                          // );
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
                                          // controller.deleteProductById(productItemsCheckout.id!);
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
                                              context.read<CartBloc>().add(CartEvent.patchQty(cartItem: productItemsCheckout.id, action: 'decrement'));
                                              Future.delayed(Duration(milliseconds: 500), ()=>context.read<CartBloc>().add(CartEvent.getCart())
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
                                              context.read<CartBloc>().add(CartEvent.patchQty(cartItem: productItemsCheckout.id, action: 'increment'));
                                              Future.delayed(Duration(milliseconds: 500), ()=>context.read<CartBloc>().add(CartEvent.getCart())
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
                    } else {
                      return Center(child: CircularProgressIndicator());
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
}


