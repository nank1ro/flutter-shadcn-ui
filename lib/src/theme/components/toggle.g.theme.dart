// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'toggle.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadToggleTheme {
  bool get canMerge => true;

  static ShadToggleTheme? lerp(
    ShadToggleTheme? a,
    ShadToggleTheme? b,
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

    return ShadToggleTheme(
      size: t < 0.5 ? a.size : b.size,
      sizesTheme: ShadButtonSizesTheme.lerp(a.sizesTheme, b.sizesTheme, t),
      height: lerpDouble$(a.height, b.height, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a.hoverBackgroundColor,
        b.hoverBackgroundColor,
        t,
      ),
      selectedBackgroundColor: Color.lerp(
        a.selectedBackgroundColor,
        b.selectedBackgroundColor,
        t,
      ),
      selectedHoverBackgroundColor: Color.lerp(
        a.selectedHoverBackgroundColor,
        b.selectedHoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      hoverForegroundColor: Color.lerp(
        a.hoverForegroundColor,
        b.hoverForegroundColor,
        t,
      ),
      selectedForegroundColor: Color.lerp(
        a.selectedForegroundColor,
        b.selectedForegroundColor,
        t,
      ),
      selectedHoverForegroundColor: Color.lerp(
        a.selectedHoverForegroundColor,
        b.selectedHoverForegroundColor,
        t,
      ),
      shadows: t < 0.5 ? a.shadows : b.shadows,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      cursor: t < 0.5 ? a.cursor : b.cursor,
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      gap: lerpDouble$(a.gap, b.gap, t),
    );
  }

  ShadToggleTheme copyWith({
    ShadButtonSize? size,
    ShadButtonSizesTheme? sizesTheme,
    double? height,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? selectedBackgroundColor,
    Color? selectedHoverBackgroundColor,
    Color? foregroundColor,
    Color? hoverForegroundColor,
    Color? selectedForegroundColor,
    Color? selectedHoverForegroundColor,
    List<BoxShadow>? shadows,
    ShadDecoration? decoration,
    MouseCursor? cursor,
    TextStyle? textStyle,
    double? gap,
  }) {
    final _this = (this as ShadToggleTheme);

    return ShadToggleTheme(
      size: size ?? _this.size,
      sizesTheme: sizesTheme ?? _this.sizesTheme,
      height: height ?? _this.height,
      padding: padding ?? _this.padding,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? _this.hoverBackgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? _this.selectedBackgroundColor,
      selectedHoverBackgroundColor:
          selectedHoverBackgroundColor ?? _this.selectedHoverBackgroundColor,
      foregroundColor: foregroundColor ?? _this.foregroundColor,
      hoverForegroundColor: hoverForegroundColor ?? _this.hoverForegroundColor,
      selectedForegroundColor:
          selectedForegroundColor ?? _this.selectedForegroundColor,
      selectedHoverForegroundColor:
          selectedHoverForegroundColor ?? _this.selectedHoverForegroundColor,
      shadows: shadows ?? _this.shadows,
      decoration: decoration ?? _this.decoration,
      cursor: cursor ?? _this.cursor,
      textStyle: textStyle ?? _this.textStyle,
      gap: gap ?? _this.gap,
    );
  }

  ShadToggleTheme merge(ShadToggleTheme? other) {
    final _this = (this as ShadToggleTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      size: other.size,
      sizesTheme: _this.sizesTheme?.merge(other.sizesTheme) ?? other.sizesTheme,
      height: other.height,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      selectedBackgroundColor: other.selectedBackgroundColor,
      selectedHoverBackgroundColor: other.selectedHoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      hoverForegroundColor: other.hoverForegroundColor,
      selectedForegroundColor: other.selectedForegroundColor,
      selectedHoverForegroundColor: other.selectedHoverForegroundColor,
      shadows: other.shadows,
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      cursor: other.cursor,
      textStyle: _this.textStyle?.merge(other.textStyle) ?? other.textStyle,
      gap: other.gap,
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

    final _this = (this as ShadToggleTheme);
    final _other = (other as ShadToggleTheme);

    return _other.size == _this.size &&
        _other.sizesTheme == _this.sizesTheme &&
        _other.height == _this.height &&
        _other.padding == _this.padding &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.hoverBackgroundColor == _this.hoverBackgroundColor &&
        _other.selectedBackgroundColor == _this.selectedBackgroundColor &&
        _other.selectedHoverBackgroundColor ==
            _this.selectedHoverBackgroundColor &&
        _other.foregroundColor == _this.foregroundColor &&
        _other.hoverForegroundColor == _this.hoverForegroundColor &&
        _other.selectedForegroundColor == _this.selectedForegroundColor &&
        _other.selectedHoverForegroundColor ==
            _this.selectedHoverForegroundColor &&
        _other.shadows == _this.shadows &&
        _other.decoration == _this.decoration &&
        _other.cursor == _this.cursor &&
        _other.textStyle == _this.textStyle &&
        _other.gap == _this.gap;
  }

  @override
  int get hashCode {
    final _this = (this as ShadToggleTheme);

    return Object.hash(
      runtimeType,
      _this.size,
      _this.sizesTheme,
      _this.height,
      _this.padding,
      _this.backgroundColor,
      _this.hoverBackgroundColor,
      _this.selectedBackgroundColor,
      _this.selectedHoverBackgroundColor,
      _this.foregroundColor,
      _this.hoverForegroundColor,
      _this.selectedForegroundColor,
      _this.selectedHoverForegroundColor,
      _this.shadows,
      _this.decoration,
      _this.cursor,
      _this.textStyle,
      _this.gap,
    );
  }
}
