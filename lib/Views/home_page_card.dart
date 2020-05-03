import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/Constants/activity_icons.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard(
      {Key key, @required this.habit, @required this.onDeleteHabit})
      : super(key: key);

  final Habit habit;
  final Function onDeleteHabit;

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    int scheduledCheckIns = widget.habit.scheduledCheckIns();

    return ListTile(
      title: Dismissible(
        direction: DismissDirection.horizontal,
        resizeDuration: Duration(milliseconds: 50),
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            setState(() {
              _isSelected = !_isSelected;
            });
          }
        },
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
                        style: TextStyle(color: textColor),
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
        background: taskDoneBackground(),
        secondaryBackground: taskDeleteBackground(),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2.0),
          height: 80.0,
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: widget.habit.habitColor,
                    child: _isSelected ? iconChecked() : habitImage(),
                    radius: 20.0,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
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
                flex: 2,
                child: Container(
                  child: Center(
                    child: Text('5/$scheduledCheckIns'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconChecked() {
    return Center(
      child: FaIcon(
        FontAwesomeIcons.check,
        color: Colors.white,
        size: 20.0,
      ),
    );
  }

  Widget habitImage() {
    return Center(
      child: Image(
        image: AssetImage(
          widget.habit.icon.imagePath,
        ),
        width: 25.0,
        height: 25.0,
      ),
    );
  }

  Widget taskDoneBackground() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      height: 80.0,
      padding: EdgeInsets.only(left: 28.0),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: FaIcon(FontAwesomeIcons.solidCheckCircle),
    );
  }

  Widget taskDeleteBackground() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      height: 80.0,
      padding: EdgeInsets.only(right: 28.0),
      alignment: AlignmentDirectional.centerEnd,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: FaIcon(FontAwesomeIcons.minusCircle),
    );
  }
}
