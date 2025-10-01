// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'switch.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSwitchTheme {
  bool get canMerge => true;

  static ShadSwitchTheme lerp(
    ShadSwitchTheme? a,
    ShadSwitchTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadSwitchTheme(
      thumbColor: Color.lerp(a?.thumbColor, b?.thumbColor, t),
      uncheckedTrackColor: Color.lerp(
        a?.uncheckedTrackColor,
        b?.uncheckedTrackColor,
        t,
      ),
      checkedTrackColor: Color.lerp(
        a?.checkedTrackColor,
        b?.checkedTrackColor,
        t,
      ),
      width: lerpDouble$(a?.width, b?.width, t),
      height: lerpDouble$(a?.height, b?.height, t),
      margin: lerpDouble$(a?.margin, b?.margin, t),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  ShadSwitchTheme copyWith({
    Color? thumbColor,
    Color? uncheckedTrackColor,
    Color? checkedTrackColor,
    double? width,
    double? height,
    double? margin,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
  }) {
    final a = (this as ShadSwitchTheme);

    return ShadSwitchTheme(
      thumbColor: thumbColor ?? a.thumbColor,
      uncheckedTrackColor: uncheckedTrackColor ?? a.uncheckedTrackColor,
      checkedTrackColor: checkedTrackColor ?? a.checkedTrackColor,
      width: width ?? a.width,
      height: height ?? a.height,
      margin: margin ?? a.margin,
      duration: duration ?? a.duration,
      decoration: decoration ?? a.decoration,
      padding: padding ?? a.padding,
    );
  }

  ShadSwitchTheme merge(ShadSwitchTheme? other) {
    final current = (this as ShadSwitchTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      thumbColor: other.thumbColor,
      uncheckedTrackColor: other.uncheckedTrackColor,
      checkedTrackColor: other.checkedTrackColor,
      width: other.width,
      height: other.height,
      margin: other.margin,
      duration: other.duration,
      decoration: other.decoration,
      padding: other.padding,
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

    final value = (this as ShadSwitchTheme);

    return other is ShadSwitchTheme &&
        other.thumbColor == value.thumbColor &&
        other.uncheckedTrackColor == value.uncheckedTrackColor &&
        other.checkedTrackColor == value.checkedTrackColor &&
        other.width == value.width &&
        other.height == value.height &&
        other.margin == value.margin &&
        other.duration == value.duration &&
        other.decoration == value.decoration &&
        other.padding == value.padding;
  }

  @override
  int get hashCode {
    final value = (this as ShadSwitchTheme);

    return Object.hash(
      runtimeType,
      value.thumbColor,
      value.uncheckedTrackColor,
      value.checkedTrackColor,
      value.width,
      value.height,
      value.margin,
      value.duration,
      value.decoration,
      value.padding,
    );
  }
}
