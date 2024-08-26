import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/box_promo.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/shimmer_widget_home.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/slider_promo.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import 'list_view_product.dart';

// ignore: must_be_immutable
class BaseSection extends StatefulWidget {
  final double screenWidth;

  const BaseSection({
    super.key,
    required this.screenWidth,
  });

  @override
  _BaseSectionState createState() => _BaseSectionState();
}

class _BaseSectionState extends State<BaseSection> {
  bool _isWelcomeMessage = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _isWelcomeMessage = !_isWelcomeMessage;
        });
      }
    });
  }

  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                      initial: () => ShimmerWidgetsHome.userHome(),
                      loading: () => ShimmerWidgetsHome.userHome(),
                      success:
                          (model, user, index, pointModel, statusOutletModel,
                          bannerModel, boxPromoModel) {
                        if (user?.data != null || statusOutletModel?.data != null) {
                          final schedulePickUp =
                              statusOutletModel?.data!.time ?? 'No Schedule';

                          final statusOutlet =
                              statusOutletModel?.data!.description;

                          print('INI VALUE DARI $statusOutlet');

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // AnimatedSwitcher for transition
                              AnimatedSwitcher(
                                duration: const Duration(seconds: 1),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Text(
                                  _isWelcomeMessage
                                      ? 'Selamat Datang'
                                      : statusOutlet ?? 'No Status',
                                  key: ValueKey<bool>(_isWelcomeMessage),
                                  style: txtPrimarySubTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: baseColor),
                                ),
                              ),
                              const SizedBox(height: 4),
                              AnimatedSwitcher(
                                duration: const Duration(seconds: 1),
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: Text(
                                  _isWelcomeMessage
                                      ? user!.data!.name ?? 'No Name'
                                      : schedulePickUp,
                                  key: ValueKey<bool>(_isWelcomeMessage),
                                  style: txtPrimaryTitle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: baseColor),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: Text('No data user available'),
                          );
                        }
                      },
                      error: (message) => ShimmerWidgetsHome.userHome()
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonCircleIcon(
                    onTap: () {
                      context.goNamed('cart_common');
                    },
                    icon: icCart,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  ButtonCircleIcon(
                    onTap: () {
                      context.pushNamed('notification');
                    },
                    icon: icNotification,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
            width: widget.screenWidth,
            margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
            decoration: const BoxDecoration(
              color: baseColor,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () {
                      return Visibility(visible: false, child: Container());
                    },
                    success: (model, user, index, pointModel, statusOutletModel,
                        bannerModel, boxPromoModel) {
                      if (bannerModel!.data!.isEmpty) {
                        return Container();
                      }
                      return CarouselSliderWidget(
                        screenWidth: widget.screenWidth,
                      );
                    }
                );
              },
            )),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
                initial: () {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                },
                loading: () {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                },
                success: (model, user, index, pointModel, statusOutletModel,
                    bannerModel, boxPromoModel) {
                  if (boxPromoModel?.data!['1'] != null) {
                    final promoData = boxPromoModel!.data!['1']!;
                    return BoxPromoWidget(
                        screenWidth: widget.screenWidth,
                        title: promoData.title ?? 'No Title',
                        subtitle: promoData.subtitle ?? 'No Description',
                        imageUrl: promoData.image ?? 'No Image'
                    );
                  } else {
                    return Container();
                  }
                },
                error: (message) {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                }
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.paddingSizeLarge,
              top: Dimensions.paddingSizeSmall),
          child: SizedBox(
            width: widget.screenWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Most Favorite Menu',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
            ),
          ),
        ),
        ListViewProduct(
          screenWidth: widget.screenWidth,
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
                initial: () {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                },
                loading: () {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                },
                success: (model, user, index, pointModel, statusOutletModel,
                    bannerModel, boxPromoModel) {
                  if (boxPromoModel?.data!['2'] != null) {
                    final promoData = boxPromoModel!.data!['2']!;
                    return BoxPromoWidget(
                        screenWidth: widget.screenWidth,
                        title: promoData.title ?? 'No Title',
                        subtitle: promoData.subtitle ?? 'No Description',
                        imageUrl: promoData.image ?? 'No Image'
                    );
                  } else {
                    return Container();
                  }
                },
                error: (message) {
                  return ShimmerWidgetsHome.boxPromo(widget.screenWidth);
                }
            );
          },
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                state.maybeWhen(
                    orElse: (){},
                  success: (model, user, index, pointModel, statusOutletModel,
                      bannerModel, boxPromoModel){
                      if (user?.data != null){
                        launchURL(Uri.parse(user!.data!.whatsappService!));
                      }
                  }

                );
              },
              child: Container(
                width: widget.screenWidth,
                padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeSmall,
                    horizontal: Dimensions.paddingSizeLarge),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    bannerCallCenter,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

}

class ButtonCircleIcon extends StatelessWidget {
  const ButtonCircleIcon({
    super.key,
    this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
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

