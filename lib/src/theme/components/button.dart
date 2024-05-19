import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

/// The theme for ShadButton.
///
/// Use this class to override some properties to all buttons in just one place.
@immutable
class ShadButtonTheme {
  const ShadButtonTheme({
    this.merge = true,
    this.applyIconColorFilter = true,
    this.cursor,
    this.size = ShadButtonSize.regular,
    this.sizesTheme,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.width,
    this.height,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.longPressDuration,
    this.hoverStrategies,
  });

  final bool merge;
  final bool applyIconColorFilter;
  final MouseCursor? cursor;
  final ShadButtonSize size;
  final ShadButtonSizesTheme? sizesTheme;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final ShadDecoration? decoration;
  final double? width;
  final double? height;
  final Duration? longPressDuration;
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  static ShadButtonTheme lerp(
    ShadButtonTheme a,
    ShadButtonTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadButtonTheme(
      applyIconColorFilter: b.applyIconColorFilter,
      sizesTheme: ShadButtonSizesTheme.lerp(
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
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      width: lerpDouble(a.width, b.width, t),
      height: lerpDouble(a.height, b.height, t),
      mainAxisAlignment: b.mainAxisAlignment,
      crossAxisAlignment: b.crossAxisAlignment,
      longPressDuration:
          a.longPressDuration != null && b.longPressDuration != null
              ? lerpDuration(a.longPressDuration!, b.longPressDuration!, t)
              : b.longPressDuration,
      hoverStrategies: b.hoverStrategies,
    );
  }

  ShadButtonTheme copyWith({
    bool? applyIconColorFilter,
    MouseCursor? cursor,
    MouseCursor? disabledCursor,
    ShadButtonSize? size,
    ShadButtonSizesTheme? sizesTheme,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    Color? pressedBackgroundColor,
    Color? pressedForegroundColor,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    TextDecoration? textDecoration,
    TextDecoration? hoverTextDecoration,
    ShadDecoration? decoration,
    double? width,
    double? height,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    Duration? longPressDuration,
    ShadHoverStrategies? hoverStrategies,
  }) {
    return ShadButtonTheme(
      applyIconColorFilter: applyIconColorFilter ?? this.applyIconColorFilter,
      cursor: cursor ?? this.cursor,
      size: size ?? this.size,
      sizesTheme: sizesTheme ?? this.sizesTheme,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? this.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? this.pressedForegroundColor,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      textDecoration: textDecoration ?? this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? this.hoverTextDecoration,
      decoration: decoration ?? this.decoration,
      width: width ?? this.width,
      height: height ?? this.height,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      longPressDuration: longPressDuration ?? this.longPressDuration,
      hoverStrategies: hoverStrategies ?? this.hoverStrategies,
    );
  }

  ShadButtonTheme mergeWith(ShadButtonTheme? other) {
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
      pressedBackgroundColor: other.pressedBackgroundColor,
      pressedForegroundColor: other.pressedForegroundColor,
      shadows: other.shadows,
      gradient: other.gradient,
      textDecoration: other.textDecoration,
      hoverTextDecoration: other.hoverTextDecoration,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      width: other.width,
      height: other.height,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      longPressDuration: other.longPressDuration,
      hoverStrategies: other.hoverStrategies,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadButtonTheme &&
        other.applyIconColorFilter == applyIconColorFilter &&
        other.cursor == cursor &&
        other.size == size &&
        other.sizesTheme == sizesTheme &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.hoverForegroundColor == hoverForegroundColor &&
        other.pressedBackgroundColor == pressedBackgroundColor &&
        other.pressedForegroundColor == pressedForegroundColor &&
        listEquals(other.shadows, shadows) &&
        other.gradient == gradient &&
        other.textDecoration == textDecoration &&
        other.hoverTextDecoration == hoverTextDecoration &&
        other.decoration == decoration &&
        other.width == width &&
        other.height == height &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.longPressDuration == longPressDuration &&
        other.hoverStrategies == hoverStrategies;
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
        pressedBackgroundColor.hashCode ^
        pressedForegroundColor.hashCode ^
        shadows.hashCode ^
        gradient.hashCode ^
        textDecoration.hashCode ^
        hoverTextDecoration.hashCode ^
        decoration.hashCode ^
        width.hashCode ^
        height.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        longPressDuration.hashCode ^
        hoverStrategies.hashCode;
  }
}

// The theme for an individual size of ShadButton.
@immutable
class ShadButtonSizeTheme {
  const ShadButtonSizeTheme({
    this.merge = true,
    required this.height,
    required this.padding,
    this.width,
  });
  final bool merge;
  final double height;
  final EdgeInsets padding;
  final double? width;

  ShadButtonSizeTheme copyWith({
    double? height,
    EdgeInsets? padding,
    double? width,
  }) {
    return ShadButtonSizeTheme(
      height: height ?? this.height,
      padding: padding ?? this.padding,
      width: width ?? this.width,
    );
  }

  static ShadButtonSizeTheme? lerp(
    ShadButtonSizeTheme? a,
    ShadButtonSizeTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadButtonSizeTheme(
      height: lerpDouble(a?.height, b?.height, t)!,
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t)!,
      width: lerpDouble(a?.width, b?.width, t),
    );
  }

  ShadButtonSizeTheme mergeWith(ShadButtonSizeTheme? other) {
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

    return other is ShadButtonSizeTheme &&
        other.height == height &&
        other.padding == padding &&
        other.width == width;
  }

  @override
  int get hashCode => height.hashCode ^ padding.hashCode ^ width.hashCode;
}

// The theme for the predefined sizes of ShadButton.
@immutable
class ShadButtonSizesTheme {
  const ShadButtonSizesTheme({
    this.merge = true,
    this.regular,
    this.sm,
    this.lg,
    this.icon,
  });
  final bool merge;
  final ShadButtonSizeTheme? regular;
  final ShadButtonSizeTheme? sm;
  final ShadButtonSizeTheme? lg;
  final ShadButtonSizeTheme? icon;

  static ShadButtonSizesTheme? lerp(
    ShadButtonSizesTheme? a,
    ShadButtonSizesTheme? b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadButtonSizesTheme(
      regular: ShadButtonSizeTheme.lerp(a?.regular, b?.regular, t),
      sm: ShadButtonSizeTheme.lerp(a?.sm, b?.sm, t),
      lg: ShadButtonSizeTheme.lerp(a?.lg, b?.lg, t),
      icon: ShadButtonSizeTheme.lerp(a?.icon, b?.icon, t),
    );
  }

  ShadButtonSizesTheme copyWith({
    ShadButtonSizeTheme? regular,
    ShadButtonSizeTheme? sm,
    ShadButtonSizeTheme? lg,
    ShadButtonSizeTheme? icon,
  }) {
    return ShadButtonSizesTheme(
      regular: regular ?? this.regular,
      sm: sm ?? this.sm,
      lg: lg ?? this.lg,
      icon: icon ?? this.icon,
    );
  }

  ShadButtonSizesTheme mergeWith(ShadButtonSizesTheme? other) {
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
    return other is ShadButtonSizesTheme &&
        other.regular == regular &&
        other.sm == sm &&
        other.lg == lg &&
        other.icon == icon;
  }

  @override
  int get hashCode =>
      regular.hashCode ^ sm.hashCode ^ lg.hashCode ^ icon.hashCode;
}
