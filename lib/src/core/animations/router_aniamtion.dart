import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouterTipeAnimation {
  fade,
  slide,
  scale,
}

CustomTransitionPage<void> routerAniamtion({
  required BuildContext context,
  required Widget page,
  required RouterTipeAnimation tipeAnimation,
}) {
  return CustomTransitionPage(
    child: page,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (tipeAnimation) {
        case RouterTipeAnimation.fade:
          return FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
        case RouterTipeAnimation.slide:
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0), // Desde la derecha
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
        case RouterTipeAnimation.scale:
          return ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          );
      }
    },
  );
}
