import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/bloc/voucher_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/alert_box_voucher.dart';
import 'package:tedikap_user_bloc/presentation/pages/voucher_page/widgets/input_voucher_code.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';

class VoucherPage extends StatelessWidget {
  VoucherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<VoucherBloc>().add(VoucherEvent.getVoucher());
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
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
              vertical: Dimensions.paddingSizeLarge),
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [AlertBox(screenWidth: screenWidth)],
              ),
              SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              InputVoucherCode(screenWidth: screenWidth),
              SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Available Vouchers (2)',
                    style: txtSecondaryTitle.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor)),
              ),
              SizedBox(
                height: Dimensions.marginSizeLarge,
              ),
              Container(
                constraints:
                    const BoxConstraints(minHeight: 200, maxHeight: 610),
                width: screenWidth,
                padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSizeSmall,
                ),
                child: BlocBuilder<VoucherBloc, VoucherState>(
                  builder: (context, state) {
                    return state.when(
                        initial: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                        loading: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                        success: (modelVoucher, modelCart, modelApplyRemove, isUseVoucher){
                          if(modelVoucher?.activeVouchers != null){
                            final itemVoucher = modelVoucher?.activeVouchers;
                            return ListView.builder(
                              itemCount: itemVoucher!.length,
                              itemBuilder: (context, index) {
                                final item = itemVoucher[index];
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed('detail_voucher', pathParameters: {'voucherId': item.id!.toString()});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: baseColor,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: isUseVoucher == true? primaryColor : grey, width: 2),
                                        ),
                                        margin: EdgeInsets.only(
                                            top: Dimensions.marginSizeLarge),
                                        width: screenWidth,
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: screenWidth,
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                      originalTea,
                                                      height: 120,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(18),
                                                      topLeft: Radius.circular(18),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: isUseVoucher,
                                                  child: Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 15, vertical: 5),
                                                      decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius: BorderRadius.only(
                                                          bottomLeft:
                                                          Radius.circular(18),
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
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                  Dimensions.paddingSizeLarge),
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
                                                            style: txtPrimarySubTitle
                                                                .copyWith(
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                color: blackColor),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Icon(
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
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                              icVoucherWhite,
                                                              width: 18,
                                                              height: 18,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              '1x',
                                                              style: txtSecondarySubTitle
                                                                  .copyWith(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.only(left: 20),
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text('Diskon ${item.discount}% Maks. ${item.minTransaction}.',
                                                      style:
                                                      txtSecondarySubTitle.copyWith(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: blackColor)),
                                                  SizedBox(height: 3),
                                                  Text(
                                                      'Tidak Berlaku untuk menu Promo.',
                                                      style:
                                                      txtSecondarySubTitle.copyWith(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: blackColor)),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 10, bottom: 10),
                                              padding:
                                              EdgeInsets.symmetric(horizontal: 20),
                                              width: screenWidth,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Expire pada ${item.endDate}.',
                                                      style:
                                                      txtSecondarySubTitle.copyWith(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: blackColor)),
                                                  InkWell(
                                                    onTap: () {
                                                      isUseVoucher == true ?
                                                      context.read<VoucherBloc>().add(VoucherEvent.removeVoucher(item.id))
                                                          :
                                                      context.read<VoucherBloc>().add(VoucherEvent.applyVoucher(item.id));

                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: primaryColor,
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                20)),
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        child: Text(
                                                          isUseVoucher == true ? 'Disuse' :
                                                          'Use',
                                                          style: txtPrimarySubTitle
                                                              .copyWith(
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: baseColor),
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );

                          } else {
                            return Center(child: CircularProgressIndicator(),);
                          }
                        },
                      error: (message) => Center(
                        child: Text(message!),
                      ),
                    );

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
