import 'dart:ui';

import 'package:flutter/widgets.dart';

class ShadDividerTheme {
  const ShadDividerTheme({
    this.merge = true,
    this.verticalDividerMargin,
    this.horizontalDividerMargin,
    this.thickness,
    this.color,
  });

  final bool merge;
  final Color? color;
  final double? thickness;
  final EdgeInsetsGeometry? verticalDividerMargin;
  final EdgeInsetsGeometry? horizontalDividerMargin;

  ShadDividerTheme mergeWith(ShadDividerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      merge: other.merge,
      verticalDividerMargin: other.verticalDividerMargin,
      horizontalDividerMargin: other.horizontalDividerMargin,
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
      verticalDividerMargin:
          verticalDividerMargin ?? this.verticalDividerMargin,
      horizontalDividerMargin:
          horizontalDividerMargin ?? this.horizontalDividerMargin,
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
      verticalDividerMargin: EdgeInsetsGeometry.lerp(
        a.verticalDividerMargin,
        b.verticalDividerMargin,
        t,
      ),
      horizontalDividerMargin: EdgeInsetsGeometry.lerp(
        a.horizontalDividerMargin,
        b.horizontalDividerMargin,
        t,
      ),
      thickness: lerpDouble(a.thickness, b.thickness, t),
      color: Color.lerp(a.color, b.color, t),
    );
  }
}
