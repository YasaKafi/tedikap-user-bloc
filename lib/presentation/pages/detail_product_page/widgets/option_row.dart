import 'package:flutter/material.dart';
import 'package:tedikap_user_bloc/common/theme.dart';


class OptionRow extends StatelessWidget {
  final String label;
  final String option1;
  final String option2;
  final BoxBorder? border1;
  final BoxBorder? border2;
  final TextStyle option1Style;
  final TextStyle option2Style;
  final Color option1Color;
  final Color option2Color;
  final Color borderColor;
  final VoidCallback onTap1;
  final VoidCallback onTap2;


  OptionRow({
    required this.label,
    required this.option1,
    required this.option2,
    required this.border1,
    required this.border2,
    required this.option1Style,
    required this.option2Style,
    required this.option1Color,
    required this.option2Color,
    required this.borderColor,
    required this.onTap1,
    required this.onTap2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: txtSecondaryTitle.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        Row(
          children: [
            InkWell(
              onTap: onTap1,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: option1Color,
                  border: border1,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(child: Text(option1, style: option1Style)),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: onTap2,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: option2Color,
                  border: border2,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(child: Text(option2, style: option2Style)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
