// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'option.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadOptionTheme {
  bool get canMerge => true;

  static ShadOptionTheme? lerp(
    ShadOptionTheme? a,
    ShadOptionTheme? b,
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

    return ShadOptionTheme(
      hoveredBackgroundColor: Color.lerp(
        a.hoveredBackgroundColor,
        b.hoveredBackgroundColor,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      selectedBackgroundColor: Color.lerp(
        a.selectedBackgroundColor,
        b.selectedBackgroundColor,
        t,
      ),
      selectedTextStyle: TextStyle.lerp(
        a.selectedTextStyle,
        b.selectedTextStyle,
        t,
      ),
    );
  }

  ShadOptionTheme copyWith({
    Color? hoveredBackgroundColor,
    EdgeInsetsGeometry? padding,
    BorderRadius? radius,
    Color? backgroundColor,
    TextStyle? textStyle,
    Color? selectedBackgroundColor,
    TextStyle? selectedTextStyle,
  }) {
    final _this = (this as ShadOptionTheme);

    return ShadOptionTheme(
      hoveredBackgroundColor:
          hoveredBackgroundColor ?? _this.hoveredBackgroundColor,
      padding: padding ?? _this.padding,
      radius: radius ?? _this.radius,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      textStyle: textStyle ?? _this.textStyle,
      selectedBackgroundColor:
          selectedBackgroundColor ?? _this.selectedBackgroundColor,
      selectedTextStyle: selectedTextStyle ?? _this.selectedTextStyle,
    );
  }

  ShadOptionTheme merge(ShadOptionTheme? other) {
    final _this = (this as ShadOptionTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      hoveredBackgroundColor: other.hoveredBackgroundColor,
      padding: other.padding,
      radius: other.radius,
      backgroundColor: other.backgroundColor,
      textStyle: _this.textStyle?.merge(other.textStyle) ?? other.textStyle,
      selectedBackgroundColor: other.selectedBackgroundColor,
      selectedTextStyle:
          _this.selectedTextStyle?.merge(other.selectedTextStyle) ??
          other.selectedTextStyle,
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

    final _this = (this as ShadOptionTheme);
    final _other = (other as ShadOptionTheme);

    return _other.hoveredBackgroundColor == _this.hoveredBackgroundColor &&
        _other.padding == _this.padding &&
        _other.radius == _this.radius &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.textStyle == _this.textStyle &&
        _other.selectedBackgroundColor == _this.selectedBackgroundColor &&
        _other.selectedTextStyle == _this.selectedTextStyle;
  }

  @override
  int get hashCode {
    final _this = (this as ShadOptionTheme);

    return Object.hash(
      runtimeType,
      _this.hoveredBackgroundColor,
      _this.padding,
      _this.radius,
      _this.backgroundColor,
      _this.textStyle,
      _this.selectedBackgroundColor,
      _this.selectedTextStyle,
    );
  }
}
