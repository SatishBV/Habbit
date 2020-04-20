import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/Views/day_circle.dart';

class WeekDayPicker extends StatefulWidget {
  final Map<WeekDay, bool> days;
  final Function onDayTap;

  WeekDayPicker({@required this.days, @required this.onDayTap});

  @override
  _WeekDayPickerState createState() => _WeekDayPickerState();
}

class _WeekDayPickerState extends State<WeekDayPicker> {
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

  List<Widget> _getDayCircles() {
    List<DayCircle> blocks = [];

    for (WeekDay day in WeekDay.values) {
      DayCircle circle = DayCircle(
        day: day,
        isActive: widget.days[day],
        onTap: () {
          setState(() {
            widget.days[day] = !widget.days[day];
          });
          widget.onDayTap(widget.days);
        },
      );

      blocks.add(circle);
    }
    return blocks;
  }
}
