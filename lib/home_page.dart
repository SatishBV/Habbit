import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';
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
