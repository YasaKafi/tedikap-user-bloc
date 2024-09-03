
import 'package:flutter/material.dart';

import '../../../../../common/theme.dart';


class EditImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool? disableChange;

  const EditImageButton({super.key, required this.onPressed, this.disableChange = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const  EdgeInsets.all(10),
        backgroundColor: disableChange == false ? primaryColor : grey,
      ),
      child: const  Icon(Icons.edit, color: blackColor),
    );
  }
}

