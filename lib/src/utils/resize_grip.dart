// shad_resize_grip_painter.dart

import 'package:flutter/material.dart';

class ShadResizeGripPainter extends CustomPainter {
  const ShadResizeGripPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = .8;

    const spacing = 4.0;
    for (var i = 0; i < 3; i++) {
      final offset = spacing * i;
      canvas.drawLine(
        Offset(size.width - offset, size.height),
        Offset(size.width, size.height - offset),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ShadResizeGripPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
