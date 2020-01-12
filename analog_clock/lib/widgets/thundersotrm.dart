import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:analog_clock/constans.dart';

class Thunderstorm extends StatefulWidget {
  @override
  _ThunderstormState createState() => _ThunderstormState();
}

class _ThunderstormState extends State<Thunderstorm>
    with SingleTickerProviderStateMixin {
  double _left;
  bool _isLightning = false;
  AnimationController _controller;
  Animation _opacity;
  Animation _animation;
  var rand = Random();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    _animation = CurvedAnimation(curve: Curves.easeIn, parent: _controller);
    _opacity = Tween(begin: 1.0, end: 0.0).animate(_animation);
    _animation.addListener(() => setState(() {}));
    _controller.forward(from: 1);
    _left = rand.nextDouble();
    _timer = Timer(
      Duration(milliseconds: 1000 + rand.nextInt(2000)),
      _setLightning,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _setLightning() async {
    _controller.reset();
    _controller.forward();
    setState(() {
      _isLightning = true;
    });
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      _isLightning = false;
    });
    _left = rand.nextDouble();
    _timer = Timer(
      Duration(seconds: 3),
      _setLightning,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: ClockSize.unit * 3 * _left,
          height: ClockSize.height,
          width: ClockSize.width,
          child: _isLightning ? _Lighting() : Container(),
        ),
        Opacity(
          child: Container(
            width: ClockSize.width,
            height: ClockSize.height,
            child: SvgPicture.asset('assets/weather/light.svg'),
          ),
          opacity: _opacity.value,
        ),
      ],
    );
  }
}

class _Lighting extends StatefulWidget {
  @override
  _LightingState createState() => _LightingState();
}

class _LightingState extends State<_Lighting>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _opacity;
  Animation _animation;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
    _animation = CurvedAnimation(curve: Curves.easeInOut, parent: _controller);
    _opacity = Tween(begin: 1.0, end: 0.0).animate(_animation);
    _animation.addListener(() => setState(() {}));
    _timer = Timer(
      Duration(seconds: 2),
      _controller.forward,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: SvgPicture.asset('assets/weather/lightning.svg'),
      opacity: _opacity.value,
    );
  }
}
