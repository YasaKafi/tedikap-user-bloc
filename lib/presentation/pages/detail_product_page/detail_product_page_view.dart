import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_bottom_price.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_info_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/box_option_product.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_product_page/widgets/input_notes.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key, this.productId, this.productRewardId});

  int? productId;
  int? productRewardId;

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
            color: baseColor50,
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
                'Detail Product',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                          icHeart,
                          width: 24,
                          height: 24,
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: baseColor50,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BoxInfoProduct(screenWidth: screenWidth, productId: productId, productRewardId: productRewardId,),

                        const SizedBox(height: 20),
                        BoxOptionProduct(),
                        // const SizedBox(height: 20),
                        // InputNotes(),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: BoxBottomPrice(
                  screenWidth: screenWidth, ),
            )
          ],
        ),
      ),
    );
  }
}
