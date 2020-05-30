import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Models/weekday.dart';

class DayCircle extends StatelessWidget {
  DayCircle(
      {@required this.day,
      @required this.accentColor,
      @required this.isActive,
      this.onTap});

  final WeekDay day;
  final Function onTap;
  final bool isActive;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        child: Material(
          elevation: isActive ? 6 : 4,
          borderRadius: BorderRadius.circular(25.0),
          color: isActive ? accentColor : kWhiteColor,
          child: Center(
            child: Text(
              day.abbrv,
              style: kTitleStyle.copyWith(color: kBlackColor, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
