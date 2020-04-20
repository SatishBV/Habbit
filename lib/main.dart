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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kSecondaryBlackColor,
        accentColor: kGreenColor,
        scaffoldBackgroundColor: kPrimaryBlackColor,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: textColor,
            ),
          ),
          labelStyle: kTextFieldPlaceHolderStyle,
          helperStyle: kTextFieldPlaceHolderStyle,
          contentPadding: EdgeInsets.only(bottom: 0.0),
        ),
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
