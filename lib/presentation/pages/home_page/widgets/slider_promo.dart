import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/data/models/response/banner_response_model.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';

import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';

import 'package:shimmer/shimmer.dart';

class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.paddingSizeLarger),
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
            ),
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => _buildShimmerCarousel(),
                      loading: () => _buildShimmerCarousel(),
                      success: (model, user, index, pointModel, statusOutletModel, bannerModel, boxPromoModel) {
                        int currentIndex = index ?? 0;
                        if (bannerModel?.data != null){
                          return Column(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                                  viewportFraction: 1.0,
                                  aspectRatio: 23 / 9,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    context.read<HomeBloc>().add(HomeEvent.changeIndex(index: index));
                                  },
                                ),
                                items: bannerModel!.data!.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Image.network(
                                          TedikapApiRepository.getImageBanner + i.image!,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: bannerModel.data!.map((imageString) {
                                    int index = bannerModel.data!.indexOf(imageString);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(vertical: Dimensions.fontSizeExtraSmall, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == index ? primaryColor : greyWarning,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }

                      },
                      error: (message) {
                        return _buildShimmerCarousel();
                      }
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerCarousel() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: screenWidth,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: baseColor
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: Dimensions.fontSizeExtraSmall, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

