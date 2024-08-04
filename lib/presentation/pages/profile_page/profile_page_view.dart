import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/box_info_profile.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/section_base.dart';

import '../../../common/theme.dart';
import 'bloc/profile_bloc.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
      context.read<ProfileBloc>().add(const ProfileEvent.getUser());
  }

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
          ],
        ),
      ),
    );
  }
}


