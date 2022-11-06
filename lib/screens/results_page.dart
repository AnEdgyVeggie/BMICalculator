import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import '/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Expanded(
              child:Text(       
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                  style: kNormalWeightStyle,),
                  Text(bmiResult,
                  style: kBMITextStyle,),
                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Re-Calculate',
           onPress: () {
              Navigator.push(
                    context,
                    MaterialPageRoute( builder: (context) => InputPage()));
           },),
        ],
      ),
    );
  }
}
