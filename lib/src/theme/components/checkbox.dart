import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadCheckboxTheme {
  const ShadCheckboxTheme({
    this.merge = true,
    this.color,
    this.duration,
    this.decoration,
    this.size,
    this.padding,
  });

  final bool merge;

  final Color? color;

  final double? size;

  final Duration? duration;

  final ShadDecoration? decoration;

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
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      size: lerpDouble(a.size, b.size, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  ShadCheckboxTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsets? padding,
  }) {
    return ShadCheckboxTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
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
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      size: other.size,
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
        other.decoration == decoration &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        color.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        decoration.hashCode ^
        padding.hashCode;
  }
}
