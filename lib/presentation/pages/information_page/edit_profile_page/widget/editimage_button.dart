
import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';


class EditImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditImageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const  EdgeInsets.all(10),
        backgroundColor: primaryColor,
      ),
      child: const Icon(Icons.edit, color: Colors.black),
    );
  }
}

