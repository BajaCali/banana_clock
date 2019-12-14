import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';
import 'package:analog_clock/strings.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerTick = radians(360 / 60);

Widget MinuteHand(DateTime now) {
  return Hand(
    angleRadians: now.minute * radiansPerTick,
    child: Image.asset(hands.minute),
  );
}
