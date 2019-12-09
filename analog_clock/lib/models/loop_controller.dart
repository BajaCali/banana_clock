import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flutter/material.dart';

class LoopController implements FlareController {
  final String _animation;
  final double _loopAmount;
  final double _mix;

  double _duration = 0.0;
  ActorAnimation _actor;

  LoopController(this._animation, this._loopAmount, [this._mix = 1]);

  @override
  void initialize(FlutterActorArtboard artboard) {
    _actor = artboard.getAnimation(_animation);
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    _duration += elapsed;

    if (_duration > _actor.duration) {
      final double loopStart = _actor.duration - _loopAmount;
      final double loopProgress = _duration - _actor.duration;
      _duration = loopStart + loopProgress;
    }
    _actor.apply(_duration, artboard, _mix);
    return true;
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}

  ValueNotifier<bool> isActive = ValueNotifier<bool>(true);
}
