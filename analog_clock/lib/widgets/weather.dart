import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'package:analog_clock/models/loop_controller.dart';

class Weather extends StatefulWidget {
  final String condition;

  const Weather({Key key, @required condition})
      : this.condition = condition,
        super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlareActor(
        'assets/weather/rainy.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        controller: LoopController('go', 5),
      ),
    );
  }
}
