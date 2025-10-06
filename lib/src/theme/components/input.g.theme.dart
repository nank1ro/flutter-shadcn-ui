// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'input.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadInputTheme {
  bool get canMerge => true;

  static ShadInputTheme? lerp(ShadInputTheme? a, ShadInputTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }

    return ShadInputTheme(
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      style: TextStyle.lerp(a?.style, b?.style, t),
      cursorColor: Color.lerp(a?.cursorColor, b?.cursorColor, t),
      cursorWidth: lerpDouble$(a?.cursorWidth, b?.cursorWidth, t),
      cursorHeight: lerpDouble$(a?.cursorHeight, b?.cursorHeight, t),
      cursorRadius: Radius.lerp(a?.cursorRadius, b?.cursorRadius, t),
      cursorOpacityAnimates:
          t < 0.5 ? a?.cursorOpacityAnimates : b?.cursorOpacityAnimates,
      placeholderStyle: TextStyle.lerp(
        a?.placeholderStyle,
        b?.placeholderStyle,
        t,
      ),
      alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t),
      placeholderAlignment: AlignmentGeometry.lerp(
        a?.placeholderAlignment,
        b?.placeholderAlignment,
        t,
      ),
      inputPadding: EdgeInsetsGeometry.lerp(
        a?.inputPadding,
        b?.inputPadding,
        t,
      ),
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      gap: lerpDouble$(a?.gap, b?.gap, t),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      scrollbarPadding: EdgeInsetsGeometry.lerp(
        a?.scrollbarPadding,
        b?.scrollbarPadding,
        t,
      ),
    );
  }

  ShadInputTheme copyWith({
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    TextStyle? style,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? cursorOpacityAnimates,
    TextStyle? placeholderStyle,
    AlignmentGeometry? alignment,
    AlignmentGeometry? placeholderAlignment,
    EdgeInsetsGeometry? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? gap,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? scrollbarPadding,
  }) {
    final a = (this as ShadInputTheme);

    return ShadInputTheme(
      decoration: decoration ?? a.decoration,
      padding: padding ?? a.padding,
      style: style ?? a.style,
      cursorColor: cursorColor ?? a.cursorColor,
      cursorWidth: cursorWidth ?? a.cursorWidth,
      cursorHeight: cursorHeight ?? a.cursorHeight,
      cursorRadius: cursorRadius ?? a.cursorRadius,
      cursorOpacityAnimates: cursorOpacityAnimates ?? a.cursorOpacityAnimates,
      placeholderStyle: placeholderStyle ?? a.placeholderStyle,
      alignment: alignment ?? a.alignment,
      placeholderAlignment: placeholderAlignment ?? a.placeholderAlignment,
      inputPadding: inputPadding ?? a.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      gap: gap ?? a.gap,
      constraints: constraints ?? a.constraints,
      scrollbarPadding: scrollbarPadding ?? a.scrollbarPadding,
    );
  }

  ShadInputTheme merge(ShadInputTheme? other) {
    final current = (this as ShadInputTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: other.decoration,
      padding: other.padding,
      style: current.style?.merge(other.style) ?? other.style,
      cursorColor: other.cursorColor,
      cursorWidth: other.cursorWidth,
      cursorHeight: other.cursorHeight,
      cursorRadius: other.cursorRadius,
      cursorOpacityAnimates: other.cursorOpacityAnimates,
      placeholderStyle:
          current.placeholderStyle?.merge(other.placeholderStyle) ??
              other.placeholderStyle,
      alignment: other.alignment,
      placeholderAlignment: other.placeholderAlignment,
      inputPadding: other.inputPadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      gap: other.gap,
      constraints: other.constraints,
      scrollbarPadding: other.scrollbarPadding,
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

    final value = (this as ShadInputTheme);

    return other is ShadInputTheme &&
        other.decoration == value.decoration &&
        other.padding == value.padding &&
        other.style == value.style &&
        other.cursorColor == value.cursorColor &&
        other.cursorWidth == value.cursorWidth &&
        other.cursorHeight == value.cursorHeight &&
        other.cursorRadius == value.cursorRadius &&
        other.cursorOpacityAnimates == value.cursorOpacityAnimates &&
        other.placeholderStyle == value.placeholderStyle &&
        other.alignment == value.alignment &&
        other.placeholderAlignment == value.placeholderAlignment &&
        other.inputPadding == value.inputPadding &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.gap == value.gap &&
        other.constraints == value.constraints &&
        other.scrollbarPadding == value.scrollbarPadding;
  }

  @override
  int get hashCode {
    final value = (this as ShadInputTheme);

    return Object.hash(
      runtimeType,
      value.decoration,
      value.padding,
      value.style,
      value.cursorColor,
      value.cursorWidth,
      value.cursorHeight,
      value.cursorRadius,
      value.cursorOpacityAnimates,
      value.placeholderStyle,
      value.alignment,
      value.placeholderAlignment,
      value.inputPadding,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.gap,
      value.constraints,
      value.scrollbarPadding,
    );
  }
}
