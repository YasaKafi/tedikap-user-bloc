import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_voucher_page/bloc/detail_voucher_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_voucher_page/widgets/box_information_voucher.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_voucher_page/widgets/loading_shimmer.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../voucher_page/widgets/alert_box_voucher.dart';

class DetailVoucherPage extends StatelessWidget {
  DetailVoucherPage({Key? key, this.voucherId}) : super(key: key);

  final int? voucherId;

  @override
  Widget build(BuildContext context) {
    if (voucherId != null) {
      context.read<DetailVoucherBloc>().add(DetailVoucherEvent.getDetailVoucher(voucherId!));
    }
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
                  if (Navigator.canPop(context)) {
                    context.pop();
                  } else {
                    context.goNamed('voucher');
                  }
                },
              ),
              Text(
                'Detail Voucher',
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
        child: BlocBuilder<DetailVoucherBloc, DetailVoucherState>(
          builder: (context, state) {
            return state.when(
              initial: () => DetailVoucherShimmer(screenWidth: screenWidth),
              loading: () => DetailVoucherShimmer(screenWidth: screenWidth),
              success: (model) {
                if (model != null) {
                  final voucher = model.data!;
                  String formattedDate = DateFormat('dd MMM yyyy').format(voucher.endDate!);
                  // String formattedMaxDiscount = NumberFormat('#,##0').format(voucher.maxDiscount);
                  // String formattedMinTransaction = NumberFormat('#,##0').format(voucher.minTransaction);
        
                  final formattedMinTransaction = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0, // Tidak ada digit desimal
                  ).format(int.parse(voucher.minTransaction.toString()));
        
                  final formattedMaxDiscount = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp',
                    decimalDigits: 0, // Tidak ada digit desimal
                  ).format(int.parse(voucher.maxDiscount.toString()));
        
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeLarge,
                        vertical: Dimensions.paddingSizeLarge),
                    width: screenWidth,
                    height: screenHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                      children: [
                        Column(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [AlertBox(screenWidth: screenWidth,)],
                            ),
                            SizedBox(
                              height: Dimensions.marginSizeLarge,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: baseColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: screenWidth,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: screenWidth,
                                        child: ClipRRect(
                                            child: Image.network(
                                              TedikapApiRepository.getImagePromo + voucher.image!,
                                              height: 150,
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.circular(20)),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: screenWidth,
                                        child: Text(
                                          'Diskon ${voucher.discount}%',
                                          style: txtSecondaryTitle.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: blackColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Diskon ${voucher.discount}% Maks. $formattedMaxDiscount.',
                                                style: txtSecondarySubTitle.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: blackColor)),
                                            const SizedBox(height: 3),
                                            Text(
                                                'Dengan minimum transaksi $formattedMinTransaction.',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    color: blackColor)),
                                            const SizedBox(height: 3),
                                            Text(
                                                'Tidak Berlaku untuk menu Promo.',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    color: blackColor)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30, bottom: 10),
                                        width: screenWidth,
                                        child: Text('Expire pada ${formattedDate}',
                                            style: txtSecondarySubTitle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: blackColor)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ListBoxInformationVoucher(
                                screenWidth: screenWidth,
                                icon: icList,
                                title: 'Syarat & Ketentuan',
                                subtitle: 'Klik untuk melihat syarat & ketentuan'),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ListBoxInformationVoucher(
                                screenWidth: screenWidth,
                                icon: icLamp,
                                title: 'Cara Pakai Voucher',
                                subtitle: 'Klik untuk melihat cara pemakaian voucher'),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: grey,
                            ),
        
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                        CommonButton(width: screenWidth ,text: 'Pesan Sekarang', onPressed: (){
                          context.goNamed('dashboard', pathParameters: {'pageIndex': '1'});
                        }, padding: EdgeInsets.symmetric(vertical: 15),)
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('data detail not available'));
                }
              },
              error: (message) => Center(child: Text(message!)),
            );
          },
        ),
      ),
    );
  }
}
