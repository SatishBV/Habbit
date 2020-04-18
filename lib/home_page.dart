import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/add_habit.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';
import 'Views/home_page_card.dart';
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

    dummy.add('Meditate');
    dummy.add('Read books');
    dummy.add('Do Yoga');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40.0),
            ),
          ),
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 80.0,
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
