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
    this.padding,
  });

  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
        minimumSize: Size(width ?? 0, height ?? 0), // Set minimum size to zero to let the content dictate the size
        padding: padding ?? const EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 16.0,
          bottom: 8.0,
        ), // Use only padding, default values provided
      ),
      child: Text(
        text,
        style: style ??
            txtButton.copyWith(
              fontWeight: fontWeight ?? FontWeight.w600,
              color: textColor ?? baseColor,
              fontSize: fontSize ?? 16,
            ),
      ),
    );
  }
}
