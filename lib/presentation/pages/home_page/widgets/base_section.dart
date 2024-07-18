import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/slider_promo.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../data/mockup_data.dart';
import 'list_view_product.dart';

// ignore: must_be_immutable
class BaseSection extends StatelessWidget {
  double screenWidth;
  BaseSection({
    super.key,
    required this.screenWidth,
  });
  List carouselImageStrings = carouselImage.map((i) => i['image']).toList();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: Dimensions.paddingSizeLarge,
              right: Dimensions.paddingSizeLarge,
              top: 44,
              bottom: Dimensions.paddingSizeLarger),
          color: primaryColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {

                  return state.when(
                      initial: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      loading: () => Center(
                            child: CircularProgressIndicator(),
                          ),
                      success: (model, user, index) {
                        if(user != null ){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Selamat Datang',
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: baseColor)),
                              Text(user.data!.name ?? 'No Name',
                                  style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: baseColor))
                              // D
                            ],
                          );

                        } else {
                          return Center(child: Text('No data user available'),);
                        }

                      },
                      error: (message) => Center(
                            child: Text(message!),
                          ));
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonCircleIcon(
                    routes: 'cart-page',
                    icon: icCart,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ButtonCircleIcon(
                    routes: 'notification-page',
                    icon: icNotification,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
            width: screenWidth,
            margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
            decoration: const BoxDecoration(
              color: baseColor,
            ),
            child: CarouselSliderWidget(
                screenWidth: screenWidth,
                carouselImageStrings: carouselImageStrings)),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeSmall,
              horizontal: Dimensions.paddingSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jajan Makin Hemat',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeExtraSmall,
              ),
              Text(
                'Dapatkan diskon dan harga spesial hanya dengan melakukan pemesanan di App Tedikap',
                style: txtPrimarySubTitle.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              Container(
                width: screenWidth,
                child: Image.asset(
                  imgBanner,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.paddingSizeLarge,
              top: Dimensions.paddingSizeSmall),
          child: Container(
            width: screenWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Menu Terlaris',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
            ),
          ),
        ),
        ListViewProduct(
          screenWidth: screenWidth,
        ),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeSmall,
              horizontal: Dimensions.paddingSizeLarge),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imgPromo1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.paddingSizeSmall,
                      bottom: Dimensions.paddingSizeLarge,
                      right: Dimensions.paddingSizeSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jajan Makin Hemat',
                        style: txtSecondaryHeader.copyWith(
                            fontWeight: FontWeight.w600, color: blackColor),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeExtraSmall,
                      ),
                      Text(
                        'Dapatkan diskon dan harga spesial hanya dengan melakukan pemesanan di App Tedikap',
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w400, color: blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonCircleIcon extends StatelessWidget {
  const ButtonCircleIcon({
    super.key,
    required this.routes,
    required this.icon,
  });

  final String routes;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(routes);
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeMedium),
        decoration:
            const BoxDecoration(color: transparent30, shape: BoxShape.circle),
        child: Center(
            child: SvgPicture.asset(
          icon,
        )),
      ),
    );
  }
}
