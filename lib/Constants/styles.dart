import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryBlackColor = Color(0xFF121212);
const Color kSecondaryBlackColor = Color(0xFF1A1A1D);
const Color kCardColor = Color(0xFF1F2833);
const Color kGreenColor = Color(0xFF86c232);
const Color textColor = Colors.white;

TextStyle get kScreenTitleLabel {
	return GoogleFonts.poppins(
		color: textColor,
		fontWeight: FontWeight.w600,
		fontSize: 20.0,
	);
}

TextStyle get kMonthYearLabel {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
  );
}

TextStyle get kDayLabel {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get kDayLabelActive {
  return GoogleFonts.poppins(
    color: kPrimaryBlackColor.withOpacity(0.87),
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get kDateLabel {
  return GoogleFonts.poppins(
    color: textColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kDateLabelActive {
  return GoogleFonts.poppins(
    color: kPrimaryBlackColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kHomePageCardTitle {
  return GoogleFonts.roboto(
    color: textColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get kHomePageCardTitleDark {
  return GoogleFonts.roboto(
    color: kPrimaryBlackColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}
