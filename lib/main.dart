import 'package:flutter/material.dart';
import '/screens/input_page.dart';
import '/screens/results_page.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:const Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
        '/result': (context) => ResultsPage(bmiResult: '', resultText: '', interpretation: ''),
      },
      );
  }
}
