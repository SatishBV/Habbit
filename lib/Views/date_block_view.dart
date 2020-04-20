import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:habbit/Utils/date_util.dart';

class DateBlockView extends StatelessWidget {
  final int dayOfWeek;
  final int weekOffSet;
  final bool isActive;
  final Function onTap;

  DateBlockView({
    @required this.dayOfWeek,
    @required this.weekOffSet,
    @required this.isActive,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(6.0),
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isActive ? kGreenColor : kCardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(getDayText(), style: isActive ? kCaptionStyleActive : kCaptionStyle),
            Text(getDateForDay(dayOfWeek), style: isActive ? kTitleStyleActive : kTitleStyle),
          ],
        ),
      ),
    );
  }

  String getDateForDay(int weekDay) {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * weekOffSet));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    DateTime dateDay = weekStartDate.add(Duration(days: weekDay));
    return DateFormat('d').format(dateDay);
  }

  String getDayText() {
    switch (dayOfWeek) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
    }
    return '';
  }
}
