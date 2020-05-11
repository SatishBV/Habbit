import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/add_habit.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';
import 'Views/home_page_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomeScreen';

  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Habit> dummy = new List();

  @override
  void initState() {
    super.initState();

    Habit tempHabit = Habit();
    tempHabit.title = 'Meditation';
    tempHabit.description = 'Start the day with calm';
    tempHabit.habitColor = Colors.blue;
    tempHabit.icon = ActivityIcon.meditation;
    dummy.add(tempHabit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180.0),
        child: AppBar(
          elevation: 8.0,
          leading: Container(),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 25, 10, 10),
              child: FaIcon(FontAwesomeIcons.search),
            ),
            GestureDetector(
              onTap: () {
                signOut();
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 25, 25, 10),
                child: FaIcon(FontAwesomeIcons.ellipsisH),
              ),
            ),
          ],
          flexibleSpace: Column(
            children: <Widget>[
              SizedBox(
                height: 70.0,
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
            onDeleteHabit: (habit) {
              deleteHabitCallBack(habit);
            },
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
          _settingModalBottomSheet(context);
        },
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return DraggableScrollableSheet(
          initialChildSize: 1.0,
          maxChildSize: 1.0,
          minChildSize: 0.25,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              child: CreateHabbit(
                onSave: addHabitCallBack,
              ),
            );
          },
        );
      },
    );
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
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

  void deleteHabitCallBack(Habit habit) {
    setState(() {
      if (dummy.contains(habit)) {
        dummy.remove(habit);
      }
    });
  }
}
