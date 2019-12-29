import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hands {
  static const String second = 'assets/hands/apple.png';
  static const String minute = 'assets/hands/banana.png';
  static const String hour = 'assets/hands/strawberry.png';
}

const _fontWeight = FontWeight.w300;
const fontScale = 0.2;
Color fontColor;

TextStyle fontStyle(double size) {
  return GoogleFonts.montserrat(
    fontSize: size,
    textStyle: TextStyle(
      color: fontColor,
    ),
    fontWeight: _fontWeight,
  );
}

class ClockSize {
  static double unit;
  static double get width => 5 * unit;
  static double get height => 3 * unit;
}
