import 'dart:ui';

import 'package:flutter/widgets.dart';

@immutable
class ShadProgressTheme {
  const ShadProgressTheme({
    this.merge = true,
    this.backgroundColor,
    this.color,
    this.borderRadius,
    this.innerBorderRadius,
    this.minHeight,
  });

  final bool merge;
  final Color? backgroundColor;
  final Color? color;
  final BorderRadius? borderRadius;
  final BorderRadius? innerBorderRadius;
  final double? minHeight;

  static ShadProgressTheme lerp(
    ShadProgressTheme a,
    ShadProgressTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadProgressTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      color: Color.lerp(a.color, b.color, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      innerBorderRadius:
          BorderRadius.lerp(a.innerBorderRadius, b.innerBorderRadius, t),
      minHeight: lerpDouble(a.minHeight, b.minHeight, t),
    );
  }

  ShadProgressTheme copyWith({
    bool? merge,
    Color? backgroundColor,
    Color? color,
    BorderRadius? borderRadius,
    BorderRadius? innerBorderRadius,
    double? minHeight,
  }) {
    return ShadProgressTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
      borderRadius: borderRadius ?? this.borderRadius,
      innerBorderRadius: innerBorderRadius ?? this.innerBorderRadius,
      minHeight: minHeight ?? this.minHeight,
    );
  }

  ShadProgressTheme mergeWith(ShadProgressTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      color: other.color,
      borderRadius: other.borderRadius,
      innerBorderRadius: other.innerBorderRadius,
      minHeight: other.minHeight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadProgressTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.color == color &&
        other.borderRadius == borderRadius &&
        other.innerBorderRadius == innerBorderRadius &&
        other.minHeight == minHeight;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        backgroundColor.hashCode ^
        color.hashCode ^
        borderRadius.hashCode ^
        innerBorderRadius.hashCode ^
        minHeight.hashCode;
  }
}
