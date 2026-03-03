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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadInputOTPTheme(
      gap: lerpDouble$(a.gap, b.gap, t),
      style: TextStyle.lerp(a.style, b.style, t),
      width: lerpDouble$(a.width, b.width, t),
      height: lerpDouble$(a.height, b.height, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      firstRadius: BorderRadius.lerp(a.firstRadius, b.firstRadius, t),
      lastRadius: BorderRadius.lerp(a.lastRadius, b.lastRadius, t),
      singleRadius: BorderRadius.lerp(a.singleRadius, b.singleRadius, t),
      middleRadius: BorderRadius.lerp(a.middleRadius, b.middleRadius, t),
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
    final _this = (this as ShadInputOTPTheme);

    return ShadInputOTPTheme(
      gap: gap ?? _this.gap,
      style: style ?? _this.style,
      width: width ?? _this.width,
      height: height ?? _this.height,
      padding: padding ?? _this.padding,
      decoration: decoration ?? _this.decoration,
      firstRadius: firstRadius ?? _this.firstRadius,
      lastRadius: lastRadius ?? _this.lastRadius,
      singleRadius: singleRadius ?? _this.singleRadius,
      middleRadius: middleRadius ?? _this.middleRadius,
    );
  }

  ShadInputOTPTheme merge(ShadInputOTPTheme? other) {
    final _this = (this as ShadInputOTPTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      gap: other.gap,
      style: _this.style?.merge(other.style) ?? other.style,
      width: other.width,
      height: other.height,
      padding: other.padding,
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
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

    final _this = (this as ShadInputOTPTheme);
    final _other = (other as ShadInputOTPTheme);

    return _other.gap == _this.gap &&
        _other.style == _this.style &&
        _other.width == _this.width &&
        _other.height == _this.height &&
        _other.padding == _this.padding &&
        _other.decoration == _this.decoration &&
        _other.firstRadius == _this.firstRadius &&
        _other.lastRadius == _this.lastRadius &&
        _other.singleRadius == _this.singleRadius &&
        _other.middleRadius == _this.middleRadius;
  }

  @override
  int get hashCode {
    final _this = (this as ShadInputOTPTheme);

    return Object.hash(
      runtimeType,
      _this.gap,
      _this.style,
      _this.width,
      _this.height,
      _this.padding,
      _this.decoration,
      _this.firstRadius,
      _this.lastRadius,
      _this.singleRadius,
      _this.middleRadius,
    );
  }
}
