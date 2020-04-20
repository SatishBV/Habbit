import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/Views/day_circle.dart';

class WeekDayPicker extends StatefulWidget {
  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<WeekDayPicker> {
  Map<WeekDay, bool> days = new Map();

  @override
  void initState() {
    super.initState();

    for (WeekDay day in WeekDay.values) {
      days[day] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Repeats every',
              style: kCaptionStyle,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _getDayCircles(),
            )
          ],
        ),
      ),
    );
  }

  void onDayTap(WeekDay day) {
    setState(() {
      days[day] = !days[day];
    });
  }

  List<Widget> _getDayCircles() {
    List<DayCircle> blocks = [];

    for (WeekDay day in WeekDay.values) {
      DayCircle circle = DayCircle(
        day: day,
        isActive: days[day],
        onTap: () {
          onDayTap(day);
        },
      );

      blocks.add(circle);
    }
    return blocks;
  }
}

