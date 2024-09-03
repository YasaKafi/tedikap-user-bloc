import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';
import '../../../../../common/theme.dart';
import '../../../../common/dimensions.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});


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
                Text('Pengaturan',
                    style: txtSecondaryHeader.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor)),
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge), // Ubah sesuai kebutuhan Anda
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed('edit_profile');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profil Saya',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 24,
                            color: grey,
                          )),
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
                        'Informasi',
                        style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor),
                      ),
                      Text(
                        'Version 1.1',
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w400, color: blackColor),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                BlocConsumer<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            message,
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: redMedium,
                        ));
                      },
                      loaded: (_, logModel) {
                        if (logModel != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              logModel.message!,
                              style: txtSecondaryTitle.copyWith(
                                  fontWeight: FontWeight.w500, color: baseColor),
                            ),
                            backgroundColor: greenMedium,
                          ));
                          context.goNamed('login');
                        }

                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return InkWell(
                          onTap: () {
                            context.read<HomeBloc>().add(const HomeEvent.reset());
                            context.read<ProfileBloc>().add(const ProfileEvent.doLogout());
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout_rounded,
                                size: 24,
                                color: redMedium,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Keluar',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: redMedium),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: () {
                        return _buildShimmer();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 24,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
