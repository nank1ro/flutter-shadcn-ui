// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'textarea.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTextareaTheme {
  bool get canMerge => true;

  static ShadTextareaTheme? lerp(
    ShadTextareaTheme? a,
    ShadTextareaTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadTextareaTheme(
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      style: TextStyle.lerp(a?.style, b?.style, t),
      placeholderStyle: TextStyle.lerp(
        a?.placeholderStyle,
        b?.placeholderStyle,
        t,
      ),
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
      minHeight: lerpDouble$(a?.minHeight, b?.minHeight, t),
      maxHeight: lerpDouble$(a?.maxHeight, b?.maxHeight, t),
      resizable: t < 0.5 ? a?.resizable : b?.resizable,
      resizeHandleBuilder:
          t < 0.5 ? a?.resizeHandleBuilder : b?.resizeHandleBuilder,
      scrollbarPadding: EdgeInsetsGeometry.lerp(
        a?.scrollbarPadding,
        b?.scrollbarPadding,
        t,
      ),
    );
  }

  ShadTextareaTheme copyWith({
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    TextStyle? style,
    TextStyle? placeholderStyle,
    AlignmentGeometry? placeholderAlignment,
    EdgeInsetsGeometry? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? gap,
    BoxConstraints? constraints,
    double? minHeight,
    double? maxHeight,
    bool? resizable,
    Widget Function(BuildContext)? resizeHandleBuilder,
    EdgeInsetsGeometry? scrollbarPadding,
  }) {
    final _this = (this as ShadTextareaTheme);

    return ShadTextareaTheme(
      decoration: decoration ?? _this.decoration,
      padding: padding ?? _this.padding,
      style: style ?? _this.style,
      placeholderStyle: placeholderStyle ?? _this.placeholderStyle,
      placeholderAlignment: placeholderAlignment ?? _this.placeholderAlignment,
      inputPadding: inputPadding ?? _this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      gap: gap ?? _this.gap,
      constraints: constraints ?? _this.constraints,
      minHeight: minHeight ?? _this.minHeight,
      maxHeight: maxHeight ?? _this.maxHeight,
      resizable: resizable ?? _this.resizable,
      resizeHandleBuilder: resizeHandleBuilder ?? _this.resizeHandleBuilder,
      scrollbarPadding: scrollbarPadding ?? _this.scrollbarPadding,
    );
  }

  ShadTextareaTheme merge(ShadTextareaTheme? other) {
    final _this = (this as ShadTextareaTheme);

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
      placeholderStyle: _this.placeholderStyle?.merge(other.placeholderStyle) ??
          other.placeholderStyle,
      placeholderAlignment: other.placeholderAlignment,
      inputPadding: other.inputPadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      gap: other.gap,
      constraints: other.constraints,
      minHeight: other.minHeight,
      maxHeight: other.maxHeight,
      resizable: other.resizable,
      resizeHandleBuilder: other.resizeHandleBuilder,
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

    final _this = (this as ShadTextareaTheme);
    final _other = (other as ShadTextareaTheme);

    return _other.decoration == _this.decoration &&
        _other.padding == _this.padding &&
        _other.style == _this.style &&
        _other.placeholderStyle == _this.placeholderStyle &&
        _other.placeholderAlignment == _this.placeholderAlignment &&
        _other.inputPadding == _this.inputPadding &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.gap == _this.gap &&
        _other.constraints == _this.constraints &&
        _other.minHeight == _this.minHeight &&
        _other.maxHeight == _this.maxHeight &&
        _other.resizable == _this.resizable &&
        _other.resizeHandleBuilder == _this.resizeHandleBuilder &&
        _other.scrollbarPadding == _this.scrollbarPadding;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTextareaTheme);

    return Object.hash(
      runtimeType,
      _this.decoration,
      _this.padding,
      _this.style,
      _this.placeholderStyle,
      _this.placeholderAlignment,
      _this.inputPadding,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.gap,
      _this.constraints,
      _this.minHeight,
      _this.maxHeight,
      _this.resizable,
      _this.resizeHandleBuilder,
      _this.scrollbarPadding,
    );
  }
}
