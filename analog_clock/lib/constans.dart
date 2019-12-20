import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hands {
  static const String minute = 'assets/hands/banana.png';
  static const String hour = 'assets/hands/strawberry.png';
}

const _fontWeight = FontWeight.w300;
const fontScale = 2;

TextStyle fontStyle(double size) {
  return GoogleFonts.montserrat(
    fontSize: size,
    textStyle: TextStyle(
      shadows: [
        Shadow(blurRadius: 1.5, color: Colors.black),
      ],
    ),
    fontWeight: _fontWeight,
  );
}
