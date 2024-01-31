import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadCheckboxTheme {
  const ShadCheckboxTheme({
    this.merge = true,
    this.color,
    this.duration,
    this.radius,
    this.decoration,
    this.size,
    this.borderWidth,
    this.padding,
  });

  final bool merge;

  final Color? color;

  final double? size;

  final Duration? duration;

  final BorderRadius? radius;

  final ShadDecorationTheme? decoration;

  final double? borderWidth;
  final EdgeInsets? padding;

  static ShadCheckboxTheme lerp(
    ShadCheckboxTheme a,
    ShadCheckboxTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadCheckboxTheme(
      merge: b.merge,
      color: Color.lerp(a.color, b.color, t),
      duration: b.duration,
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      decoration: ShadDecorationTheme.lerp(a.decoration, b.decoration, t),
      size: lerpDouble(a.size, b.size, t),
      borderWidth: lerpDouble(a.borderWidth, b.borderWidth, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  ShadCheckboxTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    BorderRadius? radius,
    ShadDecorationTheme? decoration,
    double? borderWidth,
    EdgeInsets? padding,
  }) {
    return ShadCheckboxTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      radius: radius ?? this.radius,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
      borderWidth: borderWidth ?? this.borderWidth,
      color: color ?? this.color,
      padding: padding ?? this.padding,
    );
  }

  ShadCheckboxTheme mergeWith(ShadCheckboxTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      duration: other.duration,
      radius: other.radius,
      decoration: other.decoration,
      size: other.size,
      borderWidth: other.borderWidth,
      padding: other.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadCheckboxTheme &&
        other.merge == merge &&
        other.color == color &&
        other.size == size &&
        other.duration == duration &&
        other.radius == radius &&
        other.decoration == decoration &&
        other.borderWidth == borderWidth &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        color.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        radius.hashCode ^
        decoration.hashCode ^
        borderWidth.hashCode ^
        padding.hashCode;
  }
}
