import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyBotton({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Colors.blue,
    child: Text(text),);
  }
}
