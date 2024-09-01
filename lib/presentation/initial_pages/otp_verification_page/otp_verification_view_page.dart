import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/initial_pages/otp_verification_page/bloc/otp_verification_bloc.dart';

import '../../../data/models/request/register_request_model.dart';
import '../../../data/repository/global_variabel.dart';
import '../../global_components/common_button.dart';

class OtpPageView extends StatefulWidget {
  const OtpPageView({super.key, this.username, this.email, this.password});
  final String? username;
  final String? email;
  final String? password;

  @override
  _OtpPageViewState createState() => _OtpPageViewState();
}

class _OtpPageViewState extends State<OtpPageView> {
  bool isLoading = false;
  bool isEnabled = false;
  TextEditingController otpNumberController = TextEditingController();
  String countDown = "05:00";

  @override
  void dispose() {
    otpNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<OtpVerificationBloc>().add(const OtpVerificationEvent.startTimer());
  }

  @override
  Widget build(BuildContext context) {
    print('VALUE DARI EMAIL ${widget.email}');
    print('VALUE DARI PASSWORD ${widget.password}');
    print('VALUE DARI USERNAME ${widget.username}');

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child:  IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                      context.pop();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(icLogoPrimary, width: 125),
              ),
              const SizedBox(height: 30),
              Text(
                "Email Verification Code",
                style: txtSecondaryHeader.copyWith(
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              Text(
                "The code will be sent to your email inbox",
                style: txtPrimarySubTitle.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor),
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
                  BlocBuilder<OtpVerificationBloc, OtpVerificationState>(
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
                          '05:00',
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
              BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
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
                      success: (model, otpModel) {
                        if (model != null) {
                          if (model.message == 'User created successfully') {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                model.message!,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: baseColor),
                              ),
                              backgroundColor: greenMedium,
                            ));
                            context.goNamed('dashboard',
                                pathParameters: {'pageIndex': '0'});
                          } else {

                          }

                        }
                      });
                },
                builder: (context, state) {
                  final isLoadingEmailVerification = context
                      .read<OtpVerificationBloc>()
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
                          } else
                            if (otpNumberController.text.isNotEmpty) {
                              final requestModel = RegisterRequestModel(
                                name: widget.username,
                                email: widget.email,
                                password: widget.password,
                                otp: otpNumberController.text,
                                fcmToken: GlobalVariables.deviceToken,
                              );
                              context.read<OtpVerificationBloc>().add(
                                  OtpVerificationEvent.doRegister(requestModel));
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
                    loading: (o) {
                      print(
                          'VALUE DARI LOADING ${!isLoadingEmailVerification}');
                      if (!isLoadingEmailVerification) {
                        return CommonButton(
                          onPressed: () {},
                          borderRadius: 10,
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          fontSize: 18,
                          widget: LoadingAnimationWidget.staggeredDotsWave(
                            color: baseColor,
                            size: 45,
                          ),
                          text: '',
                        );
                      } else {
                        return CommonButton(
                          text: 'Verify',
                          width: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (otpNumberController.text.isNotEmpty) {
                              final requestModel = RegisterRequestModel(
                                name: widget.username,
                                email: widget.email,
                                password: widget.password,
                                otp: otpNumberController.text,
                                fcmToken: GlobalVariables.deviceToken,
                              );
                              context.read<OtpVerificationBloc>().add(
                                  OtpVerificationEvent.doRegister(
                                      requestModel));
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
                            final requestModel = RegisterRequestModel(
                              name: widget.username,
                              email: widget.email,
                              password: widget.password,
                              otp: otpNumberController.text,
                              fcmToken: GlobalVariables.deviceToken,
                            );
                            context.read<OtpVerificationBloc>().add(
                                OtpVerificationEvent.doRegister(requestModel));
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
              BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
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
                    success: (model, otpModel) {
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
                      .read<OtpVerificationBloc>()
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
                              context.read<OtpVerificationBloc>().add(
                                  OtpVerificationEvent.postEmailVerification(
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
                      loading: (o) {
                    print(
                        'VALUE DARI LOADING KIRIM ULANG $isLoadingEmailVerification');

                    if (isLoadingEmailVerification) {
                      return CommonButton(
                        borderColor: primaryColor,
                        borderWidth: 1,
                        backgroundColor: baseColor,
                        text: "Resend New OTP",
                        textColor: primaryColor,
                        width: MediaQuery.of(context).size.width,
                        onPressed: (){},
                        widget: LoadingAnimationWidget.staggeredDotsWave(
                          color: primaryColor,
                          size: 30,
                        ),
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
                            context.read<OtpVerificationBloc>().add(
                                OtpVerificationEvent.postEmailVerification(
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
                          context.read<OtpVerificationBloc>().add(
                              OtpVerificationEvent.postEmailVerification(
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
      ),
    );
  }
}
