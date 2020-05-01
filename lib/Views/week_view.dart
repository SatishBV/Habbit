import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:habbit/Utils/date_util.dart';
import 'package:habbit/Views/date_block_view.dart';

class WeekView extends StatefulWidget {
  final Function onTap;

  WeekView({@required this.onTap});

  @override
  _WeekViewState createState() => _WeekViewState();
}

class _WeekViewState extends State<WeekView> {
  int _weekOffset = 0;
  DateTime activeDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _weekOffset = 0;
    activeDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 10.0,
          ),
          child: Text(
            getMonth(),
            style: kMonthYearLabel,
          ),
        ),
        Dismissible(
          movementDuration: Duration(milliseconds: 0),
          resizeDuration: null,
          onDismissed: (DismissDirection direction) {
            setState(() {
              _weekOffset += direction == DismissDirection.endToStart ? -1 : 1;
            });
          },
          key: new ValueKey(_weekOffset),
          child: Row(
            children: _getDateBlocks(),
          ),
        ),
      ],
    );
  }

  void callBack(int weekDay) {
    DateTime selectedDate = getDate(weekDay);
    widget.onTap(selectedDate);
  }

  bool isActiveDate(int weekDay) {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    DateTime dateDay = weekStartDate.add(Duration(days: weekDay));

    return dateDay.day == activeDate.day &&
        dateDay.month == activeDate.month &&
        dateDay.year == activeDate.year;
  }

  DateTime getDate(int weekDay) {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    return weekStartDate.add(Duration(days: weekDay));
  }

  String getMonth() {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    return DateFormat('MMM y').format(weekStartDate);
  }

  List<Widget> _getDateBlocks() {
    List<Widget> blocks = [];
    for (int i = 0; i < 7; i++) {
      Widget block = Expanded(
        flex: 1,
        child: DateBlockView(
          dayOfWeek: i,
          weekOffSet: _weekOffset,
          onTap: () {
            callBack(i);
            setState(() {
              activeDate = getDate(i);
            });
          },
          isActive: isActiveDate(i),
        ),
      );

      blocks.add(block);
    }
    return blocks;
  }
}
