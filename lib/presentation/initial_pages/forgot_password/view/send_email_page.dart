import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tedikap_user_bloc/common/dimensions.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/global_components/textfield_auth_custom.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/forgot_password/bloc/forgot_password_bloc.dart';

class SendEmailPage extends StatefulWidget {
  const SendEmailPage({super.key});

  @override
  State<SendEmailPage> createState() => _SendEmailPageState();
}

class _SendEmailPageState extends State<SendEmailPage> {
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.marginSizeLarge),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                            'Forgot Password?',
                            style: txtPrimaryHeader.copyWith(fontWeight: FontWeight.w600, color: primaryColor)
                        ),
                        const SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          'Don’t worry! It happens. Please enter the address associated with your account.',
                          style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: screenWidth * 0.85,
                          child: CustomTextFieldAuth(title: 'Enter your email', controller: emailController),
                        ),
                        const SizedBox(height: 20),
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
                      if (otpModel == null) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          otpModel.message!,
                          style: txtSecondaryTitle.copyWith(
                              fontWeight: FontWeight.w500, color: baseColor),
                        ),
                        backgroundColor: greenMedium,
                      ));
                      context.pushNamed('otp_email_verification', extra: {'email' : emailController.text,});
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: CommonButton(
                          text: 'Submit',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Please fill email field',
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: baseColor),
                                ),
                                backgroundColor: redMedium,
                              ));
                            } else {

                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(ForgotPasswordEvent.postEmailVerification(emailController.text));
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
                          text: 'Submit',
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
