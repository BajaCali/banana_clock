import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';
import 'package:analog_clock/constans.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerSecond = radians(360 / 60);

Widget secondHand(DateTime now) {
  return Hand(
    angleRadians: (now.second + (now.millisecond / 1000)) * radiansPerSecond,
    child: Image.asset(Hands.second),
    scale: 1.05,
  );
}
