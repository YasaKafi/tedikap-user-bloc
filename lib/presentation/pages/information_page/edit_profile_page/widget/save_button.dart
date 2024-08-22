import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width ,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Simpan',
            style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: baseColor),
          ),
        ),
      ),
    );
  }
}
