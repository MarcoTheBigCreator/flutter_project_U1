import 'package:flutter/material.dart';

Widget blackButton() {
  return Container(
    width: double.infinity, // Takes the full width of the screen
    height: 50, // Set the height to 20
    margin: const EdgeInsets.all(10.0), // Add margin
    decoration: BoxDecoration(
      color: Colors.black, // Black background color
      borderRadius: BorderRadius.circular(10.0), // Add border radius
    ),
    child: const Center(
      child: Text(
        "P A Y  N O W",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}
