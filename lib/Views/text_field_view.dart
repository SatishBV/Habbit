import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

class HabbitTextField extends StatelessWidget {
  HabbitTextField({
    @required this.controller,
    @required this.helperText,
    @required this.onFinish,
  });

  final TextEditingController controller;
  final String helperText;
  final Function onFinish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: kTextFieldTextStyle,
          autocorrect: false,
          decoration: InputDecoration().copyWith(helperText: helperText),
          onSubmitted: (String value) {
            onFinish(value);
          },
        ),
      ),
    );
  }
}