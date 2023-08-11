import 'package:flutter/material.dart';
import 'package:github_issue_tracker/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

Widget titleText(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        fontWeight: FontWeight.w600, fontSize: 17, color: textColor),
  );
}

Widget subTitleText(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        fontWeight: FontWeight.w100, fontSize: 15, color: textColor),
  );
}

Widget dateText(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        fontWeight: FontWeight.w200, fontSize: 15, color: textColor),
  );
}
