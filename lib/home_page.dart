import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/add_habit.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dummy = new List();
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 20; i++) {
      dummy.add('This is tile no $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: AppBar(
          elevation: 8.0,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              WeekView(
                onTap: onDateSelection,
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummy.length,
        itemBuilder: (context, index) {
          return HomePageCard(
            habitText: dummy[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        disabledElevation: 4.0,
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: kPrimaryBlackColor,
        ),
        backgroundColor: kGreenColor,
        elevation: 6,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => CreateHabbit(), fullscreenDialog: true),
          );
        },
      ),
    );
  }

  void onDateSelection(DateTime dateTime) {
    print(dateTime.year.toString());
    print(dateTime.day.toString());
  }
}

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
        height: 90.0,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
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
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
