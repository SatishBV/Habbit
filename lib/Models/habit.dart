
import 'package:flutter/material.dart';

class Habit {
	String title;
	String description;
	// Color habitColor;

	List<int> days;
	List<int> timeOfDays;

	int currentStreak;
	int bestStreak;

	List<DateTime> checkIns;

	Habit({@required this.title});
}