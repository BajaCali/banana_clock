import 'package:flutter/material.dart';

// scale of hand borders
final _defaultScale = 0.95;

class Hand extends StatelessWidget {
  final Widget child;
  final double angleRadians;
  final double _scale;
  final double _offset;

  const Hand({
    @required double angleRadians,
    @required Widget child,
    double scale,
    double offset,
  })  : assert(angleRadians != null),
        assert(child != null),
        this.angleRadians = angleRadians,
        this.child = child,
        this._scale = scale,
        this._offset = offset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Transform.rotate(
          angle: angleRadians,
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset(0, (_offset != null) ? _offset : 0),
            child: Transform.scale(
              scale: (_scale != null) ? _scale : _defaultScale,
              alignment: Alignment.center,
              child: Container(
                child: Center(child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
