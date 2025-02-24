import 'dart:ui';

import 'package:flutter/widgets.dart';

class ShadDividerTheme {
  const ShadDividerTheme({
    this.merge = true,
    this.verticalMargin,
    this.horizontalMargin,
    this.thickness,
    this.color,
  });

  final bool merge;
  final Color? color;
  final double? thickness;
  final EdgeInsetsGeometry? verticalMargin;
  final EdgeInsetsGeometry? horizontalMargin;

  ShadDividerTheme mergeWith(ShadDividerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      merge: other.merge,
      verticalDividerMargin: other.verticalMargin,
      horizontalDividerMargin: other.horizontalMargin,
      color: other.color,
      thickness: other.thickness,
    );
  }

  ShadDividerTheme copyWith({
    bool? merge,
    Color? color,
    double? thickness,
    EdgeInsetsGeometry? verticalDividerMargin,
    EdgeInsetsGeometry? horizontalDividerMargin,
  }) {
    return ShadDividerTheme(
      merge: merge ?? this.merge,
      color: color ?? this.color,
      verticalMargin: verticalDividerMargin ?? verticalMargin,
      horizontalMargin: horizontalDividerMargin ?? horizontalMargin,
      thickness: thickness ?? this.thickness,
    );
  }

  static ShadDividerTheme lerp(
    ShadDividerTheme a,
    ShadDividerTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDividerTheme(
      merge: b.merge,
      verticalMargin: EdgeInsetsGeometry.lerp(
        a.verticalMargin,
        b.verticalMargin,
        t,
      ),
      horizontalMargin: EdgeInsetsGeometry.lerp(
        a.horizontalMargin,
        b.horizontalMargin,
        t,
      ),
      thickness: lerpDouble(a.thickness, b.thickness, t),
      color: Color.lerp(a.color, b.color, t),
    );
  }
}
