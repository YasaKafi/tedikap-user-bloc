import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/theme.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final int? maxTextLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final Widget? prefix;
  final void Function(String)? onChanged;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxTextLength,
    this.controller,
    this.inputFormatters,
    this.icon, this.prefix, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefix: prefix,
        icon: icon,
        hintStyle: txtPrimarySubTitle.copyWith(
            fontWeight: FontWeight.w500, color: blackColor),
        hintText: hintText,
        focusColor: primaryColor,
        labelText: hintText,
        helperMaxLines: 2,
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: onChanged,
      keyboardType: keyboardType,
    );
  }
}

