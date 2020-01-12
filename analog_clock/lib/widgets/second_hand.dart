import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerSecond = radians(360 / 60);

Widget secondHand(DateTime now) {
  return Hand(
    angleRadians: (now.second + (now.millisecond / 1000)) * radiansPerSecond,
    child: Image.asset('assets/hands/apple.png'),
    scale: 1.05,
  );
}
