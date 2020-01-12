import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color fontColor;

TextStyle fontStyle(double size) {
  return GoogleFonts.montserrat(
    fontSize: size,
    textStyle: TextStyle(
      color: fontColor,
      shadows: [
        Shadow(
          blurRadius: 1.5,
        ),
      ],
    ),
    fontWeight: FontWeight.w300,
  );
}

class ClockSize {
  static double unit;
  static double get width => 5 * unit;
  static double get height => 3 * unit;
  static double get sidePadding => 0.05 * unit;
  static double get textSize => 0.2 * unit;
}
