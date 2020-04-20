import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/add_habit.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';
import 'Views/home_page_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Habit> dummy = new List();

  @override
  void initState() {
    super.initState();

    dummy.add(Habit(
      title: 'Meditation',
      description: 'Start the day with calm',
    ));
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
            habit: dummy[index],
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
                builder: (context) => CreateHabbit(onSave: addHabitCallBack)),
          );
        },
      ),
    );
  }

  void onDateSelection(DateTime dateTime) {
    print(dateTime.year.toString());
    print(dateTime.day.toString());
  }

  void addHabitCallBack(Habit habit) {
    setState(() {
      dummy.add(habit);
    });
  }
}
