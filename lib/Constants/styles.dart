import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color darkBlueColor = Color(0xFF022C43);
const Color mediumBlueColor = Color(0xFF053F5E);
const Color blueColor = Color(0xFF115173);
const Color yellowColor = Color(0xFFFFD700);
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
    color: darkBlueColor.withOpacity(0.87),
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
    color: darkBlueColor.withOpacity(0.87),
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
    color: darkBlueColor.withOpacity(0.87),
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
  );
}
