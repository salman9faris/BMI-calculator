import 'package:bmicalculator/constants/constant.dart';
import 'package:flutter/material.dart';

class IconContant extends StatelessWidget {
  const IconContant({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: KLabalTextstyle,
        )
      ],
    );
  }
}
