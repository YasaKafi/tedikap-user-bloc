import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/shimmer_user_profile.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import 'box_help_support.dart';

class SectionBaseProfile extends StatelessWidget {
  const SectionBaseProfile({
    super.key,
    required this.screenwWidth,
  });

  final double screenwWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenwWidth,
          decoration: const BoxDecoration(
            color: primaryColor40,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: SvgPicture.asset(
                  icWaves,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    left: Dimensions.paddingSizeLarge,
                    bottom: Dimensions.paddingSizeOverLarge,
                  ),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () {
                          return const ShimmerProfile();
                        },
                        loading: () {
                          return const ShimmerProfile();
                        },
                        error: (message) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: grey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Hi, unknown user',
                                style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                              ),
                            ],
                          );
                        },
                        loaded: (user, _) {
                          if (user?.data != null) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.pushReplacementNamed('edit_profile');
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundImage: NetworkImage(
                                      TedikapApiRepository.getAvatarProfile +
                                          user!.data!.avatar!,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  user.data == null
                                      ? 'Hi, unknown user'
                                      : 'Hi, ${user.data!.name!}',
                                  style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    radius: 28,
                                    backgroundColor: grey,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Hi, unknown user',
                                  style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                    right: Dimensions.paddingSizeOverLarge,
                    bottom: Dimensions.paddingSizeThirty,
                  ),
                  child: SvgPicture.asset(
                    icFood,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ],
          ),
        ),
        BoxHelpSupport(
          screenwWidth: screenwWidth,
          waLink:
              'https://wa.me/62895395343223?text=Halo+Tedikap%2C+Saya+membutuhkan+bantuan',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
