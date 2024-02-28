import 'package:flutter/widgets.dart';

@immutable
class ShadSliderTheme {
  const ShadSliderTheme({
    this.merge = true,
    this.min,
    this.max,
    this.mouseCursor,
    this.disabledMouseCursor,
    this.thumbColor,
    this.disabledThumbColor,
    this.thumbBorderColor,
    this.disabledThumbBorderColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.trackHeight,
    this.thumbRadius,
  });

  final bool merge;
  final double? min;
  final double? max;
  final MouseCursor? mouseCursor;
  final MouseCursor? disabledMouseCursor;
  final Color? thumbColor;
  final Color? disabledThumbColor;
  final Color? thumbBorderColor;
  final Color? disabledThumbBorderColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? disabledActiveTrackColor;
  final Color? disabledInactiveTrackColor;
  final double? trackHeight;
  final double? thumbRadius;

  static ShadSliderTheme lerp(
    ShadSliderTheme a,
    ShadSliderTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSliderTheme(
      merge: b.merge,
      min: b.min,
      max: b.max,
      mouseCursor: b.mouseCursor,
      disabledMouseCursor: b.disabledMouseCursor,
      thumbColor: Color.lerp(a.thumbColor, b.thumbColor, t),
      disabledThumbColor:
          Color.lerp(a.disabledThumbColor, b.disabledThumbColor, t),
      thumbBorderColor: Color.lerp(a.thumbBorderColor, b.thumbBorderColor, t),
      disabledThumbBorderColor:
          Color.lerp(a.disabledThumbBorderColor, b.disabledThumbBorderColor, t),
      activeTrackColor: Color.lerp(a.activeTrackColor, b.activeTrackColor, t),
      inactiveTrackColor:
          Color.lerp(a.inactiveTrackColor, b.inactiveTrackColor, t),
      disabledActiveTrackColor:
          Color.lerp(a.disabledActiveTrackColor, b.disabledActiveTrackColor, t),
      disabledInactiveTrackColor: Color.lerp(
        a.disabledInactiveTrackColor,
        b.disabledInactiveTrackColor,
        t,
      ),
      trackHeight: b.trackHeight,
      thumbRadius: b.thumbRadius,
    );
  }

  ShadSliderTheme copyWith({
    bool? merge,
    double? min,
    double? max,
    MouseCursor? mouseCursor,
    MouseCursor? disabledMouseCursor,
    Color? thumbColor,
    Color? disabledThumbColor,
    Color? thumbBorderColor,
    Color? disabledThumbBorderColor,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? disabledActiveTrackColor,
    Color? disabledInactiveTrackColor,
    double? trackHeight,
    double? thumbRadius,
  }) {
    return ShadSliderTheme(
      merge: merge ?? this.merge,
      min: min ?? this.min,
      max: max ?? this.max,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      disabledMouseCursor: disabledMouseCursor ?? this.disabledMouseCursor,
      thumbColor: thumbColor ?? this.thumbColor,
      disabledThumbColor: disabledThumbColor ?? this.disabledThumbColor,
      thumbBorderColor: thumbBorderColor ?? this.thumbBorderColor,
      disabledThumbBorderColor:
          disabledThumbBorderColor ?? this.disabledThumbBorderColor,
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      disabledActiveTrackColor:
          disabledActiveTrackColor ?? this.disabledActiveTrackColor,
      disabledInactiveTrackColor:
          disabledInactiveTrackColor ?? this.disabledInactiveTrackColor,
      trackHeight: trackHeight ?? this.trackHeight,
      thumbRadius: thumbRadius ?? this.thumbRadius,
    );
  }

  ShadSliderTheme mergeWith(ShadSliderTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      min: other.min,
      max: other.max,
      mouseCursor: other.mouseCursor,
      disabledMouseCursor: other.disabledMouseCursor,
      thumbColor: other.thumbColor,
      disabledThumbColor: other.disabledThumbColor,
      thumbBorderColor: other.thumbBorderColor,
      disabledThumbBorderColor: other.disabledThumbBorderColor,
      activeTrackColor: other.activeTrackColor,
      inactiveTrackColor: other.inactiveTrackColor,
      disabledActiveTrackColor: other.disabledActiveTrackColor,
      disabledInactiveTrackColor: other.disabledInactiveTrackColor,
      trackHeight: other.trackHeight,
      thumbRadius: other.thumbRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSliderTheme &&
        other.merge == merge &&
        other.min == min &&
        other.max == max &&
        other.mouseCursor == mouseCursor &&
        other.disabledMouseCursor == disabledMouseCursor &&
        other.thumbColor == thumbColor &&
        other.disabledThumbColor == disabledThumbColor &&
        other.thumbBorderColor == thumbBorderColor &&
        other.disabledThumbBorderColor == disabledThumbBorderColor &&
        other.activeTrackColor == activeTrackColor &&
        other.inactiveTrackColor == inactiveTrackColor &&
        other.disabledActiveTrackColor == disabledActiveTrackColor &&
        other.disabledInactiveTrackColor == disabledInactiveTrackColor &&
        other.trackHeight == trackHeight &&
        other.thumbRadius == thumbRadius;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        min.hashCode ^
        max.hashCode ^
        mouseCursor.hashCode ^
        disabledMouseCursor.hashCode ^
        thumbColor.hashCode ^
        disabledThumbColor.hashCode ^
        thumbBorderColor.hashCode ^
        disabledThumbBorderColor.hashCode ^
        activeTrackColor.hashCode ^
        inactiveTrackColor.hashCode ^
        disabledActiveTrackColor.hashCode ^
        disabledInactiveTrackColor.hashCode ^
        trackHeight.hashCode ^
        thumbRadius.hashCode;
  }
}
