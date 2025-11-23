// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'slider.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSliderTheme {
  bool get canMerge => true;

  static ShadSliderTheme? lerp(
    ShadSliderTheme? a,
    ShadSliderTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSliderTheme(
      min: lerpDouble$(a?.min, b?.min, t),
      max: lerpDouble$(a?.max, b?.max, t),
      mouseCursor: t < 0.5 ? a?.mouseCursor : b?.mouseCursor,
      disabledMouseCursor: t < 0.5
          ? a?.disabledMouseCursor
          : b?.disabledMouseCursor,
      thumbColor: Color.lerp(a?.thumbColor, b?.thumbColor, t),
      disabledThumbColor: Color.lerp(
        a?.disabledThumbColor,
        b?.disabledThumbColor,
        t,
      ),
      thumbBorderColor: Color.lerp(a?.thumbBorderColor, b?.thumbBorderColor, t),
      disabledThumbBorderColor: Color.lerp(
        a?.disabledThumbBorderColor,
        b?.disabledThumbBorderColor,
        t,
      ),
      activeTrackColor: Color.lerp(a?.activeTrackColor, b?.activeTrackColor, t),
      inactiveTrackColor: Color.lerp(
        a?.inactiveTrackColor,
        b?.inactiveTrackColor,
        t,
      ),
      disabledActiveTrackColor: Color.lerp(
        a?.disabledActiveTrackColor,
        b?.disabledActiveTrackColor,
        t,
      ),
      disabledInactiveTrackColor: Color.lerp(
        a?.disabledInactiveTrackColor,
        b?.disabledInactiveTrackColor,
        t,
      ),
      trackHeight: lerpDouble$(a?.trackHeight, b?.trackHeight, t),
      thumbRadius: lerpDouble$(a?.thumbRadius, b?.thumbRadius, t),
    );
  }

  ShadSliderTheme copyWith({
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
    final a = (this as ShadSliderTheme);

    return ShadSliderTheme(
      min: min ?? a.min,
      max: max ?? a.max,
      mouseCursor: mouseCursor ?? a.mouseCursor,
      disabledMouseCursor: disabledMouseCursor ?? a.disabledMouseCursor,
      thumbColor: thumbColor ?? a.thumbColor,
      disabledThumbColor: disabledThumbColor ?? a.disabledThumbColor,
      thumbBorderColor: thumbBorderColor ?? a.thumbBorderColor,
      disabledThumbBorderColor:
          disabledThumbBorderColor ?? a.disabledThumbBorderColor,
      activeTrackColor: activeTrackColor ?? a.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? a.inactiveTrackColor,
      disabledActiveTrackColor:
          disabledActiveTrackColor ?? a.disabledActiveTrackColor,
      disabledInactiveTrackColor:
          disabledInactiveTrackColor ?? a.disabledInactiveTrackColor,
      trackHeight: trackHeight ?? a.trackHeight,
      thumbRadius: thumbRadius ?? a.thumbRadius,
    );
  }

  ShadSliderTheme merge(ShadSliderTheme? other) {
    final current = (this as ShadSliderTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

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
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadSliderTheme) {
      return false;
    }

    final value = (this as ShadSliderTheme);

    return other.min == value.min &&
        other.max == value.max &&
        other.mouseCursor == value.mouseCursor &&
        other.disabledMouseCursor == value.disabledMouseCursor &&
        other.thumbColor == value.thumbColor &&
        other.disabledThumbColor == value.disabledThumbColor &&
        other.thumbBorderColor == value.thumbBorderColor &&
        other.disabledThumbBorderColor == value.disabledThumbBorderColor &&
        other.activeTrackColor == value.activeTrackColor &&
        other.inactiveTrackColor == value.inactiveTrackColor &&
        other.disabledActiveTrackColor == value.disabledActiveTrackColor &&
        other.disabledInactiveTrackColor == value.disabledInactiveTrackColor &&
        other.trackHeight == value.trackHeight &&
        other.thumbRadius == value.thumbRadius;
  }

  @override
  int get hashCode {
    final value = (this as ShadSliderTheme);

    return Object.hash(
      runtimeType,
      value.min,
      value.max,
      value.mouseCursor,
      value.disabledMouseCursor,
      value.thumbColor,
      value.disabledThumbColor,
      value.thumbBorderColor,
      value.disabledThumbBorderColor,
      value.activeTrackColor,
      value.inactiveTrackColor,
      value.disabledActiveTrackColor,
      value.disabledInactiveTrackColor,
      value.trackHeight,
      value.thumbRadius,
    );
  }
}
