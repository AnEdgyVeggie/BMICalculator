import 'package:flutter/material.dart';
import '/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kAccentColor,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child:  Center(
          child: Text(title,
          style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
