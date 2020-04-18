import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({
    Key key,
    @required this.habitText,
  }) : super(key: key);

  final String habitText;

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
        height: 120.0,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  child: Container(
                      height: 60.0,
                      width: 60.0,
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
                      widget.habitText,
                      style: kHomePageCardTitle,
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Description',
                      style: kDayLabel,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}