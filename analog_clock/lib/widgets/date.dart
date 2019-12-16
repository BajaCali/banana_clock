import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _style = GoogleFonts.pacifico(fontSize: 80);

List days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
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
  'December'
];

class Date extends StatelessWidget {
  DateTime _now;

  Date(this._now);

  @override
  Widget build(BuildContext context) {
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
              style: _style,
            ),
            Text(
              days[_now.weekday - 1],
              style: _style,
            ),
          ],
        ),
      ),
    );
  }
}
