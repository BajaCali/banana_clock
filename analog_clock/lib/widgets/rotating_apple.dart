import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatingApple extends StatefulWidget {
  @override
  State createState() => _RotatingAppleState();
}

class _RotatingAppleState extends State<RotatingApple> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlareActor(
        'assets/hands/apple.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'go',
      ),
    );
  }
}
