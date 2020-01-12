import 'package:flutter/material.dart';
import 'package:analog_clock/constans.dart';

List days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

List months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'Septemer',
  'October',
  'November',
  'December',
];

Widget date(DateTime now) {
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, ClockSize.sidePadding, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            months[now.month - 1] + ' ' + now.day.toString(),
            style: fontStyle(ClockSize.textSize),
          ),
          Text(
            days[now.weekday - 1],
            style: fontStyle(ClockSize.textSize),
          ),
        ],
      ),
    ),
  );
}
