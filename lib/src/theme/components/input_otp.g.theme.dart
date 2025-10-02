// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'input_otp.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadInputOTPTheme {
  bool get canMerge => true;

  static ShadInputOTPTheme? lerp(
    ShadInputOTPTheme? a,
    ShadInputOTPTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadInputOTPTheme(
      gap: lerpDouble$(a?.gap, b?.gap, t),
      style: TextStyle.lerp(a?.style, b?.style, t),
      width: lerpDouble$(a?.width, b?.width, t),
      height: lerpDouble$(a?.height, b?.height, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      firstRadius: BorderRadius.lerp(a?.firstRadius, b?.firstRadius, t),
      lastRadius: BorderRadius.lerp(a?.lastRadius, b?.lastRadius, t),
      singleRadius: BorderRadius.lerp(a?.singleRadius, b?.singleRadius, t),
      middleRadius: BorderRadius.lerp(a?.middleRadius, b?.middleRadius, t),
    );
  }

  ShadInputOTPTheme copyWith({
    double? gap,
    TextStyle? style,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    BorderRadius? firstRadius,
    BorderRadius? lastRadius,
    BorderRadius? singleRadius,
    BorderRadius? middleRadius,
  }) {
    final a = (this as ShadInputOTPTheme);

    return ShadInputOTPTheme(
      gap: gap ?? a.gap,
      style: style ?? a.style,
      width: width ?? a.width,
      height: height ?? a.height,
      padding: padding ?? a.padding,
      decoration: decoration ?? a.decoration,
      firstRadius: firstRadius ?? a.firstRadius,
      lastRadius: lastRadius ?? a.lastRadius,
      singleRadius: singleRadius ?? a.singleRadius,
      middleRadius: middleRadius ?? a.middleRadius,
    );
  }

  ShadInputOTPTheme merge(ShadInputOTPTheme? other) {
    final current = (this as ShadInputOTPTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      gap: other.gap,
      style: current.style?.merge(other.style) ?? other.style,
      width: other.width,
      height: other.height,
      padding: other.padding,
      decoration: other.decoration,
      firstRadius: other.firstRadius,
      lastRadius: other.lastRadius,
      singleRadius: other.singleRadius,
      middleRadius: other.middleRadius,
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

    final value = (this as ShadInputOTPTheme);

    return other is ShadInputOTPTheme &&
        other.gap == value.gap &&
        other.style == value.style &&
        other.width == value.width &&
        other.height == value.height &&
        other.padding == value.padding &&
        other.decoration == value.decoration &&
        other.firstRadius == value.firstRadius &&
        other.lastRadius == value.lastRadius &&
        other.singleRadius == value.singleRadius &&
        other.middleRadius == value.middleRadius;
  }

  @override
  int get hashCode {
    final value = (this as ShadInputOTPTheme);

    return Object.hash(
      runtimeType,
      value.gap,
      value.style,
      value.width,
      value.height,
      value.padding,
      value.decoration,
      value.firstRadius,
      value.lastRadius,
      value.singleRadius,
      value.middleRadius,
    );
  }
}
