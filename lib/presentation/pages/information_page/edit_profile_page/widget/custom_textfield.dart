import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../common/theme.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final int? maxTextLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final Widget? prefix;
  final bool readOnly;
  final bool enableBorder;
  final void Function(String)? onChanged;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.maxTextLength,
    this.controller,
    this.inputFormatters,
    this.icon, this.prefix,
    this.onChanged,
    this.readOnly = false,
    this.enableBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxTextLength,
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: primaryColor),
        ),
        prefix: prefix,
        icon: icon,
        hintStyle: txtPrimarySubTitle.copyWith(
            fontWeight: FontWeight.w400, color: grey),
        hintText: hintText,
        enabled: enableBorder,
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
      readOnly: readOnly,
    );
  }
}

