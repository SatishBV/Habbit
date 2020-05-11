import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kSecondaryBlackColor = Color(0xFF1A1A1D);

const Color kWhiteColor = Colors.white;
const Color kBlackColor = Color(0xFF121212);
const Color kPapayaColor = Color(0xFFFCA311);
const Color kDarkBlueColor = Color(0xFF14213D);
const Color kGreyColor = Color(0xFFE5E5E5);

const List<Color> availableColors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

OutlineInputBorder get textFieldFocusedBorder {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      const Radius.circular(10.0),
    ),
    borderSide: new BorderSide(
      color: kPapayaColor,
      width: 2.0,
    ),
  );
}

TextStyle get kScreenTitleLabel {
  return GoogleFonts.poppins(
    color: kWhiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
}

TextStyle get kAddHabitPageTitleLabel {
  return GoogleFonts.poppins(
    color: kBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
}

TextStyle get kMonthYearLabel {
  return GoogleFonts.poppins(
    color: kWhiteColor.withOpacity(0.87),
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get kPickerTitleStyle {
  return GoogleFonts.roboto(
      color: kBlackColor.withOpacity(0.87),
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.3);
}

TextStyle get kCaptionStyle {
  return GoogleFonts.poppins(
    color: kDarkBlueColor,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get kTitleStyle {
  return GoogleFonts.poppins(
    color: kDarkBlueColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kHomePageCardTitle {
  return GoogleFonts.roboto(
    color: kBlackColor.withOpacity(0.87),
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kTextFieldPlaceHolderStyle {
  return GoogleFonts.roboto(
    color: kBlackColor.withOpacity(0.50),
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kTextFieldTextStyle {
  return GoogleFonts.roboto(
    color: kBlackColor.withOpacity(0.87),
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}
