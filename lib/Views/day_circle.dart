import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Models/habit.dart';

class DayCircle extends StatelessWidget {
  DayCircle({@required this.day, @required this.accentColor, @required this.isActive, this.onTap});

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: isActive ? accentColor : kCardColor,
        ),
        child: Center(
          child: Text(
            day.abbrv,
            style: isActive
                ? kTitleStyle.copyWith(
                    color: kPrimaryBlackColor,
                    fontSize: 18.0,
                  )
                : kTitleStyle.copyWith(
                    fontSize: 18.0,
                  ),
          ),
        ),
      ),
    );
  }
}
