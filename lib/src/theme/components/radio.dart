import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadRadioTheme {
  const ShadRadioTheme({
    this.merge = true,
    this.color,
    this.duration,
    this.decoration,
    this.size,
    this.borderWidth,
    this.padding,
  });

  final bool merge;

  final Color? color;

  final double? size;

  final Duration? duration;

  final ShadDecoration? decoration;

  final double? borderWidth;
  final EdgeInsets? padding;

  static ShadRadioTheme lerp(
    ShadRadioTheme a,
    ShadRadioTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadRadioTheme(
      merge: b.merge,
      color: Color.lerp(a.color, b.color, t),
      duration: b.duration,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      size: lerpDouble(a.size, b.size, t),
      borderWidth: lerpDouble(a.borderWidth, b.borderWidth, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  ShadRadioTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    double? borderWidth,
    EdgeInsets? padding,
  }) {
    return ShadRadioTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
      borderWidth: borderWidth ?? this.borderWidth,
      color: color ?? this.color,
      padding: padding ?? this.padding,
    );
  }

  ShadRadioTheme mergeWith(ShadRadioTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      duration: other.duration,
      decoration: other.decoration,
      size: other.size,
      borderWidth: other.borderWidth,
      padding: other.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadRadioTheme &&
        other.merge == merge &&
        other.color == color &&
        other.size == size &&
        other.duration == duration &&
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
        decoration.hashCode ^
        borderWidth.hashCode ^
        padding.hashCode;
  }
}
