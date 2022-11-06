import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, 
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
