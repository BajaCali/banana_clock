import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import 'package:analog_clock/models/hand.dart';
import 'package:analog_clock/constans.dart';

/// Total distance traveled by a second or a minute hand, each second or minute,
/// respectively.
final radiansPerTick = radians(360 / 60);

Widget minuteHand(DateTime now) {
  return Hand(
    offset: -0.32,
    scale: 0.59,
    angleRadians: (now.minute + (now.second / 60) + (now.millisecond / 60000)) *
        radiansPerTick,
    child: Image.asset(Hands.minute),
  );
}
