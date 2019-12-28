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

class Date extends StatelessWidget {
  final DateTime _now;

  Date(this._now);

  @override
  Widget build(BuildContext context) {
    var _textSize = ClockSize.unit * fontScale;
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              months[_now.month - 1] + ' ' + _now.day.toString(),
              style: fontStyle(_textSize),
            ),
            Text(
              days[_now.weekday - 1],
              style: fontStyle(_textSize),
            ),
          ],
        ),
      ),
    );
  }
}
