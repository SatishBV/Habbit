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
  // Color habitColor;

  Map<WeekDay, bool> selectedDays = new Map();
  List<int> timeOfDays = [];

  int currentStreak;
  int bestStreak;

  List<DateTime> checkIns;

  Habit() {
    for(WeekDay day in WeekDay.values) {
      selectedDays[day] = false;
    }
  }
}
