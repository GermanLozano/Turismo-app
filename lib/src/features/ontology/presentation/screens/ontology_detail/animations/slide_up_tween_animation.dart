import 'package:flutter/material.dart';

class SlideUpTween extends StatelessWidget {
  const SlideUpTween({
    required this.child, super.key,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.easeOut,
    this.begin = const Offset(0, 0),
  });

  final Widget child;
  final Duration? duration;
  final Offset? begin;
  final Curve? curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      duration: duration!,
      tween: Tween(begin: begin, end: const Offset(0, 0)),
      curve: curve!,
      builder: (_, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}
