import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF121212);
const Color purpleColor = Color(0xFFFF0266);
const Color purpleColorDesat = Color(0xFFFF7597);
const Color textColor = Colors.white;

TextStyle get kScreenTitleLabel {
	return GoogleFonts.poppins(
		color: textColor,
		fontWeight: FontWeight.w400,
		fontSize: 20.0,
	);
}

TextStyle get kMonthYearLabel {
  return GoogleFonts.poppins(
    color: textColor,
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get kDayLabel {
  return GoogleFonts.poppins(
    color: textColor,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get kDateLabel {
  return GoogleFonts.poppins(
    color: textColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}
