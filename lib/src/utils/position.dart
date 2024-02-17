import 'package:flutter/widgets.dart';

@immutable
class ShadPosition {
  const ShadPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadPosition &&
        other.top == top &&
        other.left == left &&
        other.right == right &&
        other.bottom == bottom;
  }

  @override
  int get hashCode => Object.hashAll([top, left, right, bottom]);
}
