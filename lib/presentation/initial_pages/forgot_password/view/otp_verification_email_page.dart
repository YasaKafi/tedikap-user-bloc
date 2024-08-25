import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_user_bloc/common/dimensions.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/forgot_password/bloc/forgot_password_bloc.dart';

class SendOtpEmailPage extends StatefulWidget {
  const SendOtpEmailPage({super.key, required this.email});
  final String email;

  @override
  State<SendOtpEmailPage> createState() => _SendOtpEmailPageState();
}

class _SendOtpEmailPageState extends State<SendOtpEmailPage> {
  bool isLoading = false;
  bool isEnabled = false;
  TextEditingController otpNumberController = TextEditingController();
  String countDown = "05:00";

  String resetToken = '';

  @override
  void dispose() {
    otpNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ForgotPasswordBloc>().add(const ForgotPasswordEvent.startTimer());
  }

  @override
  Widget build(BuildContext context) {
    print('VALUE DARI EMAIL ${widget.email}');


    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 9),
      width: 58,
      height: 60,
      textStyle: txtPrimarySubTitle.copyWith(
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF808383).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Align(
                alignment: Alignment.topLeft,
                child:  IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Email Verification Code",
                        style: txtPrimaryHeader.copyWith(fontWeight: FontWeight.w600, color: primaryColor)
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "The code will be sent to your email inbox",
                        style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)

                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Pinput(
                      length: 4,
                      controller: otpNumberController,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (value) {
                        setState(() {
                          isEnabled = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          isEnabled = false;
                        });
                      },
                      showCursor: true,
                      cursor: Center(
                        child: Container(
                          margin: const EdgeInsets.only(),
                          width: 1,
                          height: 22,
                          color: Colors.grey,
                        ),
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: primaryColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("The code will expire in ",
                          style: txtPrimarySubTitle.copyWith(
                              fontWeight: FontWeight.w500, color: blackColor)),
                      const SizedBox(width: 3),
                      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            timerRunning: (secondsLeft, i) {
                              final minutes = (secondsLeft / 60).floor();
                              final seconds = secondsLeft % 60;
                              return Text(
                                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                                style: txtPrimarySubTitle.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                            orElse: () => Text(
                              '02:00',
                              style: txtPrimarySubTitle.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
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
                          success: (resetModel, otpModel, verifyOtpModel) async {
                            if (verifyOtpModel != null) {
                              if (verifyOtpModel.message == 'OTP is valid') {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    verifyOtpModel.message!,
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: baseColor),
                                  ),
                                  backgroundColor: greenMedium,
                                ));
                              }
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              final token = prefs.getString('reset_token');
                              context.goNamed('reset_password',
                                  extra: {'email': widget.email, 'otp': otpNumberController.text, 'resetToken': token});
                            }
                          });
                    },
                    builder: (context, state) {
                      final isLoadingEmailVerification = context
                          .read<ForgotPasswordBloc>()
                          .isLoadingEmailVerification;
                      return state.maybeWhen(
                        timerRunning: (secondsLeft, isTimerRunning){
                          return CommonButton(
                            text: 'Verify',
                            backgroundColor: isTimerRunning ? primaryColor : grey,
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if (isTimerRunning == false) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    'Verification code has expired',
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: baseColor),
                                  ),
                                  backgroundColor: redMedium,
                                ));
                              } else {
                                if (otpNumberController.text.isNotEmpty) {
                                  context.read<ForgotPasswordBloc>().add(
                                      ForgotPasswordEvent.verifyOtp(widget.email, otpNumberController.text));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Otp must be filled',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                }

                              }
                            },
                            borderRadius: 10,
                            height: 45,
                            fontSize: 18,
                          );

                        },
                        loading: () {
                          print(
                              'VALUE DARI LOADING ${!isLoadingEmailVerification}');
                          if (!isLoadingEmailVerification) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return CommonButton(
                              text: 'Verify',
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                if (otpNumberController.text.isNotEmpty) {
                                  context.read<ForgotPasswordBloc>().add(
                                      ForgotPasswordEvent.verifyOtp(widget.email, otpNumberController.text));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Otp must be filled',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                }
                              },
                              borderRadius: 10,
                              height: 45,
                              fontSize: 18,
                            );
                          }
                        },
                        orElse: () {
                          return CommonButton(
                            text: 'Verify',
                            width: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if (otpNumberController.text.isNotEmpty) {
                                context.read<ForgotPasswordBloc>().add(
                                    ForgotPasswordEvent.verifyOtp(widget.email, otpNumberController.text));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    'Otp must be filled',
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: baseColor),
                                  ),
                                  backgroundColor: redMedium,
                                ));
                              }
                            },
                            borderRadius: 10,
                            height: 45,
                            fontSize: 18,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text("Didn't receive the OTP?",
                        style: txtPrimarySubTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor)),
                  ),
                  const SizedBox(height: 10),
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
                          if (otpModel != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                otpModel.message!,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: baseColor),
                              ),
                              backgroundColor: greenMedium,
                            ));
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      final isLoadingEmailVerification = context
                          .read<ForgotPasswordBloc>()
                          .isLoadingEmailVerification;

                      return state.maybeWhen(
                          timerRunning: (secondsLeft, isTimerRunning){
                            return CommonButton(
                              borderColor: primaryColor,
                              borderWidth: 1,
                              backgroundColor: baseColor,
                              text: "Resend New OTP",
                              textColor: primaryColor,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                if (widget.email != null) {
                                  context.read<ForgotPasswordBloc>().add(
                                      ForgotPasswordEvent.postEmailVerification(
                                          widget.email));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Email is empty or null',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                }
                              },
                            );

                          },
                          loading: () {
                            print(
                                'VALUE DARI LOADING KIRIM ULANG $isLoadingEmailVerification');

                            if (isLoadingEmailVerification) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CommonButton(
                                borderColor: primaryColor,
                                borderWidth: 1,
                                backgroundColor: baseColor,
                                text: "Resend New OTP",
                                textColor: primaryColor,
                                width: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  if (widget.email != null) {
                                    context.read<ForgotPasswordBloc>().add(
                                        ForgotPasswordEvent.postEmailVerification(
                                            widget.email));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        'Email is empty or null',
                                        style: txtSecondaryTitle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: baseColor),
                                      ),
                                      backgroundColor: redMedium,
                                    ));
                                  }
                                },
                              );
                            }
                          },
                          orElse: () {
                            return CommonButton(
                              borderColor: primaryColor,
                              borderWidth: 1,
                              backgroundColor: baseColor,
                              text: "Resend New OTP",
                              textColor: primaryColor,
                              width: MediaQuery.of(context).size.width,
                              onPressed: () {
                                if (widget.email != null) {
                                  context.read<ForgotPasswordBloc>().add(
                                      ForgotPasswordEvent.postEmailVerification(
                                          widget.email));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Email is empty or null',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                }
                              },
                            );
                          });
                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
