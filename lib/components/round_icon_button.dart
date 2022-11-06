import 'package:flutter/material.dart';
import '/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.changeValue});

  final VoidCallback changeValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: changeValue,
      shape: const CircleBorder(),
      fillColor: kButtonBackground,
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: Icon(icon),
    );
  }
}
