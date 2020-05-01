import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

class HabbitTextField extends StatelessWidget {
  HabbitTextField({
    @required this.controller,
    @required this.placeHolder,
  });

  final TextEditingController controller;
  final String placeHolder;

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
            decoration: InputDecoration().copyWith(labelText: placeHolder,),
            autocorrect: false,            
          ),
        ),
      ),
    );
  }
}