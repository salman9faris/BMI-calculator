import 'package:bmicalculator/bmi_calculator.dart';
import 'package:bmicalculator/constants/constant.dart';
import 'package:bmicalculator/widget/RoundIconBottin.dart';
import 'package:bmicalculator/widget/bottombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widget/ReusableCard.dart';
import 'widget/IconContant.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMi calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colors: selectedGender == Gender.male
                          ? KActiveColor
                          : KInactiveColor,
                      cardChild: const IconContant(
                        icon: FontAwesomeIcons.mars,
                        label: "Male",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colors: selectedGender == Gender.female
                          ? KActiveColor
                          : KInactiveColor,
                      cardChild: const IconContant(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colors: KInactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Height",
                        style: KLabalTextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: KNumbertextstyle),
                          const Text(
                            "Cm",
                            style: KLabalTextstyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 25.0),
                            thumbColor: KBottomContainerColor,
                            activeTrackColor: Colors.white,
                            overlayColor: const Color(0x29eb1555),
                            trackHeight: 1),
                        child: Slider(
                          value: height.toDouble(),
                          inactiveColor: KActiveColor,
                          min: 100,
                          max: 200,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colors: KInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Weight",
                            style: KLabalTextstyle,
                          ),
                          Text(weight.toString(), style: KNumbertextstyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundiIconBotton(
                                roundedIcon: const Icon(
                                  FontAwesomeIcons.minus,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              RoundiIconBotton(
                                roundedIcon: const Icon(
                                  FontAwesomeIcons.plus,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colors: KInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Age",
                            style: KLabalTextstyle,
                          ),
                          Text(age.toString(), style: KNumbertextstyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundiIconBotton(
                                roundedIcon: const Icon(
                                  FontAwesomeIcons.minus,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              RoundiIconBotton(
                                roundedIcon: const Icon(
                                  FontAwesomeIcons.plus,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomButton(
              title: "calculate",
              onPress: () {
                BmiCalculator bmiCalculator =
                    BmiCalculator(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resulpage(
                              bmiCalculator: bmiCalculator.calculateBmi(),
                              bmiResult: bmiCalculator.getBmiResult(),
                              getInterpretation:
                                  bmiCalculator.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}
