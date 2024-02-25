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

  static ShadPosition? lerp(
    ShadPosition? a,
    ShadPosition? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadPosition(
      top: b?.top,
      left: b?.left,
      right: b?.right,
      bottom: b?.bottom,
    );
  }

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

extension PositionedExt on Widget {
  Widget positionedWith(ShadPosition position) {
    return Positioned(
      top: position.top,
      left: position.left,
      right: position.right,
      bottom: position.bottom,
      child: this,
    );
  }
}
