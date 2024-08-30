import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_user_bloc/data/models/response/voucher_active_response_model.dart';

import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';
import '../bloc/voucher_bloc.dart';


class VoucherCard extends StatelessWidget {
  final ActiveVoucher item;
  final bool isCurrentlyUsedVoucher;
  final bool isEligible;
  final double screenWidth;
  final bool isFromCart;

  const VoucherCard({super.key,
    required this.item,
    required this.isCurrentlyUsedVoucher,
    required this.isEligible,
    required this.screenWidth,
    required this.isFromCart,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM yyyy').format(item.endDate!);
    final formattedMinTransaction = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(int.parse(item.minTransaction.toString()));

    final formattedMaxDiscount = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(int.parse(item.maxDiscount.toString()));

    return Stack(
      children: [
        InkWell(
          onTap: () {
            isFromCart == true ? null :
            context.pushNamed('detail_voucher', pathParameters: {
              'voucherId': item.id!.toString(),
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: baseColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: isCurrentlyUsedVoucher ? primaryColor : grey,
                      width: 2),
                ),
                margin: const EdgeInsets.only(top: Dimensions.marginSizeLarge),
                width: screenWidth,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: screenWidth,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(18),
                            ),
                            child: Image.network(
                              TedikapApiRepository.getImagePromo + item.image!,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isCurrentlyUsedVoucher,
                          child: Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                              ),
                              child: Text('Terpasang',
                                  style: txtSecondarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: baseColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeLarge),
                      width: screenWidth,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    item.title!,
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: blackColor),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Visibility(
                                  visible: isFromCart ? false : true,
                                  child: const Icon(
                                    Icons.info_outline_rounded,
                                    size: 22,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                margin: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      icVoucherWhite,
                                      width: 18,
                                      height: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '1x',
                                      style: txtSecondarySubTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: baseColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diskon ${item.discount}% Maks. $formattedMaxDiscount.',
                            style: txtSecondarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Dengan minimum transaksi $formattedMinTransaction.',
                            style: txtSecondarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                          ),
                          const SizedBox(height: 3),
                          Text('Tidak Berlaku untuk menu Promo.',
                              style: txtSecondarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: blackColor)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expire pada $formattedDate.',
                            style: txtSecondarySubTitle.copyWith(
                                fontWeight: FontWeight.w500, color: blackColor),
                          ),
                          Visibility(
                            visible: isEligible,
                            child: InkWell(
                              onTap: () {
                                isCurrentlyUsedVoucher
                                    ? context.read<VoucherBloc>().add(
                                    VoucherEvent.removeVoucher(item.id))
                                    : context.read<VoucherBloc>().add(
                                    VoucherEvent.applyVoucher(item.id));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  isCurrentlyUsedVoucher ? 'Disuse' : 'Use',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: baseColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
