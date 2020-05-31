import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Models/habit.dart';
import 'package:habbit/Utils/alerts_util.dart';
import 'package:habbit/Utils/date_util.dart';
import 'package:habbit/add_habit.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';
import 'Views/home_page_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'authentication.dart';
import 'API/firestore.dart';

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
  List<Habit> tempSnapshot = [];
  DateTime _selectedDate = DateUtils.dateOnly(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  Future addHabitCallBack(Habit habit) async {
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    tempSnapshot.forEach((element) {
      if (element.title == habit.title) {
        showDialogWithClose(context, "Habit ${habit.title} already exists");
        return;
      }
    });
    await ref.document(habit.title).setData(habit.toDocument());
  }

  Future deleteHabitCallBack(Habit habit) async {
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    await ref.document(habit.title).delete();
  }

  Future addCheckIn(Habit habit) async {
    habit.addCheckIn(DateTime.now());
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    await ref.document(habit.title).setData(habit.toDocument());
  }

  Future removeCheckIn(Habit habit) async {
    habit.removeCheckIn(DateTime.now());
    CollectionReference ref = await widget.api.getHabitsCollectionReference();
    await ref.document(habit.title).setData(habit.toDocument());
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
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: getListOfHabits(),
      ),
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
    return ref.snapshots();
  }

  Widget getListOfHabits() {
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
              builder: (_, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  tempSnapshot = [];
                  return ListView.builder(
                    itemCount: streamSnapshot.data.documents.length,
                    itemBuilder: (_, index) {
                      var document = streamSnapshot.data.documents[index];
                      if (!streamSnapshot.hasData) {
                        return Text('No data found');
                      }
                      tempSnapshot.add(Habit.fromDocument(document));
                      return HomePageCard(
                        habit: Habit.fromDocument(document),
                        onDeleteHabit: (habit) {
                          deleteHabitCallBack(habit);
                        },
                        onCheckIn: (bool checkIn, Habit habit) {
                          checkIn ? addCheckIn(habit) : removeCheckIn(habit);
                        },
                      );
                    },
                  );
                } else if (streamSnapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kPapayaColor,
                    ),
                  );
                }
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
    _selectedDate = DateUtils.dateOnly(dateTime);
  }
}
