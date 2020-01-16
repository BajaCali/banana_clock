// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_clock_helper/model.dart';

import 'package:analog_clock/constans.dart';
import 'package:analog_clock/widgets/weather.dart';
import 'package:analog_clock/widgets/date.dart';
import 'package:analog_clock/widgets/weather_info.dart';
import 'package:analog_clock/widgets/second_hand.dart';
import 'package:analog_clock/widgets/minute_hand.dart';
import 'package:analog_clock/widgets/hour_hand.dart';
import 'package:analog_clock/widgets/thundersotrm.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock(this.model);

  final ClockModel model;

  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  var _now = DateTime.now();
  var _temperature = '';
  var _temperatureRange = '';
  var _condition = '';
  var _location = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(AnalogClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperatureString;
      _temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
      _condition = widget.model.weatherString;
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per 10 milliseconds. Make sure to do it at the beginning
      //  of each new 10th millisecond, so that the clock is accurate.
      _timer = Timer(
        Duration(milliseconds: 10),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // There are many ways to apply themes to your clock. Some are:
    //  - Inherit the parent Theme (see ClockCustomizer in the
    //    flutter_clock_helper package).
    //  - Override the Theme.of(context).colorScheme.
    //  - Create your own [ThemeData], demonstrated in [AnalogClock].
    //  - Create a map of [Color]s to custom keys, demonstrated in
    //    [DigitalClock].
    final customTheme = Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).copyWith(
            // Overlay color for dark theme.
            highlightColor: Color(0x00000000),
            backgroundColor: Color(0xFFD2E3FC),
          )
        : Theme.of(context).copyWith(
            highlightColor: Color(0x80000000),
            backgroundColor: Color(0xFF125e96),
          );

    fontColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Color(0xFFBBBBBB);

    final time = DateFormat.Hms().format(DateTime.now());

    // Calculate one "unit" for scaling. It uses knowlange
    // of aspect ration, which is 5/3.
    var _size = MediaQuery.of(context).size;
    ClockSize.unit = ((_size.width / _size.height > 5 / 3))
        ? _size.height / 3
        : _size.width / 5;

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Analog clock with time $time',
        value: time,
      ),
      child: AnimatedContainer(
        color: customTheme.backgroundColor,
        child: Stack(
          children: [
            Weather(_condition),
            date(_now),
            weatherInfo(_temperatureRange, _temperature, _location),
            secondHand(_now),
            minuteHand(_now),
            hourHand(_now),
            _condition == 'thunderstorm' ? Thunderstorm() : Container(),
            _darkMode(customTheme.highlightColor),
          ],
        ),
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  Widget _darkMode(Color color) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 0, color: color),
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}
