import 'package:flutter/material.dart';
import 'package:habbit/add_habit.dart';
import 'home_page.dart';
import 'Constants/styles.dart';

void main() => runApp(Habbit());

class Habbit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habbit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kSecondaryBlackColor,
        scaffoldBackgroundColor: kPrimaryBlackColor,
        accentColor: kGreenColor,
      ),
      home: HomePage(),
      routes: { 
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
