import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryBlackColor = Color(0xFF121212);
const Color kSecondaryBlackColor = Color(0xFF1A1A1D);
const Color kCardColor = Color(0xFF1F2833);
const Color kGreenColor = Color(0xFF86c232);
const Color textColor = Colors.white;

const Color kYellowColor = Color(0xFFfaed26);
const Color kBlueColor = Color(0xFF31708e);
const Color kPinkColor = Color(0xFFe64398);
const Color kOrangeColor = Color(0xFFf79e02);
const Color kCyanColor = Color(0xFFd2fdff);
const Color kRedColor = Color(0xFFc3073f);

TextStyle get kScreenTitleLabel {
	return GoogleFonts.poppins(
		color: textColor,
		fontWeight: FontWeight.w600,
		fontSize: 20.0,
	);
}

TextStyle get kAddHabitPageTitleLabel {
	return GoogleFonts.poppins(
		color: textColor.withOpacity(0.87),
		fontWeight: FontWeight.w700,
		fontSize: 30.0,
		height: 1.4,
		letterSpacing: 1.5,
	);
}

TextStyle get kMonthYearLabel {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get kPickerTitleStyle {
  return GoogleFonts.roboto(
    color: textColor.withOpacity(0.87),
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.3
  );
}

TextStyle get kCaptionStyle {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get kTitleStyle {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kHomePageCardTitle {
  return GoogleFonts.roboto(
    color: textColor.withOpacity(0.87),
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kTextFieldPlaceHolderStyle {
  return GoogleFonts.roboto(
    color: textColor.withOpacity(0.50),
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kTextFieldTextStyle {
  return GoogleFonts.roboto(
    color: textColor.withOpacity(0.87),
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}
