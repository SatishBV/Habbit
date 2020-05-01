import 'dart:ui';
import 'package:habbit/Constants/styles.dart';
import 'package:habbit/Utils/date_util.dart';

enum WeekDay { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

extension WeekDayExtension on WeekDay {
  String get abbrv {
    switch (this) {
      case WeekDay.monday:
        return 'Mon';
      case WeekDay.tuesday:
        return 'Tue';
      case WeekDay.wednesday:
        return 'Wed';
      case WeekDay.thursday:
        return 'Thu';
      case WeekDay.friday:
        return 'Fri';
      case WeekDay.saturday:
        return 'Sat';
      case WeekDay.sunday:
        return 'Sun';
    }

    return '';
  }
}

class Habit {
  String title = '';
  String description = '';
  Color habitColor = kGreenColor;

  Map<WeekDay, bool> selectedDays = new Map();
  List<int> timeOfDays = [];

  int currentStreak;
  int bestStreak;

  List<DateTime> checkIns = [];

  Habit() {
    for(WeekDay day in WeekDay.values) {
      selectedDays[day] = false;
    }
  }

  int scheduledCheckIns() {
    return selectedDays.values.where((day) => day == true).length;
  }

  int weeklyCheckIns() {
    int weeklyCheckins = 0;

    DateTime weekStartDate = DateUtils.weekStart(DateTime.now());
    for(int i = 0; i < 7; i++) {
      DateTime dateTime = weekStartDate.add(Duration(days: i));
      if(checkIns.contains(dateTime)) {
        weeklyCheckins += 1;
      }
    }
    return weeklyCheckins;
  }

  double weeklyProgress() {
    return weeklyCheckIns()/scheduledCheckIns();
  }

  void addCheckIn(DateTime dateTime) {
    checkIns.add(dateTime);
  }
}
