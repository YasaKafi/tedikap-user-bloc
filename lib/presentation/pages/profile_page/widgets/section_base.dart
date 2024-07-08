import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/repository/tedikap_repository.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';

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
    context.read<ProfileBloc>().add(const ProfileEvent.getUser());
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
                            return const Center(child: Text('halo'));
                          },
                          loading: () {
                            return const Center(child: CircularProgressIndicator());
                          },

                          error: (message) {
                            return Center(child: Text(message));
                          },
                          loaded: (user, _) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pushNamed('edit_profile');
                                    },
                                    child: CircleAvatar(
                                      radius: 28,
                                      backgroundImage: NetworkImage(TedikapApiRepository.getAvatarProfile + user!.data!.avatar!),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text('Hi, ${user.data!.name!}',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor)),
                                ]);
                          },
                        );

                      },
                    ),
                  )),
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
                  ))
            ],
          ),
        ),
        BoxHelpSupport(screenwWidth: screenwWidth),
        const SizedBox(height: 20,)

      ],
    );
  }
}


