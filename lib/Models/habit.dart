import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Utils/activity_icon_util.dart';
import 'package:habbit/Utils/color_util.dart';
import 'package:habbit/Utils/date_util.dart';
import 'package:intl/intl.dart';
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
    this.habitColor = getColorFrom(document.data["color"]);
    this.icon = activityFrom(document.data["icon"]);
    _setSelectedDaysFrom(document);

    this.checkIns = [];
    if (document.data['checkIns'] != null) {
      this.checkIns = document.data['checkIns'].map<DateTime>((item) {
        Timestamp t = item;
        return t.toDate();
      }).toList();
    }
  }

  Map<String, dynamic> toDocument() {

    List<Timestamp> timeStamps = [];

    this.checkIns.forEach((element) {
      timeStamps.add(Timestamp.fromDate(element));
    });

    return {
      "title": this.title,
      "description": this.description,
      "icon": stringFrom(this.icon),
      "color": colorString(this.habitColor),
      "selectedDays": {
        "monday": this.selectedDays[WeekDay.monday],
        "tuesday": this.selectedDays[WeekDay.tuesday],
        "wednesday": this.selectedDays[WeekDay.wednesday],
        "thursday": this.selectedDays[WeekDay.thursday],
        "friday": this.selectedDays[WeekDay.friday],
        "saturday": this.selectedDays[WeekDay.saturday],
        "sunday": this.selectedDays[WeekDay.sunday],
      },
      "checkIns": timeStamps
    };
  }

  void _setSelectedDaysFrom(DocumentSnapshot document) {
    this.selectedDays[WeekDay.monday] = document.data["selectedDays"]["monday"];
    this.selectedDays[WeekDay.tuesday] =
        document.data["selectedDays"]["tuesday"];
    this.selectedDays[WeekDay.wednesday] =
        document.data["selectedDays"]["wednesday"];
    this.selectedDays[WeekDay.thursday] =
        document.data["selectedDays"]["thursday"];
    this.selectedDays[WeekDay.friday] = document.data["selectedDays"]["friday"];
    this.selectedDays[WeekDay.saturday] =
        document.data["selectedDays"]["saturday"];
    this.selectedDays[WeekDay.sunday] = document.data["selectedDays"]["sunday"];
  }

  int scheduledCheckIns() {
    return selectedDays.values.where((day) => day == true).length;
  }

  int weeklyCheckIns() {
    int weeklyCheckins = 0;

    DateTime weekStartDate = DateUtils.weekStart(DateTime.now());

    List<String> formattedCheckIns = [];
    for (DateTime checkIn in checkIns) {
      String formattedCheckIn = DateFormat('MM/dd/y').format(checkIn);
      formattedCheckIns.add(formattedCheckIn);
    }

    for (int i = 0; i < 7; i++) {
      DateTime dateTime = weekStartDate.add(Duration(days: i));
      String formattedDate = DateFormat('MM/dd/y').format(dateTime);

      if (formattedCheckIns.contains(formattedDate)) {
        weeklyCheckins += 1;
      }
    }
    return weeklyCheckins;
  }

  double weeklyProgress() {
    return weeklyCheckIns() / scheduledCheckIns();
  }

  void addCheckIn(DateTime dateTime) {
    for (DateTime checkIn in checkIns) {
      if (DateUtils.dateOnly(checkIn) == DateUtils.dateOnly(dateTime)) {
        return;
      }
    }
    checkIns.add(dateTime);
  }

  void removeCheckIn(DateTime dateTime) {
    List<DateTime> elementToBeRemoved = [];
    checkIns.forEach((element) {
      if (DateUtils.dateOnly(dateTime) == DateUtils.dateOnly(element)) {
        elementToBeRemoved.add(element);
      }
    });

    elementToBeRemoved.forEach((element) {
      checkIns.remove(element);
    });
  }
}
