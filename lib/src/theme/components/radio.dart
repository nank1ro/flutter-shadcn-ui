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
    this.padding,
    this.circleSize,
  });

  final bool merge;

  final Color? color;

  final double? size;

  final Duration? duration;

  final ShadDecoration? decoration;

  final EdgeInsets? padding;

  final double? circleSize;

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
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      circleSize: lerpDouble(a.circleSize, b.circleSize, t),
    );
  }

  ShadRadioTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    double? circleSize,
  }) {
    return ShadRadioTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
      color: color ?? this.color,
      padding: padding ?? this.padding,
      circleSize: circleSize ?? this.circleSize,
    );
  }

  ShadRadioTheme mergeWith(ShadRadioTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      duration: other.duration,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      size: other.size,
      padding: other.padding,
      circleSize: other.circleSize,
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
        other.padding == padding &&
        other.circleSize == circleSize;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        color.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        circleSize.hashCode;
  }
}
