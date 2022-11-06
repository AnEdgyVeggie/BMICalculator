import 'package:flutter/material.dart';
import '/constants.dart';

const double iconSize = 80, sizedBoxHeight = 15;

class GenderCard extends StatelessWidget {
  GenderCard({required this.genderIcon, this.gender = ''});

  final IconData genderIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(genderIcon, size: iconSize),
        const SizedBox(
          height: sizedBoxHeight,
        ),
        Text(gender, style: kLabelTextStyle),
      ],
    );
  }
}
