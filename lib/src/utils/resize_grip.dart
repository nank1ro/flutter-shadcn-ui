// resize_grip.dart

import 'package:flutter/material.dart';

/// A customizable painter for drawing diagonal resize grip lines,
/// typically used in the bottom-right corner of a resizable widget.
class ShadResizeGripPainter extends CustomPainter {
  /// Creates a painter that draws multiple diagonal lines to represent a resize grip.
  ///
  /// - [color]: The color of the lines.
  /// - [strokeWidth]: Thickness of each grip line. Default is 0.8.
  /// - [lineCount]: Number of diagonal lines to draw. Default is 3.
  /// - [spacing]: Spacing between each line. Default is 4.0.
  const ShadResizeGripPainter({
    required this.color,
    this.strokeWidth = 0.8,
    this.lineCount = 3,
    this.spacing = 4.0,
  });

  /// The color of the grip lines.
  final Color color;

  /// The thickness of the lines.
  final double strokeWidth;

  /// The number of diagonal lines in the grip.
  final int lineCount;

  /// The spacing between each grip line.
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;

    for (var i = 0; i < lineCount; i++) {
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
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.lineCount != lineCount ||
        oldDelegate.spacing != spacing;
  }
}
