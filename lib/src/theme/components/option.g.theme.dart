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
    if (a == null && b == null) {
      return null;
    }

    return ShadOptionTheme(
      hoveredBackgroundColor: Color.lerp(
        a?.hoveredBackgroundColor,
        b?.hoveredBackgroundColor,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      radius: BorderRadius.lerp(a?.radius, b?.radius, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      selectedBackgroundColor: Color.lerp(
        a?.selectedBackgroundColor,
        b?.selectedBackgroundColor,
        t,
      ),
      selectedTextStyle: TextStyle.lerp(
        a?.selectedTextStyle,
        b?.selectedTextStyle,
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
    final a = (this as ShadOptionTheme);

    return ShadOptionTheme(
      hoveredBackgroundColor:
          hoveredBackgroundColor ?? a.hoveredBackgroundColor,
      padding: padding ?? a.padding,
      radius: radius ?? a.radius,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      textStyle: textStyle ?? a.textStyle,
      selectedBackgroundColor:
          selectedBackgroundColor ?? a.selectedBackgroundColor,
      selectedTextStyle: selectedTextStyle ?? a.selectedTextStyle,
    );
  }

  ShadOptionTheme merge(ShadOptionTheme? other) {
    final current = (this as ShadOptionTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      hoveredBackgroundColor: other.hoveredBackgroundColor,
      padding: other.padding,
      radius: other.radius,
      backgroundColor: other.backgroundColor,
      textStyle: current.textStyle?.merge(other.textStyle) ?? other.textStyle,
      selectedBackgroundColor: other.selectedBackgroundColor,
      selectedTextStyle:
          current.selectedTextStyle?.merge(other.selectedTextStyle) ??
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

    final value = (this as ShadOptionTheme);

    return other is ShadOptionTheme &&
        other.hoveredBackgroundColor == value.hoveredBackgroundColor &&
        other.padding == value.padding &&
        other.radius == value.radius &&
        other.backgroundColor == value.backgroundColor &&
        other.textStyle == value.textStyle &&
        other.selectedBackgroundColor == value.selectedBackgroundColor &&
        other.selectedTextStyle == value.selectedTextStyle;
  }

  @override
  int get hashCode {
    final value = (this as ShadOptionTheme);

    return Object.hash(
      runtimeType,
      value.hoveredBackgroundColor,
      value.padding,
      value.radius,
      value.backgroundColor,
      value.textStyle,
      value.selectedBackgroundColor,
      value.selectedTextStyle,
    );
  }
}
