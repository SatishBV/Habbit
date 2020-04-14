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
            bottom: 10.0,
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
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 0,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(0);
                      setState(() {
                        activeDate = getDate(0);
                      });
                    },
                    isActive: isActiveDate(0),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 1,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(1);
                      setState(() {
                        activeDate = getDate(1);
                      });
                    },
                    isActive: isActiveDate(1),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 2,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(2);
                      setState(() {
                        activeDate = getDate(2);
                      });
                    },
                    isActive: isActiveDate(2),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 3,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(3);
                      setState(() {
                        activeDate = getDate(3);
                      });
                    },
                    isActive: isActiveDate(3),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 4,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(4);
                      setState(() {
                        activeDate = getDate(4);
                      });
                    },
                    isActive: isActiveDate(4),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 5,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(5);
                      setState(() {
                        activeDate = getDate(5);
                      });
                    },
                    isActive: isActiveDate(5),
                  )),
              Expanded(
                  flex: 1,
                  child: DateBlockView(
                    dayOfWeek: 6,
                    weekOffSet: _weekOffset,
                    onTap: () {
                      callBack(6);
                      setState(() {
                        activeDate = getDate(6);
                      });
                    },
                    isActive: isActiveDate(6),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  void callBack(int weekDay) {
    DateTime today = getDate(weekDay);
    widget.onTap(today);
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
}
