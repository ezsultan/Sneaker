import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    // Note : .. = _paint

    final Offset circleCenter = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleCenter, radius, _paint);
  }
}
