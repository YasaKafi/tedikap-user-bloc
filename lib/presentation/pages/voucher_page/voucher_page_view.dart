import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/global_components/error_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/bloc/voucher_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/alert_box_voucher.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/shimmer_voucher.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/voucher_card.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key, this.isFromCart, required this.isFromNotification});

  final bool? isFromCart;
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
              // InputVoucherCode(screenWidth: screenWidth),
              // const SizedBox(
              //   height: Dimensions.marginSizeLarge,
              // ),
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
                          isUseVoucher,) {
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
                          isUseVoucher, ) {
                        if (modelVoucher!.activeVouchers!.isEmpty) {
                          return Container(
                            width: screenWidth,
                              height: screenHeight * 0.7,
                              child: _buildEmptyVoucherState(context)
                          );
                        } else {
                          final itemVoucher = modelVoucher.activeVouchers;
                          return Column(
                            children: List.generate(itemVoucher!.length, (index) {
                              final item = itemVoucher[index];
                              voucherLength = itemVoucher.length;
                              bool? isCurrentlyUsedVoucher = item.isUsed! && widget.isFromCart! ? true : false;
                              bool isEligible = item.isEligible == false || widget.isFromCart == false ? false : true;

                              return VoucherCard(item: item, isCurrentlyUsedVoucher: isCurrentlyUsedVoucher, isEligible: isEligible, screenWidth: screenWidth, isFromCart: widget.isFromCart!);
                            }),
                          );
                        }
                      },
                      error: (message) => Container( padding: const EdgeInsets.only(top: 80),child: ErrorWidgetStatic.buildErrorState(context, message!)),
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


