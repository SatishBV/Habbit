import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'API/firestore.dart';
import 'Utils/activity_icon_util.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomeScreen';

  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final API api = API();

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
      body: getListOfHabits(),
      floatingActionButton: FloatingActionButton(
        disabledElevation: 4.0,
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: kPapayaColor,
        ),
        backgroundColor: kDarkBlueColor,
        elevation: 6,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
      ),
    );
  }

  Future getHabitsStream() async {
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    // QuerySnapshot qn = await ref.getDocuments();
    return ref.snapshots();
  }

  Future getHabits() async {
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    QuerySnapshot qn = await ref.getDocuments();
    return qn.documents;
  }

  FutureBuilder getListOfHabits() {
    return FutureBuilder(
        future: getHabitsStream(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text('Loading....'),
              );
            default:
              return StreamBuilder<QuerySnapshot>(
                stream: snapshot.data,
                builder: (_,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (!streamSnapshot.hasData) {
                    return Text("Loading..");
                  }
                  return ListView.builder(
                    itemCount: streamSnapshot.data.documents.length,
                    itemBuilder: (_, index) {
                      var document = streamSnapshot.data.documents[index];
                      
                      Habit currentHabit = Habit();
                      currentHabit.title = document.data["title"];
                      currentHabit.description = document.data["description"];
                      currentHabit.icon = activityFrom(document.data["icon"]);
                      currentHabit.habitColor =
                          currentHabit.getColorFrom(document.data["color"]);

                      return HomePageCard(
                        habit: currentHabit,
                        onDeleteHabit: (habit) {
                          deleteHabitCallBack(habit);
                        },
                      );
                    },
                  );
                },
              );
          }
        },
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
