import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/box_info_profile.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/section_base.dart';

import '../../../common/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Stack(
              children: [
            SectionBaseProfile(
              screenwWidth: screenwWidth,
            ),
            const InfoBoxProfile(),

          ]),
        ));
  }
}
