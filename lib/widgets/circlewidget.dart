import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final Color color;

  const CircleWidget(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, // Adjust the size of the circles as needed
      height: 30,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
