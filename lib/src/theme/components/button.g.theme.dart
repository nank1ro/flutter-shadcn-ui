// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadButtonTheme {
  bool get canMerge => true;

  static ShadButtonTheme? lerp(
    ShadButtonTheme? a,
    ShadButtonTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadButtonTheme(
      cursor: t < 0.5 ? a?.cursor : b?.cursor,
      size: t < 0.5 ? a?.size : b?.size,
      sizesTheme: ShadButtonSizesTheme.lerp(a?.sizesTheme, b?.sizesTheme, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a?.hoverBackgroundColor,
        b?.hoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      hoverForegroundColor: Color.lerp(
        a?.hoverForegroundColor,
        b?.hoverForegroundColor,
        t,
      ),
      pressedBackgroundColor: Color.lerp(
        a?.pressedBackgroundColor,
        b?.pressedBackgroundColor,
        t,
      ),
      pressedForegroundColor: Color.lerp(
        a?.pressedForegroundColor,
        b?.pressedForegroundColor,
        t,
      ),
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      gradient: Gradient.lerp(a?.gradient, b?.gradient, t),
      textDecoration: t < 0.5 ? a?.textDecoration : b?.textDecoration,
      hoverTextDecoration: t < 0.5
          ? a?.hoverTextDecoration
          : b?.hoverTextDecoration,
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      width: lerpDouble$(a?.width, b?.width, t),
      height: lerpDouble$(a?.height, b?.height, t),
      longPressDuration: lerpDuration$(
        a?.longPressDuration,
        b?.longPressDuration,
        t,
      ),
      hoverStrategies: t < 0.5 ? a?.hoverStrategies : b?.hoverStrategies,
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      textDirection: t < 0.5 ? a?.textDirection : b?.textDirection,
      gap: lerpDouble$(a?.gap, b?.gap, t),
      expands: t < 0.5 ? a?.expands : b?.expands,
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
    );
  }

  ShadButtonTheme copyWith({
    MouseCursor? cursor,
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
    Duration? longPressDuration,
    ShadHoverStrategies? hoverStrategies,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    TextDirection? textDirection,
    double? gap,
    bool? expands,
    TextStyle? textStyle,
  }) {
    final a = (this as ShadButtonTheme);

    return ShadButtonTheme(
      cursor: cursor ?? a.cursor,
      size: size ?? a.size,
      sizesTheme: sizesTheme ?? a.sizesTheme,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? a.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? a.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? a.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? a.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? a.pressedForegroundColor,
      shadows: shadows ?? a.shadows,
      gradient: gradient ?? a.gradient,
      textDecoration: textDecoration ?? a.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? a.hoverTextDecoration,
      decoration: decoration ?? a.decoration,
      width: width ?? a.width,
      height: height ?? a.height,
      longPressDuration: longPressDuration ?? a.longPressDuration,
      hoverStrategies: hoverStrategies ?? a.hoverStrategies,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      textDirection: textDirection ?? a.textDirection,
      gap: gap ?? a.gap,
      expands: expands ?? a.expands,
      textStyle: textStyle ?? a.textStyle,
    );
  }

  ShadButtonTheme merge(ShadButtonTheme? other) {
    final current = (this as ShadButtonTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      cursor: other.cursor,
      size: other.size,
      sizesTheme:
          current.sizesTheme?.merge(other.sizesTheme) ?? other.sizesTheme,
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
      decoration:
          current.decoration?.merge(other.decoration) ?? other.decoration,
      width: other.width,
      height: other.height,
      longPressDuration: other.longPressDuration,
      hoverStrategies: other.hoverStrategies,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      textDirection: other.textDirection,
      gap: other.gap,
      expands: other.expands,
      textStyle: current.textStyle?.merge(other.textStyle) ?? other.textStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadButtonTheme) {
      return false;
    }

    final value = (this as ShadButtonTheme);

    return other.cursor == value.cursor &&
        other.size == value.size &&
        other.sizesTheme == value.sizesTheme &&
        other.backgroundColor == value.backgroundColor &&
        other.hoverBackgroundColor == value.hoverBackgroundColor &&
        other.foregroundColor == value.foregroundColor &&
        other.hoverForegroundColor == value.hoverForegroundColor &&
        other.pressedBackgroundColor == value.pressedBackgroundColor &&
        other.pressedForegroundColor == value.pressedForegroundColor &&
        other.shadows == value.shadows &&
        other.gradient == value.gradient &&
        other.textDecoration == value.textDecoration &&
        other.hoverTextDecoration == value.hoverTextDecoration &&
        other.decoration == value.decoration &&
        other.width == value.width &&
        other.height == value.height &&
        other.longPressDuration == value.longPressDuration &&
        other.hoverStrategies == value.hoverStrategies &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.textDirection == value.textDirection &&
        other.gap == value.gap &&
        other.expands == value.expands &&
        other.textStyle == value.textStyle;
  }

  @override
  int get hashCode {
    final value = (this as ShadButtonTheme);

    return Object.hashAll([
      runtimeType,
      value.cursor,
      value.size,
      value.sizesTheme,
      value.backgroundColor,
      value.hoverBackgroundColor,
      value.foregroundColor,
      value.hoverForegroundColor,
      value.pressedBackgroundColor,
      value.pressedForegroundColor,
      value.shadows,
      value.gradient,
      value.textDecoration,
      value.hoverTextDecoration,
      value.decoration,
      value.width,
      value.height,
      value.longPressDuration,
      value.hoverStrategies,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.textDirection,
      value.gap,
      value.expands,
      value.textStyle,
    ]);
  }
}
