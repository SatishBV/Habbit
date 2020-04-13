import 'package:flutter/material.dart';
import 'home_page.dart';
import 'Constants/styles.dart';

void main() => runApp(Habbit());

class Habbit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habbit',
      theme: ThemeData(
        primaryColor: primaryColor,
		scaffoldBackgroundColor: primaryColor,
		accentColor: purpleColor
      ),
      home: HomePage(title: 'Home'),
    );
  }
}
