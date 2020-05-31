import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/Constants/activity_icons.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({
    Key key,
    @required this.habit,
    @required this.currentDate,
    @required this.onDeleteHabit,
    @required this.onCheckIn,
  }) : super(key: key);

  final Habit habit;
  final Function onDeleteHabit;
  final Function onCheckIn;
  final DateTime currentDate;

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();

    _isSelected = widget.habit.isCheckedIn(widget.currentDate);
  }

  @override
  Widget build(BuildContext context) {
    int scheduledCheckIns = widget.habit.scheduledCheckIns();
    int currentWeekCheckIns = widget.habit.weeklyCheckIns();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: _isSelected ? iconChecked() : checkBox(),
            ),
            Expanded(
              child: Dismissible(
                key: UniqueKey(),
                background: Container(),
                secondaryBackground: taskDeleteBackground(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final bool res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                            "Are you sure you want to delete the habit ${widget.habit.title}?",
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: kWhiteColor),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.onDeleteHabit(widget.habit);
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    return res;
                  } else {
                    return true;
                  }
                },
                child: Container(
                  height: 80.0,
                  child: Material(
                    color: widget.habit.habitColor,
                    elevation: 6.0,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: habitImage(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.habit.title,
                                style: kHomePageCardTitle,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: Text(
                                  '$currentWeekCheckIns/$scheduledCheckIns'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconChecked() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onCheckIn(false, widget.habit);
        });
      },
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.check,
          color: widget.habit.habitColor,
          size: 20.0,
        ),
      ),
    );
  }

  Widget checkBox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onCheckIn(true, widget.habit);
        });
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: widget.habit.habitColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget habitImage() {
    return Center(
      child: Image(
        image: AssetImage(
          widget.habit.icon.imagePath,
        ),
        width: 35.0,
        height: 35.0,
      ),
    );
  }

  Widget taskDeleteBackground() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Container(
        height: 80.0,
        padding: EdgeInsets.only(right: 28.0),
        alignment: AlignmentDirectional.centerEnd,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: FaIcon(FontAwesomeIcons.minusCircle),
      ),
    );
  }
}
