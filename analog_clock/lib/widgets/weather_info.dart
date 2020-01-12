import 'package:flutter/material.dart';
import 'package:analog_clock/constans.dart';

Widget weatherInfo(
    String temperatureRange, String actualTemperature, String actualLocation) {
  temperatureRange = temperatureRange.replaceAll(RegExp(r'(\.\d)|\(|\)'), "");
  actualTemperature = actualTemperature.replaceAll(RegExp(r'\.\d'), "");

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
              style: fontStyle(ClockSize.textSize * 2),
            ),
            Text(
              temperatureRange,
              style: fontStyle(ClockSize.textSize),
            ),
            Text(
              actualLocation,
              style: fontStyle(ClockSize.textSize),
            ),
          ],
        ),
      ),
    ),
  );
}
