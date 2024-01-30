import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadcnSwitchTheme {
  const ShadcnSwitchTheme({
    this.merge = true,
    this.thumbColor,
    this.trackColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.margin,
    this.duration,
    this.radius,
    this.decoration,
  });

  final bool merge;
  final Color? thumbColor;

  final Color? trackColor;

  final Color? uncheckedTrackColor;

  final Color? checkedTrackColor;

  final double? width;

  final double? margin;

  final Duration? duration;

  final BorderRadius? radius;

  final ShadcnDecorationTheme? decoration;

  static ShadcnSwitchTheme lerp(
    ShadcnSwitchTheme a,
    ShadcnSwitchTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnSwitchTheme(
      merge: b.merge,
      thumbColor: Color.lerp(a.thumbColor, b.thumbColor, t),
      trackColor: Color.lerp(a.trackColor, b.trackColor, t),
      uncheckedTrackColor:
          Color.lerp(a.uncheckedTrackColor, b.uncheckedTrackColor, t),
      checkedTrackColor:
          Color.lerp(a.checkedTrackColor, b.checkedTrackColor, t),
      width: lerpDouble(a.width, b.width, t),
      margin: lerpDouble(a.margin, b.margin, t),
      duration: b.duration,
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      decoration: ShadcnDecorationTheme.lerp(a.decoration, b.decoration, t),
    );
  }

  ShadcnSwitchTheme copyWith({
    bool? merge,
    Color? thumbColor,
    Color? trackColor,
    Color? uncheckedTrackColor,
    Color? checkedTrackColor,
    double? width,
    double? margin,
    Duration? duration,
    BorderRadius? radius,
    ShadcnDecorationTheme? decoration,
  }) {
    return ShadcnSwitchTheme(
      merge: merge ?? this.merge,
      thumbColor: thumbColor ?? this.thumbColor,
      trackColor: trackColor ?? this.trackColor,
      uncheckedTrackColor: uncheckedTrackColor ?? this.uncheckedTrackColor,
      checkedTrackColor: checkedTrackColor ?? this.checkedTrackColor,
      width: width ?? this.width,
      margin: margin ?? this.margin,
      duration: duration ?? this.duration,
      radius: radius ?? this.radius,
      decoration: decoration ?? this.decoration,
    );
  }

  ShadcnSwitchTheme mergeWith(ShadcnSwitchTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      thumbColor: other.thumbColor,
      trackColor: other.trackColor,
      uncheckedTrackColor: other.uncheckedTrackColor,
      checkedTrackColor: other.checkedTrackColor,
      width: other.width,
      margin: other.margin,
      duration: other.duration,
      radius: other.radius,
      decoration: other.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnSwitchTheme &&
        other.merge == merge &&
        other.thumbColor == thumbColor &&
        other.trackColor == trackColor &&
        other.uncheckedTrackColor == uncheckedTrackColor &&
        other.checkedTrackColor == checkedTrackColor &&
        other.width == width &&
        other.margin == margin &&
        other.duration == duration &&
        other.radius == radius &&
        other.decoration == decoration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        thumbColor.hashCode ^
        trackColor.hashCode ^
        uncheckedTrackColor.hashCode ^
        checkedTrackColor.hashCode ^
        width.hashCode ^
        margin.hashCode ^
        duration.hashCode ^
        radius.hashCode ^
        decoration.hashCode;
  }
}
