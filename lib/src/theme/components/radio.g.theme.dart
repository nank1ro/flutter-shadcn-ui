// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'radio.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadRadioTheme {
  bool get canMerge => true;

  static ShadRadioTheme? lerp(ShadRadioTheme? a, ShadRadioTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadRadioTheme(
      color: Color.lerp(a?.color, b?.color, t),
      size: lerpDouble$(a?.size, b?.size, t),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      circleSize: lerpDouble$(a?.circleSize, b?.circleSize, t),
      axis: t < 0.5 ? a?.axis : b?.axis,
      spacing: lerpDouble$(a?.spacing, b?.spacing, t),
      runSpacing: lerpDouble$(a?.runSpacing, b?.runSpacing, t),
      alignment: t < 0.5 ? a?.alignment : b?.alignment,
      runAlignment: t < 0.5 ? a?.runAlignment : b?.runAlignment,
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      radioPadding: EdgeInsetsGeometry.lerp(
        a?.radioPadding,
        b?.radioPadding,
        t,
      ),
    );
  }

  ShadRadioTheme copyWith({
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    double? circleSize,
    Axis? axis,
    double? spacing,
    double? runSpacing,
    WrapAlignment? alignment,
    WrapAlignment? runAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? radioPadding,
  }) {
    final a = (this as ShadRadioTheme);

    return ShadRadioTheme(
      color: color ?? a.color,
      size: size ?? a.size,
      duration: duration ?? a.duration,
      decoration: decoration ?? a.decoration,
      padding: padding ?? a.padding,
      circleSize: circleSize ?? a.circleSize,
      axis: axis ?? a.axis,
      spacing: spacing ?? a.spacing,
      runSpacing: runSpacing ?? a.runSpacing,
      alignment: alignment ?? a.alignment,
      runAlignment: runAlignment ?? a.runAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      radioPadding: radioPadding ?? a.radioPadding,
    );
  }

  ShadRadioTheme merge(ShadRadioTheme? other) {
    final current = (this as ShadRadioTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      color: other.color,
      size: other.size,
      duration: other.duration,
      decoration: other.decoration,
      padding: other.padding,
      circleSize: other.circleSize,
      axis: other.axis,
      spacing: other.spacing,
      runSpacing: other.runSpacing,
      alignment: other.alignment,
      runAlignment: other.runAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      radioPadding: other.radioPadding,
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

    final value = (this as ShadRadioTheme);

    return other is ShadRadioTheme &&
        other.color == value.color &&
        other.size == value.size &&
        other.duration == value.duration &&
        other.decoration == value.decoration &&
        other.padding == value.padding &&
        other.circleSize == value.circleSize &&
        other.axis == value.axis &&
        other.spacing == value.spacing &&
        other.runSpacing == value.runSpacing &&
        other.alignment == value.alignment &&
        other.runAlignment == value.runAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.radioPadding == value.radioPadding;
  }

  @override
  int get hashCode {
    final value = (this as ShadRadioTheme);

    return Object.hash(
      runtimeType,
      value.color,
      value.size,
      value.duration,
      value.decoration,
      value.padding,
      value.circleSize,
      value.axis,
      value.spacing,
      value.runSpacing,
      value.alignment,
      value.runAlignment,
      value.crossAxisAlignment,
      value.radioPadding,
    );
  }
}
