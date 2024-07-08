import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../widgets/accordion_help.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor50,
      body: SingleChildScrollView(
        child: Column(
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
                        if (Navigator.canPop(context)) {
                          context.pop();
                        } else {
                          print("Cannot pop");
                        }
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
            const Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge),
              child:  MyExpansionPanelItem(
                index: 0,
                title:
                    'Bagaimana saya bisa mendapatkn poin saat menggunakan aplikasi',
                content: 'Cari tau sendiri akowkowako',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge),
              child:  MyExpansionPanelItem(
                index: 1,
                title:
                    'Bagaimana saya bisa mendapatkn poin saat menggunakan aplikasi',
                content: 'Cari tau sendiri akowkowako',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge),
              child:  MyExpansionPanelItem(
                index: 2,
                title:
                    'Bagaimana saya bisa mendapatkn poin saat menggunakan aplikasi',
                content: 'Cari tau sendiri akowkowako',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge),
              child:  MyExpansionPanelItem(
                index: 3,
                title:
                    'Bagaimana saya bisa mendapatkn poin saat menggunakan aplikasi',
                content: 'Cari tau sendiri akowkowako',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge),
              child:  MyExpansionPanelItem(
                index: 4,
                title:
                    'Bagaimana saya bisa mendapatkn poin saat menggunakan aplikasi',
                content: 'Cari tau sendiri akowkowako',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
