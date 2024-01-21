import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

/// The theme for ShadcnButton.
///
/// Use this class to override some properties to all buttons in just one place.
@immutable
class ShadcnButtonTheme {
  const ShadcnButtonTheme({
    this.merge = true,
    this.applyIconColorFilter = true,
    this.cursor,
    this.size = ShadcnButtonSize.regular,
    this.sizesTheme,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.border,
    this.radius,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
  });
  final bool merge;
  final bool applyIconColorFilter;
  final MouseCursor? cursor;
  final ShadcnButtonSize size;
  final ShadcnButtonSizesTheme? sizesTheme;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final BoxBorder? border;
  final BorderRadius? radius;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final ShadcnDecorationTheme? decoration;

  static ShadcnButtonTheme lerp(
    ShadcnButtonTheme a,
    ShadcnButtonTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnButtonTheme(
      applyIconColorFilter: b.applyIconColorFilter,
      sizesTheme: ShadcnButtonSizesTheme.lerp(
        a.sizesTheme,
        b.sizesTheme,
        t,
      ),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      hoverForegroundColor:
          Color.lerp(a.hoverForegroundColor, b.hoverForegroundColor, t),
      border: b.border,
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      pressedBackgroundColor:
          Color.lerp(a.pressedBackgroundColor, b.pressedBackgroundColor, t),
      pressedForegroundColor:
          Color.lerp(a.pressedForegroundColor, b.pressedForegroundColor, t),
      shadows: b.shadows,
      gradient: b.gradient,
      textDecoration: b.textDecoration,
      hoverTextDecoration: b.hoverTextDecoration,
      cursor: b.cursor,
      size: b.size,
      decoration: ShadcnDecorationTheme.lerp(
        a.decoration,
        b.decoration,
        t,
      ),
    );
  }

  ShadcnButtonTheme copyWith({
    bool? applyIconColorFilter,
    MouseCursor? cursor,
    MouseCursor? disabledCursor,
    ShadcnButtonSize? size,
    ShadcnButtonSizesTheme? sizesTheme,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    BoxBorder? border,
    BorderRadius? radius,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    TextDecoration? textDecoration,
    TextDecoration? hoverTextDecoration,
    ShadcnDecorationTheme? decoration,
  }) {
    return ShadcnButtonTheme(
      applyIconColorFilter: applyIconColorFilter ?? this.applyIconColorFilter,
      cursor: cursor ?? this.cursor,
      size: size ?? this.size,
      sizesTheme: sizesTheme ?? this.sizesTheme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      textDecoration: textDecoration ?? this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? this.hoverTextDecoration,
      decoration: decoration ?? this.decoration,
    );
  }

  ShadcnButtonTheme mergeWith(ShadcnButtonTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      applyIconColorFilter: other.applyIconColorFilter,
      cursor: other.cursor,
      size: other.size,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      hoverForegroundColor: other.hoverForegroundColor,
      border: other.border,
      radius: other.radius,
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      shadows: other.shadows,
      gradient: other.gradient,
      textDecoration: other.textDecoration,
      hoverTextDecoration: other.hoverTextDecoration,
      decoration: other.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnButtonTheme &&
        other.applyIconColorFilter == applyIconColorFilter &&
        other.cursor == cursor &&
        other.size == size &&
        other.sizesTheme == sizesTheme &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.hoverForegroundColor == hoverForegroundColor &&
        other.border == border &&
        other.radius == radius &&
        other.pressedBackgroundColor == pressedBackgroundColor &&
        other.pressedForegroundColor == pressedForegroundColor &&
        listEquals(other.shadows, shadows) &&
        other.gradient == gradient &&
        other.textDecoration == textDecoration &&
        other.hoverTextDecoration == hoverTextDecoration &&
        other.decoration == decoration;
  }

  @override
  int get hashCode {
    return applyIconColorFilter.hashCode ^
        cursor.hashCode ^
        size.hashCode ^
        sizesTheme.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode ^
        hoverForegroundColor.hashCode ^
        border.hashCode ^
        radius.hashCode ^
        pressedBackgroundColor.hashCode ^
        pressedForegroundColor.hashCode ^
        shadows.hashCode ^
        gradient.hashCode ^
        textDecoration.hashCode ^
        hoverTextDecoration.hashCode ^
        decoration.hashCode;
  }
}

// The theme for an individual size of ShadcnButton.
@immutable
class ShadcnButtonSizeTheme {
  const ShadcnButtonSizeTheme({
    this.merge = true,
    required this.height,
    required this.padding,
    this.width,
  });
  final bool merge;
  final double height;
  final EdgeInsets padding;
  final double? width;

  ShadcnButtonSizeTheme copyWith({
    double? height,
    EdgeInsets? padding,
    double? width,
  }) {
    return ShadcnButtonSizeTheme(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      width: width ?? this.width,
    );
  }

  static ShadcnButtonSizeTheme? lerp(
    ShadcnButtonSizeTheme? a,
    ShadcnButtonSizeTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnButtonSizeTheme(
      height: lerpDouble(a?.height, b?.height, t)!,
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t)!,
      width: lerpDouble(a?.width, b?.width, t),
    );
  }

  ShadcnButtonSizeTheme mergeWith(ShadcnButtonSizeTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      height: other.height,
      padding: other.padding,
      width: other.width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnButtonSizeTheme &&
        other.height == height &&
        other.padding == padding &&
        other.width == width;
  }

  @override
  int get hashCode => height.hashCode ^ padding.hashCode ^ width.hashCode;
}

// The theme for the predefined sizes of ShadcnButton.
@immutable
class ShadcnButtonSizesTheme {
  const ShadcnButtonSizesTheme({
    this.merge = true,
    this.regular,
    this.sm,
    this.lg,
    this.icon,
  });
  final bool merge;
  final ShadcnButtonSizeTheme? regular;
  final ShadcnButtonSizeTheme? sm;
  final ShadcnButtonSizeTheme? lg;
  final ShadcnButtonSizeTheme? icon;

  static ShadcnButtonSizesTheme? lerp(
    ShadcnButtonSizesTheme? a,
    ShadcnButtonSizesTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnButtonSizesTheme(
      regular: ShadcnButtonSizeTheme.lerp(a?.regular, b?.regular, t),
      sm: ShadcnButtonSizeTheme.lerp(a?.sm, b?.sm, t),
      lg: ShadcnButtonSizeTheme.lerp(a?.lg, b?.lg, t),
      icon: ShadcnButtonSizeTheme.lerp(a?.icon, b?.icon, t),
    );
  }

  ShadcnButtonSizesTheme copyWith({
    ShadcnButtonSizeTheme? regular,
    ShadcnButtonSizeTheme? sm,
    ShadcnButtonSizeTheme? lg,
    ShadcnButtonSizeTheme? icon,
  }) {
    return ShadcnButtonSizesTheme(
      regular: regular ?? this.regular,
      sm: sm ?? this.sm,
      lg: lg ?? this.lg,
      icon: icon ?? this.icon,
    );
  }

  ShadcnButtonSizesTheme mergeWith(ShadcnButtonSizesTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      regular: other.regular,
      sm: other.sm,
      lg: other.lg,
      icon: other.icon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadcnButtonSizesTheme &&
        other.regular == regular &&
        other.sm == sm &&
        other.lg == lg &&
        other.icon == icon;
  }

  @override
  int get hashCode =>
      regular.hashCode ^ sm.hashCode ^ lg.hashCode ^ icon.hashCode;
}
