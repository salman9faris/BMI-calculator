import 'dart:math';

class BmiCalculator {
  BmiCalculator({required this.height, required this.weight})
      : _bmi = weight / pow(height / 100, 2);

  final int height;
  final int weight;
  double _bmi;

  calculateBmi() {
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResult() {
    if (_bmi >= 25) {
      return "Over weight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return " Under weight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have heigher than normal body weight,try to excercise more";
    } else if (_bmi > 18.5) {
      return "you have Normal body weight, Great job";
    } else {
      return " You have lower than normal body weight,you can eat bit more";
    }
  }
}
