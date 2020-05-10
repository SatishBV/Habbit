import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

class HabbitTextField extends StatelessWidget {
  HabbitTextField({
    @required this.controller,
    @required this.placeHolder,
    @required this.borderColor,
    this.obscureText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String placeHolder;
  final Color borderColor;
  final bool obscureText;
  final TextInputType keyboardType;

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
            obscureText: obscureText != null ? obscureText : false,
            keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
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
