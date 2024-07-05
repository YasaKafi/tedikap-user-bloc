import 'package:flutter/material.dart';

import '../../common/theme.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.style,
    this.borderRadius,
    this.backgroundColor,
    this.fontWeight,
    this.fontSize,
    this.textColor,
  });

  String text;
  double? width;
  double? height;
  double? fontSize;
  VoidCallback? onPressed;
  TextStyle? style;
  double? borderRadius;
  Color? backgroundColor;
  Color? textColor;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? null,

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? primaryColor,
          fixedSize: Size(width ?? double.maxFinite, height ?? 0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15)
          ),
        ),
        child: Text(
          text,
          style: style ?? txtButton.copyWith(
            fontWeight: fontWeight ?? FontWeight.w600,
            color: textColor ?? baseColor,
            fontSize: fontSize ?? 16,

          ),
        )

    );
  }
}