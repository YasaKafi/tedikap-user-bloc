import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/bloc/onboard_bloc.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/onboard_page/widgets/item_pageview.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../global_components/common_button.dart';
import 'model/onboard_data.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocConsumer<OnboardBloc, OnboardState>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              context
                                  .read<OnboardBloc>()
                                  .add(const OnboardEvent.skipOnboard());
                            },
                            child: Text(
                              'Skip',
                              style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor),
                            ));
                      },
                      listener: (context, state) {
                        state.maybeWhen(orElse: (){}, finished: (){
                          context.goNamed('register');
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text('Tedikap',
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w600,
                                color: blackColor)),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          icLogoPrimary,
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<OnboardBloc, OnboardState>(
                builder: (context, state) {
                  return Expanded(
                    child: PageView.builder(
                      onPageChanged: (index) {
                        context
                            .read<OnboardBloc>()
                            .add(OnboardEvent.pageChanged(index: index));
                      },
                      itemCount: onboard_data.length,
                      controller:
                          context.read<OnboardBloc>().pageController,
                      itemBuilder: (context, index) => ItemOnBoarding(
                        imgBoarding: onboard_data[index].image,
                        titleBoarding: onboard_data[index].text,
                        subtitleBoarding: onboard_data[index].description,
                        screenWidth: screenWidth,
                      ),
                    ),
                  );
                },
              ),
              SmoothPageIndicator(
                controller: context.read<OnboardBloc>().pageController,
                count: 3,
                effect: ScrollingDotsEffect(
                    activeStrokeWidth: 2.6,
                    activeDotScale: 1.8,
                    maxVisibleDots: 5,
                    radius: 8,
                    spacing: 10,
                    dotHeight: 22,
                    dotWidth: 8,
                    activeDotColor: primaryColor,
                    dotColor: primaryColor.withOpacity(0.3)),
              ),
              const SizedBox(height: 20),
              BlocConsumer<OnboardBloc, OnboardState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: (){
                          String buttonText = 'Continue';
                          if(const OnboardState.initial(pageIndex: 2) == state){
                            buttonText = 'Get Started';
                          }
                          return CommonButton(
                            text: buttonText,
                            onPressed: () => context.read<OnboardBloc>().add(const OnboardEvent.onPressedButton()),
                            borderRadius: 10,
                            height: 50,
                          );
                        }

                    );

                    // if (state is OnboardInitial && state.pageIndex == 2) {
                    //   buttonText = 'Get Started';
                    // }

                  },
                  listener: (context, state) {
                    state.maybeWhen(orElse: (){}, finished: (){
                      context.goNamed('register');
                    });
                  },),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
