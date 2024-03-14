import 'dart:ffi';

import 'package:bmicalculator/constants/constant.dart';
import 'package:bmicalculator/widget/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/widget/bottombutton.dart';

class Resulpage extends StatelessWidget {
  const Resulpage({
    super.key,
    required this.bmiCalculator,
    required this.bmiResult,
    required this.getInterpretation,
  });

  final String bmiCalculator;
  final String bmiResult;
  final String getInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: KResultpageContainerStyle,
            ),
          )),
          Expanded(
            flex: 6,
            child: ReusableCard(
                colors: KActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiResult,
                      style: KResultStyle,
                    ),
                    Text(
                      bmiCalculator,
                      style: KBmiresulttextstyle,
                    ),
                    Text(
                      getInterpretation,
                      textAlign: TextAlign.center,
                      style: KBmiInterpretationstyle,
                    ),
                  ],
                )),
          ),
          bottomButton(
            title: "Re-Calculate",
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
