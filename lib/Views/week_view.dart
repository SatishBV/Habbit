import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:habbit/Utils/date_util.dart';

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
            style: dateTextStyle,
          ),
        ),
        Dismissible(
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
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(0) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Mon', style: dayTextStyle),
                      Text(getDateForDay(0), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(1) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Tue', style: dayTextStyle),
                      Text(getDateForDay(1), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(2) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Wed', style: dayTextStyle),
                      Text(getDateForDay(2), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(3) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Thu', style: dayTextStyle),
                      Text(getDateForDay(3), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(4) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Fri', style: dayTextStyle),
                      Text(getDateForDay(4), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(5) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sat', style: dayTextStyle),
                      Text(getDateForDay(5), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(6.0),
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isActiveDate(6) ? purpleColor : Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sun', style: dayTextStyle),
                      Text(getDateForDay(6), style: dateTextStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool isActiveDate(int weekDay) {
	  DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
	DateTime dateDay = weekStartDate.add(Duration(days: weekDay));

	return dateDay.day == activeDate.day;
  }

  String getDateForDay(int weekDay) {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    DateTime dateDay = weekStartDate.add(Duration(days: weekDay));
    return DateFormat('d').format(dateDay);
  }

  String getMonth() {
    DateTime dateByOffset =
        DateTime.now().subtract(Duration(days: 7 * _weekOffset));
    DateTime weekStartDate = DateUtils.weekStart(dateByOffset);
    return DateFormat('MMM y').format(weekStartDate);
  }
}

// class DateBlockView extends StatefulWidget
