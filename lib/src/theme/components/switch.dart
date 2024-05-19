import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadSwitchTheme {
  const ShadSwitchTheme({
    this.merge = true,
    this.thumbColor,
    this.trackColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.height,
    this.margin,
    this.duration,
    this.decoration,
    this.padding,
  });

  final bool merge;

  final Color? thumbColor;

  final Color? trackColor;

  final Color? uncheckedTrackColor;

  final Color? checkedTrackColor;

  final double? width;

  final double? height;

  final double? margin;

  final Duration? duration;

  final ShadDecoration? decoration;

  final EdgeInsets? padding;

  static ShadSwitchTheme lerp(
    ShadSwitchTheme a,
    ShadSwitchTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSwitchTheme(
      merge: b.merge,
      thumbColor: Color.lerp(a.thumbColor, b.thumbColor, t),
      trackColor: Color.lerp(a.trackColor, b.trackColor, t),
      uncheckedTrackColor:
          Color.lerp(a.uncheckedTrackColor, b.uncheckedTrackColor, t),
      checkedTrackColor:
          Color.lerp(a.checkedTrackColor, b.checkedTrackColor, t),
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      margin: lerpDouble(a.margin, b.margin, t),
      duration: b.duration,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  ShadSwitchTheme copyWith({
    bool? merge,
    Color? thumbColor,
    Color? trackColor,
    Color? uncheckedTrackColor,
    Color? checkedTrackColor,
    double? width,
    double? height,
    double? margin,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsets? padding,
  }) {
    return ShadSwitchTheme(
      merge: merge ?? this.merge,
      thumbColor: thumbColor ?? this.thumbColor,
      trackColor: trackColor ?? this.trackColor,
      uncheckedTrackColor: uncheckedTrackColor ?? this.uncheckedTrackColor,
      checkedTrackColor: checkedTrackColor ?? this.checkedTrackColor,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
    );
  }

  ShadSwitchTheme mergeWith(ShadSwitchTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      thumbColor: other.thumbColor,
      trackColor: other.trackColor,
      uncheckedTrackColor: other.uncheckedTrackColor,
      checkedTrackColor: other.checkedTrackColor,
      width: other.width,
      height: other.height,
      margin: other.margin,
      duration: other.duration,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      padding: other.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSwitchTheme &&
        other.merge == merge &&
        other.thumbColor == thumbColor &&
        other.trackColor == trackColor &&
        other.uncheckedTrackColor == uncheckedTrackColor &&
        other.checkedTrackColor == checkedTrackColor &&
        other.width == width &&
        other.height == height &&
        other.margin == margin &&
        other.duration == duration &&
        other.decoration == decoration &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        thumbColor.hashCode ^
        trackColor.hashCode ^
        uncheckedTrackColor.hashCode ^
        checkedTrackColor.hashCode ^
        width.hashCode ^
        height.hashCode ^
        margin.hashCode ^
        duration.hashCode ^
        decoration.hashCode ^
        padding.hashCode;
  }
}
