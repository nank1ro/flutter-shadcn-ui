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
      hoverTextDecoration:
          t < 0.5 ? a?.hoverTextDecoration : b?.hoverTextDecoration,
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
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
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
    final _this = (this as ShadButtonTheme);

    return ShadButtonTheme(
      cursor: cursor ?? _this.cursor,
      size: size ?? _this.size,
      sizesTheme: sizesTheme ?? _this.sizesTheme,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? _this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? _this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? _this.hoverForegroundColor,
      pressedBackgroundColor:
          pressedBackgroundColor ?? _this.pressedBackgroundColor,
      pressedForegroundColor:
          pressedForegroundColor ?? _this.pressedForegroundColor,
      shadows: shadows ?? _this.shadows,
      gradient: gradient ?? _this.gradient,
      textDecoration: textDecoration ?? _this.textDecoration,
      hoverTextDecoration: hoverTextDecoration ?? _this.hoverTextDecoration,
      decoration: decoration ?? _this.decoration,
      width: width ?? _this.width,
      height: height ?? _this.height,
      longPressDuration: longPressDuration ?? _this.longPressDuration,
      hoverStrategies: hoverStrategies ?? _this.hoverStrategies,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      textDirection: textDirection ?? _this.textDirection,
      gap: gap ?? _this.gap,
      expands: expands ?? _this.expands,
      textStyle: textStyle ?? _this.textStyle,
    );
  }

  ShadButtonTheme merge(ShadButtonTheme? other) {
    final _this = (this as ShadButtonTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      cursor: other.cursor,
      size: other.size,
      sizesTheme: other.sizesTheme,
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
      decoration: other.decoration,
      width: other.width,
      height: other.height,
      longPressDuration: other.longPressDuration,
      hoverStrategies: other.hoverStrategies,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      textDirection: other.textDirection,
      gap: other.gap,
      expands: other.expands,
      textStyle: _this.textStyle?.merge(other.textStyle) ?? other.textStyle,
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

    final _this = (this as ShadButtonTheme);
    final _other = (other as ShadButtonTheme);

    return _other.cursor == _this.cursor &&
        _other.size == _this.size &&
        _other.sizesTheme == _this.sizesTheme &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.hoverBackgroundColor == _this.hoverBackgroundColor &&
        _other.foregroundColor == _this.foregroundColor &&
        _other.hoverForegroundColor == _this.hoverForegroundColor &&
        _other.pressedBackgroundColor == _this.pressedBackgroundColor &&
        _other.pressedForegroundColor == _this.pressedForegroundColor &&
        _other.shadows == _this.shadows &&
        _other.gradient == _this.gradient &&
        _other.textDecoration == _this.textDecoration &&
        _other.hoverTextDecoration == _this.hoverTextDecoration &&
        _other.decoration == _this.decoration &&
        _other.width == _this.width &&
        _other.height == _this.height &&
        _other.longPressDuration == _this.longPressDuration &&
        _other.hoverStrategies == _this.hoverStrategies &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.textDirection == _this.textDirection &&
        _other.gap == _this.gap &&
        _other.expands == _this.expands &&
        _other.textStyle == _this.textStyle;
  }

  @override
  int get hashCode {
    final _this = (this as ShadButtonTheme);

    return Object.hashAll([
      runtimeType,
      _this.cursor,
      _this.size,
      _this.sizesTheme,
      _this.backgroundColor,
      _this.hoverBackgroundColor,
      _this.foregroundColor,
      _this.hoverForegroundColor,
      _this.pressedBackgroundColor,
      _this.pressedForegroundColor,
      _this.shadows,
      _this.gradient,
      _this.textDecoration,
      _this.hoverTextDecoration,
      _this.decoration,
      _this.width,
      _this.height,
      _this.longPressDuration,
      _this.hoverStrategies,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.textDirection,
      _this.gap,
      _this.expands,
      _this.textStyle,
    ]);
  }
}
