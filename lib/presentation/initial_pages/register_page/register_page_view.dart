import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/register_page/bloc/register_bloc.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../../data/models/request/register_request_model.dart';
import '../../global_components/common_button.dart';
import '../../global_components/textfield_auth_custom.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmpasswordController =
        TextEditingController();

    final List<Map<String, dynamic>> fields = [
      {
        'label': 'Username',
        'hint': 'Enter your username',
        'controller': usernameController
      },
      {
        'label': 'Email',
        'hint': 'Enter your email',
        'controller': emailController
      },
      {
        'label': 'Password',
        'hint': 'Enter your password',
        'controller': passwordController
      },
      {
        'label': 'Confirm Password',
        'hint': 'Enter your confirm password',
        'controller': confirmpasswordController
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.marginSizeLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Create \nAccount', style: txtHeadingTitleAuth),
                    SvgPicture.asset(icLogoPrimary, height: 100, width: 100),
                  ],
                ),
                SizedBox(height: Dimensions.marginSizeSuperExtraLarge),
                for (var field in fields) ...[
                  Text(field['label'],
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor)),
                  SizedBox(height: Dimensions.marginSizeSmall),
                  CustomTextFieldAuth(
                    key: UniqueKey(),
                    title: field['hint'],
                    controller: field['controller'],
                  ),
                  SizedBox(height: Dimensions.marginSizeLarge),
                ],
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,), backgroundColor: redMedium,));
                    }

                    if(state is RegisterLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.model.message!,), backgroundColor: greenMedium,));
                      context.goNamed('onboard');
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return CommonButton(
                      text: 'Register',
                      onPressed: () {
                        final requestModel = RegisterRequestModel(
                            name: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text);
                        context
                            .read<RegisterBloc>()
                            .add(DoRegisterEvent(requestModel));
                      },
                      borderRadius: 10,
                      height: 55,
                      fontSize: 18,
                    );
                  },
                ),
                SizedBox(height: Dimensions.marginSizeLarge),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Login",
                          style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            context.goNamed('onboard');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
