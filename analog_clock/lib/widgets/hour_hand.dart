import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';

/// Total distance traveled by an hour hand, each hour, in radians.
final radiansPerHour = radians(360 / 12);

Widget hourHand(DateTime now) {
  return Hand(
      offset: -0.47,
      scale: 0.29,
      angleRadians:
          (now.hour + (now.minute / 60) + (now.second / 3600)) * radiansPerHour,
      child: Image.asset('assets/hands/strawberry.png'));
}
