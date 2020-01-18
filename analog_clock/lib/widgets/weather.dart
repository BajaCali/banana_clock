import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'package:analog_clock/constans.dart';

class Weather extends StatefulWidget {
  final String condition;

  Weather(this.condition);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _actual = '';
  String _a = '';
  String _b = 'sunny';

  bool _isAOn = false;

  @override
  Widget build(BuildContext context) {
    if (_actual != widget.condition) {
      _isAOn = !_isAOn;
      _actual = widget.condition;
      _a = _isAOn ? _actual : _a;
      _b = !_isAOn ? _actual : _b;
    }

    return AnimatedCrossFade(
      firstChild: _animation(_a),
      secondChild: _animation(_b),
      duration: Duration(seconds: 2),
      crossFadeState:
          _isAOn ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
        return Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              key: bottomChildKey,
              top: 0,
              left: 0,
              child: bottomChild,
            ),
            Positioned(
              key: topChildKey,
              top: 0,
              left: 0,
              child: topChild,
            )
          ],
        );
      },
    );
  }

  Widget _animation(String animationName) {
    return SizedBox(
      width: ClockSize.width,
      height: ClockSize.height,
      child: FlareActor(
        'assets/weather/$animationName.flr',
        animation: 'go',
      ),
    );
  }
}
