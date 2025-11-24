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
      cursorOpacityAnimates: t < 0.5
          ? a?.cursorOpacityAnimates
          : b?.cursorOpacityAnimates,
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
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      gap: lerpDouble$(a?.gap, b?.gap, t),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      scrollbarPadding: EdgeInsetsGeometry.lerp(
        a?.scrollbarPadding,
        b?.scrollbarPadding,
        t,
      ),
      verticalGap: lerpDouble$(a?.verticalGap, b?.verticalGap, t),
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
    double? verticalGap,
  }) {
    final _this = (this as ShadInputTheme);

    return ShadInputTheme(
      decoration: decoration ?? _this.decoration,
      padding: padding ?? _this.padding,
      style: style ?? _this.style,
      cursorColor: cursorColor ?? _this.cursorColor,
      cursorWidth: cursorWidth ?? _this.cursorWidth,
      cursorHeight: cursorHeight ?? _this.cursorHeight,
      cursorRadius: cursorRadius ?? _this.cursorRadius,
      cursorOpacityAnimates:
          cursorOpacityAnimates ?? _this.cursorOpacityAnimates,
      placeholderStyle: placeholderStyle ?? _this.placeholderStyle,
      alignment: alignment ?? _this.alignment,
      placeholderAlignment: placeholderAlignment ?? _this.placeholderAlignment,
      inputPadding: inputPadding ?? _this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      gap: gap ?? _this.gap,
      constraints: constraints ?? _this.constraints,
      scrollbarPadding: scrollbarPadding ?? _this.scrollbarPadding,
      verticalGap: verticalGap ?? _this.verticalGap,
    );
  }

  ShadInputTheme merge(ShadInputTheme? other) {
    final _this = (this as ShadInputTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: other.decoration,
      padding: other.padding,
      style: _this.style?.merge(other.style) ?? other.style,
      cursorColor: other.cursorColor,
      cursorWidth: other.cursorWidth,
      cursorHeight: other.cursorHeight,
      cursorRadius: other.cursorRadius,
      cursorOpacityAnimates: other.cursorOpacityAnimates,
      placeholderStyle:
          _this.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      alignment: other.alignment,
      placeholderAlignment: other.placeholderAlignment,
      inputPadding: other.inputPadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      gap: other.gap,
      constraints: other.constraints,
      scrollbarPadding: other.scrollbarPadding,
      verticalGap: other.verticalGap,
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

    final _this = (this as ShadInputTheme);
    final _other = (other as ShadInputTheme);

    return _other.decoration == _this.decoration &&
        _other.padding == _this.padding &&
        _other.style == _this.style &&
        _other.cursorColor == _this.cursorColor &&
        _other.cursorWidth == _this.cursorWidth &&
        _other.cursorHeight == _this.cursorHeight &&
        _other.cursorRadius == _this.cursorRadius &&
        _other.cursorOpacityAnimates == _this.cursorOpacityAnimates &&
        _other.placeholderStyle == _this.placeholderStyle &&
        _other.alignment == _this.alignment &&
        _other.placeholderAlignment == _this.placeholderAlignment &&
        _other.inputPadding == _this.inputPadding &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.gap == _this.gap &&
        _other.constraints == _this.constraints &&
        _other.scrollbarPadding == _this.scrollbarPadding &&
        _other.verticalGap == _this.verticalGap;
  }

  @override
  int get hashCode {
    final _this = (this as ShadInputTheme);

    return Object.hash(
      runtimeType,
      _this.decoration,
      _this.padding,
      _this.style,
      _this.cursorColor,
      _this.cursorWidth,
      _this.cursorHeight,
      _this.cursorRadius,
      _this.cursorOpacityAnimates,
      _this.placeholderStyle,
      _this.alignment,
      _this.placeholderAlignment,
      _this.inputPadding,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.gap,
      _this.constraints,
      _this.scrollbarPadding,
      _this.verticalGap,
    );
  }
}
