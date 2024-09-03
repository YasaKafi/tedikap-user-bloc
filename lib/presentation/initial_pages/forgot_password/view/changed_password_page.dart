import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tedikap_user_bloc/common/dimensions.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/data/models/request/reset_password_request_model.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/global_components/textfield_auth_custom.dart';

import '../bloc/forgot_password_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({super.key, this.email, this.otp, this.resetToken});
  String? email;
  String? otp;
  String? resetToken;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    print('ISI VALUE DARI EMAIL ${widget.email}');
    print('ISI VALUE DARI OTP ${widget.otp}');
    print('ISI VALUE DARI RESET TOKEN ${widget.resetToken}');
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.marginSizeLarge),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                            'Reset Password',
                            style: txtPrimaryHeader.copyWith(fontWeight: FontWeight.w600, color: primaryColor)
                        ),
                        const SizedBox(height: 20),
                        Text(
                            textAlign: TextAlign.center,
                            'Atleast 8 characters with uppercase and lowercase letters.',
                            style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: screenWidth * 0.85,
                          child: CustomTextFieldAuth(title: 'Enter your new password', controller: passwordController),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: screenWidth * 0.85,
                          child: CustomTextFieldAuth(title: 'Enter your confirm password', controller: confirmPasswordController),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
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
                    success: (resetModel, otpModel, verifyOtpModel) {
                      if (resetModel == null) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          resetModel.message!,
                          style: txtSecondaryTitle.copyWith(
                              fontWeight: FontWeight.w500, color: baseColor),
                        ),
                        backgroundColor: greenMedium,
                      ));
                      context.goNamed('login');
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: CommonButton(
                          text: 'Reset',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            final password = passwordController.text;
                            final confirmPassword = confirmPasswordController.text;

                            // Regular expression to check if the password contains both uppercase and lowercase letters
                            final containsUppercase = RegExp(r'[A-Z]');
                            final containsLowercase = RegExp(r'[a-z]');

                            if (password.isEmpty && confirmPassword.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Please fill email field',
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: baseColor),
                                ),
                                backgroundColor: redMedium,
                              ));
                            } else if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Confirm Password must be the same as the password',
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: baseColor),
                                ),
                                backgroundColor: redMedium,
                              ));
                            } else if (!containsUppercase.hasMatch(password) || !containsLowercase.hasMatch(password)) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  'Password must contain both uppercase and lowercase letters',
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w500, color: baseColor),
                                ),
                                backgroundColor: redMedium,
                              ));
                            } else {
                              final requestModel = ResetPasswordRequestModel(
                                email: widget.email,
                                password: password,
                                passwordConfirmation: confirmPassword,
                                otp: widget.otp,
                                token: widget.resetToken,
                              );

                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(ForgotPasswordEvent.postResetPassword(requestModel));
                            }
                          },

                          borderRadius: 10,
                          height: 55,
                          fontSize: 18,
                        ),
                      );
                    },
                    loading: () {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: CommonButton(
                          text: 'Reset',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {},
                          borderRadius: 10,
                          height: 55,
                          fontSize: 18,
                          widget: LoadingAnimationWidget.staggeredDotsWave(
                            color: baseColor,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
