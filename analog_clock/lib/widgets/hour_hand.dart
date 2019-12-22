import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';
import 'package:analog_clock/constans.dart';

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

Widget HourHand(DateTime now) {
  return Hand(
      offset: -0.45,
      scale: 0.27,
      angleRadians:
          now.hour * radiansPerHour + (now.minute / 60) * radiansPerHour,
      child: Image.asset(Hands.hour));
}
