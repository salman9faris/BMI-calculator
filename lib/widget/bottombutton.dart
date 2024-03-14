import 'package:bmicalculator/constants/constant.dart';
import 'package:flutter/material.dart';

class bottomButton extends StatelessWidget {
  bottomButton({
    super.key,
    required this.onPress,
    required this.title,
  });

  VoidCallback? onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: KBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: KBottomContainerheight,
        child: Center(
            child: Text(
          title,
          style: KBottomContainerStyle,
        )),
      ),
    );
  }
}
