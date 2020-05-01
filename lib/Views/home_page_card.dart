import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habbit/Models/habit.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({
    Key key,
    @required this.habit,
  }) : super(key: key);

  final Habit habit;

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        margin: EdgeInsets.all(10.0),
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
                child: Container(
                    height: 40.0,
                    width: 40.0,
                    child: _isSelected
                        ? Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidCheckCircle,
                              color: kGreenColor,
                              size: 30.0,
                            ),
                          )
                        : Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidCircle,
                              color: kPrimaryBlackColor,
                              size: 30.0,
                            ),
                          )),
              ),
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
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    widget.habit.description,
                    style: kCaptionStyle,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Text('5/7'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}