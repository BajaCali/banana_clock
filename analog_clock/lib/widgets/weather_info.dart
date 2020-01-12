import 'package:flutter/material.dart';
import 'package:analog_clock/constans.dart';

Widget weatherInfo(
    String temperatureRange, String actualTemperature, String actualLocation) {
  temperatureRange = temperatureRange.replaceAll(RegExp(r'(\.\d)|\(|\)'), "");
  actualTemperature = actualTemperature.replaceAll(RegExp(r'\.\d'), "");
  var _textSize = ClockSize.unit * fontScale;
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.fromLTRB(ClockSize.sidePadding, 0, 0, 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              actualTemperature,
              style: fontStyle(_textSize * 2),
            ),
            Text(
              temperatureRange,
              style: fontStyle(_textSize),
            ),
            Text(
              actualLocation,
              style: fontStyle(_textSize),
            ),
          ],
        ),
      ),
    ),
  );
}
