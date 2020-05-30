import 'package:habbit/Constants/activity_icons.dart';

ActivityIcon activityFrom(String string) {
  switch (string) {
    case 'breakfast':
      return ActivityIcon.breakfast;
    case 'calendar':
      return ActivityIcon.calendar;
    case 'code':
      return ActivityIcon.code;
    case 'exercise':
      return ActivityIcon.exercise;
    case 'finance':
      return ActivityIcon.finance;
    case 'fruit':
      return ActivityIcon.fruit;
    case 'journal':
      return ActivityIcon.journal;
    case 'language':
      return ActivityIcon.language;
    case 'meditation':
      return ActivityIcon.meditation;
    case 'photography':
      return ActivityIcon.photography;
    case 'pushups':
      return ActivityIcon.pushups;
    case 'read':
      return ActivityIcon.read;
    case 'run':
      return ActivityIcon.run;
    case 'shower':
      return ActivityIcon.shower;
    case 'sleep':
      return ActivityIcon.sleep;
    case 'steps':
      return ActivityIcon.steps;
    case 'study':
      return ActivityIcon.study;
    case 'yoga':
      return ActivityIcon.yoga;
    default:
      return ActivityIcon.none;
  }
}
