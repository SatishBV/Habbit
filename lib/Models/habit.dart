import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Utils/activity_icon_util.dart';
import 'package:habbit/Utils/date_util.dart';
import 'weekday.dart';

class Habit {
  String id = '';
  String title = '';
  String description = '';
  Color habitColor = kPapayaColor;
  ActivityIcon icon;

  Map<WeekDay, bool> selectedDays = new Map();
  List<int> timeOfDays = [];

  int currentStreak;
  int bestStreak;

  List<DateTime> checkIns = [];

  Habit() {
    for (WeekDay day in WeekDay.values) {
      selectedDays[day] = false;
    }
  }

  Habit.fromDocument(DocumentSnapshot document) {
    for (WeekDay day in WeekDay.values) {
      selectedDays[day] = false;
    }

    this.title = document.data["title"];
    this.description = document.data["description"];
    this.habitColor = _getColorFrom(document.data["color"]);
    this.icon = activityFrom(document.data["icon"]);
    _setSelectedDaysFrom(document);
    // print(this.selectedDays);

    this.checkIns = [];
    this.checkIns = document.data['checkIns'].map<DateTime>((item) {
      Timestamp t = item;
      return t.toDate();
    }).toList();

    print(this.checkIns);

    // Timestamp t = document['timeFieldName'];
    // DateTime d = t.toDate();
    // print(d.toString());
    
  }

  Color _getColorFrom(String color) {
    switch (color) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'lightGreen':
        return Colors.lightGreen;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'deepPurple':
        return Colors.deepPurple;
      case 'indigo':
        return Colors.indigo;
      case 'lightBlue':
        return Colors.lightBlue;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'lime':
        return Colors.lime;
      case 'yellow':
        return Colors.yellow;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'papaya':
        return kPapayaColor;
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'blueGrey':
        return Colors.blueGrey;
      default:
        return kPapayaColor;
    }
  }

  void _setSelectedDaysFrom(DocumentSnapshot document) {
    this.selectedDays[WeekDay.monday] = document.data["selectedDays"]["monday"];
    this.selectedDays[WeekDay.tuesday] = document.data["selectedDays"]["tuesday"];
    this.selectedDays[WeekDay.wednesday] = document.data["selectedDays"]["wednesday"];
    this.selectedDays[WeekDay.thursday] = document.data["selectedDays"]["thursday"];
    this.selectedDays[WeekDay.friday] = document.data["selectedDays"]["friday"];
    this.selectedDays[WeekDay.saturday] = document.data["selectedDays"]["saturday"];
    this.selectedDays[WeekDay.sunday] = document.data["selectedDays"]["sunday"];
  }

  int scheduledCheckIns() {
    return selectedDays.values.where((day) => day == true).length;
  }

  int weeklyCheckIns() {
    int weeklyCheckins = 0;

    DateTime weekStartDate = DateUtils.weekStart(DateTime.now());
    for (int i = 0; i < 7; i++) {
      DateTime dateTime = weekStartDate.add(Duration(days: i));
      if (checkIns.contains(dateTime)) {
        weeklyCheckins += 1;
      }
    }
    return weeklyCheckins;
  }

  double weeklyProgress() {
    return weeklyCheckIns() / scheduledCheckIns();
  }

  void addCheckIn(DateTime dateTime) {
    checkIns.add(dateTime);
  }
}
