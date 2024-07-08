import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/data/models/request/login_request_model.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/login_page/bloc/login_bloc.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../global_components/common_button.dart';
import '../../global_components/textfield_auth_custom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final List<Map<String, dynamic>> fields = [
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
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.marginSizeLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Welcome \nBack', style: txtHeadingTitleAuth),
                    SvgPicture.asset(
                      icLogoPrimary,
                      height: 100,
                      width: 100,
                    ),
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
                  const SizedBox(height: Dimensions.marginSizeSmall),
                ],
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Forgot Password ?',
                      style: txtSecondaryTitle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    )),
                const SizedBox(height: Dimensions.marginSizeSmall),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            message!,
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: redMedium,
                        ));
                      },
                      success: (model) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            model!.message!,
                            style: txtSecondaryTitle.copyWith(
                                fontWeight: FontWeight.w500, color: baseColor),
                          ),
                          backgroundColor: greenMedium,
                        ));
                        context.goNamed('dashboard');
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: (){
                          return CommonButton(
                            text: 'Login',
                            onPressed: () {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    'Please fill all fields',
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: baseColor),
                                  ),
                                  backgroundColor: redMedium,
                                ));
                              } else {
                                final requestModel = LoginRequestModel(
                                    email: emailController.text,
                                    password: passwordController.text);
                                context
                                    .read<LoginBloc>()
                                    .add(LoginEvent.doLogin(requestModel));
                              }
                            },
                            borderRadius: 10,
                            height: 55,
                            fontSize: 18,
                          );
                        },
                        loading: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                    );

                  },
                ),
                const SizedBox(height: Dimensions.marginSizeLarge),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: txtSecondaryTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Register",
                          style: txtSecondaryTitle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed('register');
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
