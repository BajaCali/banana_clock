import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  String condition;

  Weather(this.condition);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlareActor(
        'assets/weather/$condition.flr',
        animation: 'go',
      ),
    );
  }
}
