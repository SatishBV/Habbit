import 'package:flutter/material.dart';
import 'home_page.dart';
import 'welcome_screen.dart';
import 'Constants/styles.dart';

void main() => runApp(Habbit());

class Habbit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Habbit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: kDarkBlueColor,
          accentColor: kPapayaColor,
          scaffoldBackgroundColor: kWhiteColor,
          inputDecorationTheme: InputDecorationTheme(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            labelStyle: kTextFieldTextStyle.copyWith(
              fontSize: 15.0,
            ),
            contentPadding: EdgeInsets.only(left: 8.0, bottom: 0.0),
          ),
        ),
        home: WelcomeScreen(),
        routes: {
          HomePage.id: (context) => HomePage(),
        },
      ),
    );
  }
}
