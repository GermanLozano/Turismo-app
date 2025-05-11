import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    required this.widget,
    required this.height, super.key,
  });

  final Widget widget;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: widget,
      ),
    );
  }
}
