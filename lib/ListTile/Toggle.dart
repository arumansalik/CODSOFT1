import 'package:flutter/material.dart';
import 'package:todo_list/Colors/colors.dart';

class ToggleBut extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ToggleBut({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Tcolor.primary,
      child: Text(text),
    );
  }
}
