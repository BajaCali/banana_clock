import 'package:flutter/material.dart';

// scale of hand borders
final size = 0.95;

class Hand extends StatelessWidget {
  final Widget child;
  final double angleRadians;

  const Hand(
      {double size, @required double angleRadians, @required Widget child})
      : assert(angleRadians != null),
        assert(child != null),
        this.angleRadians = angleRadians,
        this.child = child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Transform.rotate(
          angle: angleRadians,
          alignment: Alignment.center,
          child: Transform.scale(
            scale: size,
            alignment: Alignment.center,
            child: Container(
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
