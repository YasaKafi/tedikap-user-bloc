import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/bloc/voucher_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/alert_box_voucher.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/input_voucher_code.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/shimmer_voucher.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';

class VoucherPage extends StatefulWidget {
  VoucherPage({super.key, this.isFromCart, required this.isFromNotification});

  bool? isFromCart;
  final bool isFromNotification;


  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  int? voucherLength;

  @override
  void initState() {
    super.initState();
    context.read<VoucherBloc>().add(const VoucherEvent.getVoucher());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor,
          ),
          padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (widget.isFromNotification) {
                    context.pushReplacementNamed('dashboard' , pathParameters:  {'pageIndex' : '3'});
                  } else if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    context.goNamed('cart_common');
                  }
                },
              ),
              Text(
                'My Voucher',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              Container(
                width: 40,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge),
          width: screenWidth,
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [AlertBox(screenWidth: screenWidth,)],
              ),
              const SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              InputVoucherCode(screenWidth: screenWidth),
              const SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              BlocBuilder<VoucherBloc, VoucherState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Available Vouchers (Memuat..)',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor)),
                      ),
                      success: (modelVoucher, modelCart, modelApplyRemove,
                          isUseVoucher, cartModel, currentVoucherId) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'Available Vouchers (${modelVoucher?.activeVouchers!.length ?? 0})',
                              style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w600, color: blackColor)),
                        );
                      });
                },
              ),
              const SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeSmall,
                ),
                child: BlocBuilder<VoucherBloc, VoucherState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Column(
                        children: List.generate(3, (index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: VoucherShimmer(screenWidth: screenWidth),
                        )),
                      ),
                      loading: () => Column(
                        children: List.generate(3, (index) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: VoucherShimmer(screenWidth: screenWidth),
                        )),
                      ),
                      success: (modelVoucher, modelCart, modelApplyRemove,
                          isUseVoucher, cartModel, currentVoucherId) {
                        if (modelVoucher!.activeVouchers!.isEmpty) {
                          return _buildEmptyVoucherState(context);
                        } else {
                          final itemVoucher = modelVoucher.activeVouchers;
                          return Column(
                            children: List.generate(itemVoucher!.length, (index) {
                              final item = itemVoucher[index];
                              final itemVoucherCart = modelCart?.cart?.voucherId;
                              String formattedDate = DateFormat('dd MMM yyyy').format(item.endDate!);
                              String formattedMaxDiscount = NumberFormat('#,##0').format(item.maxDiscount);
                              String formattedMinTransaction = NumberFormat('#,##0').format(item.minTransaction);
                              voucherLength = itemVoucher.length;
                              bool? isCurrentlyUsedVoucher = itemVoucherCart == item.id && widget.isFromCart! ? true : false;
                              bool isEligible = cartModel!.cart!.originalPrice! < item.minTransaction! || widget.isFromCart == false ? false : true;

                              return Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pushNamed('detail_voucher',
                                          pathParameters: {
                                            'voucherId': item.id!.toString()
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
                                                color: isCurrentlyUsedVoucher == true
                                                    ? primaryColor
                                                    : grey,
                                                width: 2),
                                          ),
                                          margin: const EdgeInsets.only(
                                              top: Dimensions.marginSizeLarge),
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
                                                      child: Image.asset(
                                                        originalTea,
                                                        height: 120,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: isCurrentlyUsedVoucher ,
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
                                                            style: txtSecondarySubTitle
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: baseColor)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: Dimensions.paddingSizeLarge),
                                                width: screenWidth,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: screenWidth * 0.63,
                                                      child: Row(
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              item.title!,
                                                              style: txtSecondaryTitle
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight.w600,
                                                                  color: blackColor),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 10),
                                                          const Icon(
                                                            Icons.info_outline_rounded,
                                                            size: 22,
                                                            color: blackColor,
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
                                                            borderRadius:
                                                            BorderRadius.circular(15),
                                                          ),
                                                          padding: const EdgeInsets.symmetric(
                                                              horizontal: 10, vertical: 5),
                                                          margin:
                                                          const EdgeInsets.only(left: 10),
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
                                                                style: txtSecondarySubTitle
                                                                    .copyWith(
                                                                    fontWeight:
                                                                    FontWeight.w600,
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
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'Diskon ${item.discount}% Maks. Rp$formattedMaxDiscount.',
                                                        style: txtSecondarySubTitle.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            color: blackColor)),
                                                    const SizedBox(height: 3),
                                                    Text(
                                                        'Dengan minimum transaksi Rp$formattedMinTransaction.',
                                                        style: txtSecondarySubTitle.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            color: blackColor)),
                                                    const SizedBox(height: 3),
                                                    Text('Tidak Berlaku untuk menu Promo.',
                                                        style: txtSecondarySubTitle.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            color: blackColor)),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                width: screenWidth,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text('Expire pada $formattedDate.',
                                                        style: txtSecondarySubTitle.copyWith(
                                                            fontWeight: FontWeight.w500,
                                                            color: blackColor)),
                                                    Visibility(
                                                      visible: isEligible,
                                                      child: InkWell(
                                                        onTap: () {
                                                          isCurrentlyUsedVoucher == true
                                                              ? context
                                                              .read<VoucherBloc>()
                                                              .add(VoucherEvent
                                                              .removeVoucher(
                                                              item.id))
                                                              : context
                                                              .read<VoucherBloc>()
                                                              .add(VoucherEvent
                                                              .applyVoucher(
                                                              item.id));
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: primaryColor,
                                                                borderRadius:
                                                                BorderRadius.circular(20)),
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10, vertical: 5),
                                                            child: Text(
                                                              isCurrentlyUsedVoucher == true
                                                                  ? 'Disuse'
                                                                  : 'Use',
                                                              style: txtPrimarySubTitle
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight.w600,
                                                                  color: baseColor),
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          );
                        }
                      },
                      error: (message) => _buildErrorState(context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildErrorState(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
              'Oops, something went wrong. Please try again later.',
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

  Widget _buildEmptyVoucherState(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icSearchEmpty, width: screenWidth * 0.5),
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.8,
            child: Column(
              children: [
                Text(
                  'No Vouchers Available',
                  style: txtPrimaryTitle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'You currently do not have any vouchers. Discover exciting offers and discounts to earn vouchers.',
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


