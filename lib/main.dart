import 'package:flutter/material.dart';
import 'home_page.dart';
import 'welcome_screen.dart';
import 'Constants/styles.dart';

void main() => runApp(Habbit());

class Habbit extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habbit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kSecondaryBlackColor,
        accentColor: kGreenColor,
        scaffoldBackgroundColor: kPrimaryBlackColor,
        inputDecorationTheme: InputDecorationTheme(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          labelStyle: kTextFieldTextStyle.copyWith(color: textColor.withOpacity(0.50), fontSize: 15.0),
          contentPadding: EdgeInsets.only(left: 8.0, bottom: 0.0),
        ),
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
