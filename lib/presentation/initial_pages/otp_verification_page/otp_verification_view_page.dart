import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/common/theme.dart';

import '../../global_components/common_button.dart';

class OtpPageView extends StatefulWidget {
  const OtpPageView({super.key});

  @override
  _OtpPageViewState createState() => _OtpPageViewState();
}

class _OtpPageViewState extends State<OtpPageView> {
  bool isLoading = false;
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

    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(icLogoPrimary, width: 125),
              ),
              const SizedBox(height: 30),
              Text(
                "Kode Verifikasi Email",
                style: txtSecondaryHeader.copyWith(
                  fontWeight: FontWeight.w600, color: blackColor,
                ),
              ),
              Text(
                "Kode akan dikirimkan melalui inbox email",
                style: txtPrimarySubTitle.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor
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
                  Text("Kode akan hangus dalam ", style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
                  const SizedBox(width: 3),
                  InkWell(
                    onTap: () => context.replaceNamed('login'),
                    child: Text(
                      countDown,
                      style: txtPrimarySubTitle.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CommonButton(
                text: "Verifikasi",
                onPressed: isEnabled ? _verifyOtp : null,
                height: 45,
              ),
              const SizedBox(height: 10),
              CommonButton(
                borderColor: primaryColor,
                borderWidth: 1,
                backgroundColor: baseColor,
                text: "Kirim Ulang Email",
                textColor: primaryColor,
                onPressed: _resendOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
    setState(() {
      isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      // Navigate to the next page or show a success message
    });
  }

  void _resendOtp() {
    // Simulate resend OTP
  }
}
