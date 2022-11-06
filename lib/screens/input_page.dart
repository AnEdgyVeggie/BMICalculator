import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/components/gender_card.dart';
import '/components/reusable_card.dart';
import '/components/bottom_button.dart';
import '/components/round_icon_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum GenderType { male, female }

class _InputPageState extends State<InputPage> {
  void buttonHighlight(GenderType selection) {
    selection == GenderType.male
        ? maleCardColor = kActiveCardColor
        : maleCardColor = kInactiveCardColor;
    selection == GenderType.female
        ? femaleCardColor = kActiveCardColor
        : femaleCardColor = kInactiveCardColor;
  }

  int heightValue = 175, weight = 60, age = 18;

  Color maleCardColor = kInactiveCardColor,
      femaleCardColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            buttonHighlight(GenderType.male);
                          });
                        },
                        cardChild: GenderCard(
                          genderIcon: FontAwesomeIcons.mars,
                          gender: 'MALE',
                        ),
                        color: maleCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            buttonHighlight(GenderType.female);
                          });
                        },
                        cardChild: GenderCard(
                            genderIcon: FontAwesomeIcons.venus,
                            gender: 'FEMALE'),
                        color: femaleCardColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(heightValue.toString(), style: kLargeNumberStyle),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: kAccentOverlay,
                        thumbColor: kAccentColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kSliderInactive,
                      ),
                      child: Slider(
                        value: heightValue.toDouble(),
                        min: 120.0,
                        max: 230.0,
                        onChanged: ((value) {
                          setState(() {
                            heightValue = value.toInt();
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLargeNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                changeValue: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                changeValue: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLargeNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  changeValue: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  changeValue: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'Calculate',
              onPress: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: heightValue, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiResult: calc.CalculateBMI(),
                            resultText: calc.GetResult(),
                            interpretation: calc.GetInterpretation())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
