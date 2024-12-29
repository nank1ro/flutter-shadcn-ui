import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputOTPTheme {
  const ShadInputOTPTheme({
    this.merge = true,
    this.gap,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.firstRadius,
    this.lastRadius,
    this.singleRadius,
    this.middleRadius,
  });

  final bool merge;

  /// {@macro ShadInputOTP.gap}
  final double? gap;

  /// {@macro ShadInputOTPSlot.style}
  final TextStyle? style;

  /// {@macro ShadInputOTPSlot.width}
  final double? width;

  /// {@macro ShadInputOTPSlot.height}
  final double? height;

  /// {@macro ShadInputOTPSlot.padding}
  final EdgeInsets? padding;

  /// {@macro ShadInputOTPSlot.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadInputOTPSlot.firstRadius}
  final BorderRadius? firstRadius;

  /// {@macro ShadInputOTPSlot.lastRadius}
  final BorderRadius? lastRadius;

  /// {@macro ShadInputOTPSlot.singleRadius}
  final BorderRadius? singleRadius;

  /// {@macro ShadInputOTPSlot.middleRadius}
  final BorderRadius? middleRadius;

  static ShadInputOTPTheme lerp(
    ShadInputOTPTheme a,
    ShadInputOTPTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadInputOTPTheme(
      merge: b.merge,
      gap: lerpDouble(a.gap, b.gap, t),
      style: TextStyle.lerp(a.style, b.style, t),
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      firstRadius: BorderRadius.lerp(a.firstRadius, b.firstRadius, t),
      lastRadius: BorderRadius.lerp(a.lastRadius, b.lastRadius, t),
      singleRadius: BorderRadius.lerp(a.singleRadius, b.singleRadius, t),
      middleRadius: BorderRadius.lerp(a.middleRadius, b.middleRadius, t),
    );
  }

  ShadInputOTPTheme copyWith({
    bool? merge,
    double? gap,
    TextStyle? style,
    double? width,
    double? height,
    EdgeInsets? padding,
    ShadDecoration? decoration,
    BorderRadius? firstRadius,
    BorderRadius? lastRadius,
    BorderRadius? singleRadius,
    BorderRadius? middleRadius,
  }) {
    return ShadInputOTPTheme(
      merge: merge ?? this.merge,
      gap: gap ?? this.gap,
      style: style ?? this.style,
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      firstRadius: firstRadius ?? this.firstRadius,
      lastRadius: lastRadius ?? this.lastRadius,
      singleRadius: singleRadius ?? this.singleRadius,
      middleRadius: middleRadius ?? this.middleRadius,
    );
  }

  ShadInputOTPTheme mergeWith(ShadInputOTPTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      gap: other.gap,
      style: other.style,
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
    if (identical(this, other)) return true;

    return other is ShadInputOTPTheme &&
        other.merge == merge &&
        other.gap == gap &&
        other.style == style &&
        other.width == width &&
        other.height == height &&
        other.padding == padding &&
        other.decoration == decoration &&
        other.firstRadius == firstRadius &&
        other.lastRadius == lastRadius &&
        other.singleRadius == singleRadius &&
        other.middleRadius == middleRadius;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        gap.hashCode ^
        style.hashCode ^
        width.hashCode ^
        height.hashCode ^
        padding.hashCode ^
        decoration.hashCode ^
        firstRadius.hashCode ^
        lastRadius.hashCode ^
        singleRadius.hashCode ^
        middleRadius.hashCode;
  }
}
