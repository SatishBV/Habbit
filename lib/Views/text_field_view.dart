import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

class HabbitTextField extends StatelessWidget {
  HabbitTextField({
    @required this.controller,
    @required this.placeHolder,
    @required this.borderColor,
  });

  final TextEditingController controller;
  final String placeHolder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        color: kCardColor,
        child: Center(
          child: TextField(
            controller: controller,
            style: kTextFieldTextStyle,
            decoration: InputDecoration().copyWith(
              labelText: placeHolder,
              focusedBorder: textFieldFocusedBorder.copyWith(
                borderSide: BorderSide(
                  color: borderColor,
                  width: 2.0,
                ),
              ),
            ),
            autocorrect: false,
          ),
        ),
      ),
    );
  }
}
