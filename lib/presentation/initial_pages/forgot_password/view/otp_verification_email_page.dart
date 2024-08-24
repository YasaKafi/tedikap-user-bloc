import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:tedikap_user_bloc/common/dimensions.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';

class SendOtpEmailPage extends StatefulWidget {
  const SendOtpEmailPage({super.key});

  @override
  State<SendOtpEmailPage> createState() => _SendOtpEmailPageState();
}

class _SendOtpEmailPageState extends State<SendOtpEmailPage> {
  final TextEditingController emailController = TextEditingController();
  bool isEnabled = false;
  TextEditingController otpNumberController = TextEditingController();
  String countDown = "03:00"; // Dummy timer value

  @override
  void dispose() {
    otpNumberController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 9),
      width: 58,
      height: 60,
      textStyle: txtPrimarySubTitle.copyWith(
        fontWeight: FontWeight.w600, color: blackColor,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF808383).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
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
                            'Enter OTP',
                            style: txtPrimaryHeader.copyWith(fontWeight: FontWeight.w600, color: primaryColor)
                        ),
                        const SizedBox(height: 20),
                        Text(
                            textAlign: TextAlign.center,
                            'A 4 digit code has been sent to yasazerina@gmail.com. Please enter the code below.',
                            style: txtSecondarySubTitle.copyWith(fontWeight: FontWeight.w400, color: blackColor)
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: screenWidth * 0.85,
                          child: Container(
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
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonButton(width: screenWidth,text: 'Verify', onPressed: (){}, padding: EdgeInsets.symmetric(vertical: 10),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
