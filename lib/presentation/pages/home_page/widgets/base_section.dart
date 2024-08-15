import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/slider_promo.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../data/mockup_data.dart';
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List carouselImageStrings = carouselImage.map((i) => i['image']).toList();

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
                      loading: () => ShimmerUserHome(),
                      success:
                          (model, user, index, pointModel, statusOutletModel, bannerModel, boxPromoModel) {
                        if (user != null) {
                          final schedulePickUp =
                              statusOutletModel?.data?.time ?? 'No Schedule';

                          final statusOutlet =
                              statusOutletModel?.data?.description ?? 'Closed';

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
                                      : statusOutlet,
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
                                      ? user.data!.name ?? 'No Name'
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
                      error: (message) =>
                      const ShimmerUserHome());
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
                return CarouselSliderWidget(
                  screenWidth: widget.screenWidth,
                );
              },
            )),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
                initial: (){
                  return _buildShimmerLoading(widget.screenWidth);
                },
                loading: (){
                  return _buildShimmerLoading(widget.screenWidth);
                },
                success: (model, user, index, pointModel, statusOutletModel,
                    bannerModel, boxPromoModel){
                  if (boxPromoModel != null){
                    return Container(
                      width: widget.screenWidth,
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall,
                          horizontal: Dimensions.paddingSizeLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            boxPromoModel.data?.the1?.title ?? 'No Title',
                            style: txtSecondaryHeader.copyWith(
                                fontWeight: FontWeight.w600, color: blackColor),
                          ),
                          const SizedBox(
                            height: Dimensions.paddingSizeExtraSmall,
                          ),
                          Text(
                            boxPromoModel.data?.the1?.subtitle ?? 'No Description',
                            style: txtPrimarySubTitle.copyWith(
                                fontWeight: FontWeight.w400, color: blackColor),
                          ),
                          const SizedBox(
                            height: Dimensions.paddingSizeDefault,
                          ),
                          Container(
                            width: widget.screenWidth,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                TedikapApiRepository.getImageBoxPromo + boxPromoModel.data!.the1!.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                  } else {
                    return Container();
                  }

                },
                error: (message){
                  return _buildShimmerLoading(widget.screenWidth);

                }
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.paddingSizeLarge,
              top: Dimensions.paddingSizeSmall),
          child: Container(
            width: widget.screenWidth,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Menu Terfavorit',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
            ),
          ),
        ),
        ListViewProduct(
          screenWidth: widget.screenWidth,
        ),
        Container(
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
      ],
    );
  }
  Widget _buildShimmerLoading(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeSmall,
          horizontal: Dimensions.paddingSizeLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: screenWidth * 0.3,
              height: 20.0,
              decoration:  BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeExtraSmall,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: screenWidth * 0.5,
              height: 15.0,
              decoration:  BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: screenWidth,
                height: 200.0,
                decoration:  BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
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

class ShimmerUserHome extends StatelessWidget {
  const ShimmerUserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 16,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 6),
          Container(
            width: 100,
            height: 16,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
