import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  int? maxTextLength;
  final TextEditingController? controller;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxTextLength,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [LengthLimitingTextInputFormatter(maxTextLength)],
      decoration: InputDecoration(
        hintStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
        hintText: hintText,
        focusColor: primaryColor,
        labelText: hintText,
        helperMaxLines: 2,
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // Customize other InputDecoration properties as needed
      ),
      keyboardType: keyboardType,
      // Customize other TextField properties as needed
    );
  }
}
