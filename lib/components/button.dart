// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {required this.buttonText,
      required this.buttonHeight,
      required this.buttonColor});
  final buttonText;
  final buttonHeight;
  final buttonColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    buttonPressed(String buttonText) {}
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * widget.buttonHeight,
      color: widget.buttonColor,
      child: TextButton(
        onPressed: buttonPressed(widget.buttonText),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
