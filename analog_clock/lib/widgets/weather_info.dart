import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _style = GoogleFonts.pacifico(fontSize: 80);
TextStyle _shadow =
    TextStyle(shadows: [Shadow(blurRadius: 1.5, color: Colors.black)]);

class WeatherInfo extends StatelessWidget {
  String _tempRange;
  String _temp;
  String _location;

  WeatherInfo(temperatureRange, actualTemperature, actualLocation) {
    this._tempRange = temperatureRange.replaceAll(RegExp(r'(\.\d)|\(|\)'), "");
    // .replaceAll(' - ', '/');
    this._temp = actualTemperature.replaceAll(RegExp(r'\.\d'), "");
    this._location = actualLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                _temp,
                style: GoogleFonts.pacifico(
                  fontSize: 80,
                  textStyle: _shadow,
                ),
              ),
              Text(
                _tempRange,
                style: GoogleFonts.pacifico(
                  fontSize: 40,
                  textStyle: _shadow,
                ),
              ),
              Text(
                _location,
                style: GoogleFonts.pacifico(
                  fontSize: 40,
                  textStyle: _shadow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
