import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';


class LanguageSettingPage extends StatelessWidget {
  const LanguageSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
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
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 10,
              left: 10, // Ubah sesuai kebutuhan Anda
              right: 10, // Ubah sesuai kebutuhan Anda
            ),
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
                  'Pengaturan Bahasa',
                  style: txtSecondaryHeader.copyWith(fontWeight: FontWeight.w600, color: blackColor)
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Selesai',
                    style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge), // Ubah sesuai kebutuhan Anda
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bahasa Indonesia',
                        style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      const Icon(Icons.check_outlined, size: 24),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bahasa Indonesia',
                        style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      const Icon(Icons.check_outlined, size: 24),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
