import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: baseColor50,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: baseColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
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
                    'Kebijakan Privasi',
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
            const SizedBox(
              height: 30,
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kebijakan Privasi', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
                  const SizedBox(height: 20),
                  Text(
                    'Selamat datang di Aplikasi milik TEDIKAP Aplikasi), dimana para pengguna Aplikasi "Pengguna) dapat memesan produk-produk dibawah TEDIKAP dalam Pengguna membeli produk melalui Aplikasi ("Layanan"). TEDIKAP ingin memberikan Pengguna suatu Layanan terbaik melalui Aplikasi, dan berharap dengan menggunakan Aplikasi, Pengguna dapat merasakan cara sederhana untuk mendapatkan produk dan menikmati produk dengan nyaman..',
                    style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
