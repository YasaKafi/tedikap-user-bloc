import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';

class TermOfServicePage extends StatelessWidget {
  const TermOfServicePage({super.key});

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
              padding: const EdgeInsets.only(top: 50, bottom: 20),
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
                    'Pusat Bantuan',
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
                  Text('Ketentuan Layanan', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
                  const SizedBox(height: 20),
                  Text(
                    'Selamat datang di Aplikasi milik TEDIKAP Aplikasi), dimana para pengguna Aplikasi "Pengguna) dapat memesan produk-produk dibawah TEDIKAP dalam Pengguna membeli produk melalui Aplikasi ("Layanan"). TEDIKAP ingin memberikan Pengguna suatu Layanan terbaik melalui Aplikasi, dan berharap dengan menggunakan Aplikasi, Pengguna dapat merasakan cara sederhana untuk mendapatkan produk dan menikmati produk dengan nyaman..',
                    style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),
                  ),
                  const SizedBox(height: 30),
                  Text('Tentang Aplikasi', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
                  const SizedBox(height: 20),
                  Text(
                    'PT Tedikap Indonesia (TEDIKAP", atau "Kami") menyediakan Aplikasi dengan mengacu kepada Syarat dan Ketentuan yang ditetapkan di bawah ini. Sebelum menggunakan Layanan dalam Aplikasi, Pengguna disarankan membaca dengan saksama dan menyetujui Syarat Ketentuan ini dan Kebijakan Privasi karena dapat berdampak kepada hak dan kewajiban Pengguna berdasarkan hukum yang berlaku. Dengan menggunakan Aplikasi, Pengguna dianggap telah membaca, memahami, dan menyetujui untuk terikat oleh Syarat dan Ketentuan ini. Jika Pengguna tidak menyetujui Syarat dan Ketentuan ini, Pengguna tidak diperkenankan menggunakan Aplikasi.',
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
