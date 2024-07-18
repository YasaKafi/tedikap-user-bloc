import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme.dart';

class DetailPoinPage extends StatelessWidget {
  const DetailPoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  context.pop();
                },
              ),
              Text(
                'TEDIKAPwards',
                style: txtSecondaryHeader.copyWith(fontWeight: FontWeight.w600, color: blackColor),
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
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengumpulan Tedikap Poin', style:  txtPrimaryTitle.copyWith(fontWeight: FontWeight.w600, color: primaryColor)),
                      SizedBox(height: 10),
                      Padding(padding: EdgeInsets.only(left: 10), child: Text('1. Dapatkan 1 Tedikap Poin untuk setiap transaksi sebesar Rp3.000 dan berlaku kelipatannya. Contoh: Transaksi sebesar Rp35.000 akan mendapatkan 3 Tedikap Poin; transaksi sebesar Rp51.000 akan mendapatkan 5 Tedikap Poin.', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor))),
                      SizedBox(height: 5),
                    ],
                  ),


                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengumpulan Tedikap Poin', style: txtPrimaryTitle.copyWith(fontWeight: FontWeight.w600, color: primaryColor)),
                      SizedBox(height: 10),
                      Padding(padding: EdgeInsets.only(left: 10), child: Text('1. Dapatkan 1 Tedikap Poin untuk setiap transaksi sebesar Rp3.000 dan berlaku kelipatannya. Contoh: Transaksi sebesar Rp35.000 akan mendapatkan 3 Tedikap Poin; transaksi sebesar Rp51.000 akan mendapatkan 5 Tedikap Poin.', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor))),
                      SizedBox(height: 5),],
                  ),


                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
