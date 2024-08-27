import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/bloc/profile_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import 'box_helper.dart';

class BoxHelpSupport extends StatelessWidget {
  const BoxHelpSupport({
    super.key,
    required this.screenwWidth,
    this.waLink, required this.textStyleCallAdmin,
  });

  final double screenwWidth;
  final String? waLink;
  final TextStyle textStyleCallAdmin;

  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenwWidth,
          margin: const EdgeInsets.only(
              left: Dimensions.marginSizeLarge,
              right: Dimensions.marginSizeLarge,
              top: 100),
          padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeLarge,
              bottom: Dimensions.paddingSizeLarge,
              left: Dimensions.paddingSizeLarge,
              right: Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  context.pushNamed('help_center');
                },
                child: BoxHelper(
                  iconPath: icHelpCenter,
                  text: 'Pusat Bantuan',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  context.pushNamed('terms_and_conditions');
                },
                child: BoxHelper(
                  iconPath: icTermsOfService,
                  text: 'Ketentuan Layanan',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  context.pushNamed('privacy_policy');
                },
                child: BoxHelper(
                  iconPath: icPrivacyPolicy,
                  text: 'Kebijakan Privasi',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  context.pushNamed('setting');
                },
                child: BoxHelper(
                  iconPath: icSetting,
                  text: 'Pengaturan',
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Container(
              width: screenwWidth,
              margin: const EdgeInsets.only(
                  left: Dimensions.marginSizeLarge,
                  right: Dimensions.marginSizeLarge,
                  top: 20),
              padding: const EdgeInsets.only(
                  top: Dimensions.paddingSizeLarge,
                  bottom: Dimensions.paddingSizeLarge,
                  left: Dimensions.paddingSizeLarge,
                  right: Dimensions.paddingSizeLarge),
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  state.maybeWhen(
                      orElse: () {},
                      loaded: (user, logout) {
                        if (user?.data != null) {
                          final waLink = user?.data!.whatsappService;
                          launchURL(Uri.parse(waLink!));
                        }
                      });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Butuh Bantuan?',
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              icCustomerService,
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text('Tedikap Customer Service (chat only)',
                                style: textStyleCallAdmin.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: blackColor))
                          ],
                        ),
                        SvgPicture.asset(
                          icArrowRight, // Replace with your actual asset path
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
