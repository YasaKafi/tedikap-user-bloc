import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/box_info_profile.dart';
import 'package:tedikap_user_bloc/presentation/pages/profile_page/widgets/section_base.dart';

import '../../../common/theme.dart';
import '../../global_components/alert_dialog.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileBloc>().add(const ProfileEvent.getUser());
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        print('onPopInvoked didPop? $didPop');
        if (didPop == false) {
          final shouldPop = await onShowAlertDialog(
            context,
            title: 'Are you sure?',
            desc: 'Do you want to exit the app?',
            textBtn1: 'Cancel',
            textBtn2: 'Exit',
            bgColorBtn1: navyColor,
            bgColorBtn2: redMedium,
            titleStyle: txtPrimaryTitle.copyWith(
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
            descStyle: txtSecondarySubTitle.copyWith(
              fontWeight: FontWeight.w400,
              color: blackColor,
            ),
            icon: null,
            onPressed: () => SystemNavigator.pop(),
            bgColor: baseColor,
          );
          return shouldPop; // Return the result of the dialog
        }
      },
      child: Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SectionBaseProfile(
                screenwWidth: screenWidth,
              ),
              const InfoBoxProfile(),
            ],
          ),
        ),
      ),
    );
  }
}


