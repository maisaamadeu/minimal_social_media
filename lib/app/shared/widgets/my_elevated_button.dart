import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(
      {super.key,
      required this.onPressed,
      required this.backgroundColor,
      required this.text,
      required this.colorText});

  final VoidCallback onPressed;
  final Color backgroundColor;
  final String text;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorText,
        ),
      ),
    );
  }
}
