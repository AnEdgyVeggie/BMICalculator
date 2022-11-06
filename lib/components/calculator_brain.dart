import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;

  String CalculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult() {
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Healthy';
    } else {
      return 'Underweight';
    }
  }

  String GetInterpretation() {
    if (_bmi >= 25){
      return 'Your BMI is higher than normal';
    } else if (_bmi > 18.5) {
      return 'Your BMI is within a healthy limit';
    } else {
      return 'Your BMI indicates that you are underweight';
    }
  }
}