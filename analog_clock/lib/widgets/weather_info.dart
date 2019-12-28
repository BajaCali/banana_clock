import 'package:flutter/material.dart';
import 'package:analog_clock/constans.dart';

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
    var _textSize = ClockSize.unit * fontScale;
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
                style: fontStyle(_textSize * 2),
              ),
              Text(
                _tempRange,
                style: fontStyle(_textSize),
              ),
              Text(
                _location,
                style: fontStyle(_textSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _textSize {}
