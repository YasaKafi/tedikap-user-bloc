import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/repository/global_variabel.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/register_page/bloc/register_bloc.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../../data/models/request/register_request_model.dart';
import '../../global_components/common_button.dart';
import '../../global_components/textfield_auth_custom.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
                vertical: Dimensions.paddingSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.marginSizeLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Create \nAccount', style: txtHeadingTitleAuth),
                    SvgPicture.asset(icLogoPrimary, height: 100, width: 100),
                  ],
                ),
                const SizedBox(height: Dimensions.marginSizeSuperExtraLarge),
                for (var field in fields) ...[
                  Text(field['label'],
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w600, color: blackColor)),
                  const SizedBox(height: Dimensions.marginSizeSmall),
                  CustomTextFieldAuth(
                    key: UniqueKey(),
                    title: field['hint'],
                    controller: field['controller'],
                  ),
                  const SizedBox(height: Dimensions.marginSizeLarge),
                ],
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: (){},
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message!, style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: baseColor),),
                          backgroundColor: redMedium,
                        ));
                      },
                      success: (model, modelFcm) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(model!.message!, style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: baseColor),),
                          backgroundColor: greenMedium,
                        ));
                        context.goNamed('login');
                      },

                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: (){
                        return CommonButton(
                          text: 'Register',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {

                            if (usernameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || confirmpasswordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w500, color: baseColor),), backgroundColor: redMedium,));

                            } else {
                              final requestModel = RegisterRequestModel(
                                  name: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterEvent.doRegister(requestModel, GlobalVariables.deviceToken));



                            }
                          },
                          borderRadius: 10,
                          height: 55,
                          fontSize: 18,
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );


                  },
                ),
                const SizedBox(height: Dimensions.marginSizeLarge),
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
                            context.goNamed('login');
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
