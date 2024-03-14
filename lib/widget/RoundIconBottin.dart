import 'package:bmicalculator/constants/constant.dart';
import 'package:flutter/material.dart';

class RoundiIconBotton extends StatelessWidget {
  RoundiIconBotton(
      {super.key, required this.roundedIcon, required this.onPressed});

  Widget roundedIcon;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      elevation: 6,
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: KActiveColor,
      child: roundedIcon,
    );
  }
}
