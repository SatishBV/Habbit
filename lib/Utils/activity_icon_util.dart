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

String stringFrom(ActivityIcon icon) {
  switch (icon) {
    case ActivityIcon.breakfast:
      return 'breakfast';
      break;
    case ActivityIcon.calendar:
      return 'calendar';
      break;
    case ActivityIcon.code:
      return 'code';
      break;
    case ActivityIcon.exercise:
      return 'exercise';
      break;
    case ActivityIcon.finance:
      return 'finance';
      break;
    case ActivityIcon.fruit:
      return 'fruit';
      break;
    case ActivityIcon.journal:
      return 'journal';
      break;
    case ActivityIcon.language:
      return 'language';
      break;
    case ActivityIcon.meditation:
      return 'meditation';
      break;
    case ActivityIcon.photography:
      return 'photography';
      break;
    case ActivityIcon.pushups:
      return 'pushups';
      break;
    case ActivityIcon.read:
      return 'read';
      break;
    case ActivityIcon.run:
      return 'run';
      break;
    case ActivityIcon.shower:
      return 'shower';
      break;
    case ActivityIcon.sleep:
      return 'sleep';
      break;
    case ActivityIcon.steps:
      return 'steps';
      break;
    case ActivityIcon.study:
      return 'study';
      break;
    case ActivityIcon.yoga:
      return 'yoga';
      break;
    case ActivityIcon.none:
      return 'none';
      break;
  }
}
