import 'package:analog_clock/constans.dart';
import 'package:flutter/material.dart';

// Default scale of hand widget.
const _defaultScale = 1.0;

class Hand extends StatelessWidget {
  final Widget _child;
  final double _angleRadians;
  final double _scale;
  final double _offset;

  const Hand({
    @required double angleRadians,
    @required Widget child,
    double scale = _defaultScale,
    double offset = 0,
  })  : assert(angleRadians != null),
        assert(child != null),
        assert(offset >= -1 && offset <= 1),
        assert(scale > 0),
        this._angleRadians = angleRadians,
        this._child = child,
        this._scale = scale,
        this._offset = offset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: Transform.rotate(
          angle: _angleRadians,
          alignment: Alignment.center,
          child: Transform.translate(
            offset: Offset(0, _offset * unit * 3 / 2),
            child: Transform.scale(
              scale: (_scale != null) ? _scale : _defaultScale,
              alignment: Alignment.center,
              child: Container(
                child: Center(child: _child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
