import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
          animationDuration: const Duration(seconds: 2)),
      child: Text(text),
    );
  }
}
