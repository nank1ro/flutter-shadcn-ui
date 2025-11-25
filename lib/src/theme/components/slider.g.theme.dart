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
      disabledMouseCursor:
          t < 0.5 ? a?.disabledMouseCursor : b?.disabledMouseCursor,
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
    final _this = (this as ShadSliderTheme);

    return ShadSliderTheme(
      min: min ?? _this.min,
      max: max ?? _this.max,
      mouseCursor: mouseCursor ?? _this.mouseCursor,
      disabledMouseCursor: disabledMouseCursor ?? _this.disabledMouseCursor,
      thumbColor: thumbColor ?? _this.thumbColor,
      disabledThumbColor: disabledThumbColor ?? _this.disabledThumbColor,
      thumbBorderColor: thumbBorderColor ?? _this.thumbBorderColor,
      disabledThumbBorderColor:
          disabledThumbBorderColor ?? _this.disabledThumbBorderColor,
      activeTrackColor: activeTrackColor ?? _this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? _this.inactiveTrackColor,
      disabledActiveTrackColor:
          disabledActiveTrackColor ?? _this.disabledActiveTrackColor,
      disabledInactiveTrackColor:
          disabledInactiveTrackColor ?? _this.disabledInactiveTrackColor,
      trackHeight: trackHeight ?? _this.trackHeight,
      thumbRadius: thumbRadius ?? _this.thumbRadius,
    );
  }

  ShadSliderTheme merge(ShadSliderTheme? other) {
    final _this = (this as ShadSliderTheme);

    if (other == null) {
      return _this;
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadSliderTheme);
    final _other = (other as ShadSliderTheme);

    return _other.min == _this.min &&
        _other.max == _this.max &&
        _other.mouseCursor == _this.mouseCursor &&
        _other.disabledMouseCursor == _this.disabledMouseCursor &&
        _other.thumbColor == _this.thumbColor &&
        _other.disabledThumbColor == _this.disabledThumbColor &&
        _other.thumbBorderColor == _this.thumbBorderColor &&
        _other.disabledThumbBorderColor == _this.disabledThumbBorderColor &&
        _other.activeTrackColor == _this.activeTrackColor &&
        _other.inactiveTrackColor == _this.inactiveTrackColor &&
        _other.disabledActiveTrackColor == _this.disabledActiveTrackColor &&
        _other.disabledInactiveTrackColor == _this.disabledInactiveTrackColor &&
        _other.trackHeight == _this.trackHeight &&
        _other.thumbRadius == _this.thumbRadius;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSliderTheme);

    return Object.hash(
      runtimeType,
      _this.min,
      _this.max,
      _this.mouseCursor,
      _this.disabledMouseCursor,
      _this.thumbColor,
      _this.disabledThumbColor,
      _this.thumbBorderColor,
      _this.disabledThumbBorderColor,
      _this.activeTrackColor,
      _this.inactiveTrackColor,
      _this.disabledActiveTrackColor,
      _this.disabledInactiveTrackColor,
      _this.trackHeight,
      _this.thumbRadius,
    );
  }
}
