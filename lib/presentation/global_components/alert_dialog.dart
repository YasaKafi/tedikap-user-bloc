
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tedikap_user_bloc/common/constant.dart';

import '../../common/theme.dart';


   onShowAlertDialog(context,
      {String? title,
        TextStyle? titleStyle,
        TextStyle? descStyle,
        String? desc,
        String? icon,
        String? textBtn1,
        String? textBtn2,
        EdgeInsets? padding,
        Color? bgColor,
        Color? bgColorBtn1,
        Color? bgColorBtn2,
        Widget? widgetImage,
        List<DialogButton>? buttons,
        VoidCallback? onPressed}) {
    Alert(
      context: context,
      title: title,
      padding: padding ?? const EdgeInsets.all(20),
      style: AlertStyle(
        animationType: AnimationType.shrink,
        isCloseButton: false,
        backgroundColor: bgColor,
        overlayColor: Colors.black38,
        titleStyle: titleStyle!,
        descStyle: descStyle!,
      ),
      desc: desc,
      image: widgetImage ?? SvgPicture.asset(
        icon ?? icAlert,
        width: 80,
        height: 80,
      ),
      buttons: buttons ?? [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: bgColorBtn1 ?? redMedium,
          child: Text(
            textBtn1 ?? "Cancel",
            style: txtPrimaryTitle.copyWith(
                fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),
        DialogButton(
            color: bgColorBtn2 ?? navyColor,
            onPressed: onPressed,
            child: Text(
              textBtn2 ?? "Confirm",
              style: txtPrimaryTitle.copyWith(
                  fontWeight: FontWeight.w600, color: baseColor),
            )),
      ],
    ).show();
  }
