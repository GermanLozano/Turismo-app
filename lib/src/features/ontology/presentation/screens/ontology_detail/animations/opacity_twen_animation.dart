import 'package:flutter/material.dart';

class OpacityTween extends StatelessWidget {
  const OpacityTween({
    required this.child, super.key,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.easeInToLinear,
    this.begin = 0.0,
  });

  final Widget child;
  final Duration? duration;
  final Curve? curve;
  final double? begin;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration!,
      tween: Tween(begin: begin, end: 1),
      curve: curve!,
      builder: (_, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: child,
    );
  }
}
