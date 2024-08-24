import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/common/dimensions.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/global_components/textfield_auth_custom.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonButton(width: screenWidth,text: 'Submit', onPressed: (){}, padding: EdgeInsets.symmetric(vertical: 10),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
