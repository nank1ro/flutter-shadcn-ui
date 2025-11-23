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
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      gap: lerpDouble$(a?.gap, b?.gap, t),
      constraints: BoxConstraints.lerp(a?.constraints, b?.constraints, t),
      minHeight: lerpDouble$(a?.minHeight, b?.minHeight, t),
      maxHeight: lerpDouble$(a?.maxHeight, b?.maxHeight, t),
      resizable: t < 0.5 ? a?.resizable : b?.resizable,
      resizeHandleBuilder: t < 0.5
          ? a?.resizeHandleBuilder
          : b?.resizeHandleBuilder,
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
    final a = (this as ShadTextareaTheme);

    return ShadTextareaTheme(
      decoration: decoration ?? a.decoration,
      padding: padding ?? a.padding,
      style: style ?? a.style,
      placeholderStyle: placeholderStyle ?? a.placeholderStyle,
      placeholderAlignment: placeholderAlignment ?? a.placeholderAlignment,
      inputPadding: inputPadding ?? a.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      gap: gap ?? a.gap,
      constraints: constraints ?? a.constraints,
      minHeight: minHeight ?? a.minHeight,
      maxHeight: maxHeight ?? a.maxHeight,
      resizable: resizable ?? a.resizable,
      resizeHandleBuilder: resizeHandleBuilder ?? a.resizeHandleBuilder,
      scrollbarPadding: scrollbarPadding ?? a.scrollbarPadding,
    );
  }

  ShadTextareaTheme merge(ShadTextareaTheme? other) {
    final current = (this as ShadTextareaTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration:
          current.decoration?.merge(other.decoration) ?? other.decoration,
      padding: other.padding,
      style: current.style?.merge(other.style) ?? other.style,
      placeholderStyle:
          current.placeholderStyle?.merge(other.placeholderStyle) ??
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

    if (other is! ShadTextareaTheme) {
      return false;
    }

    final value = (this as ShadTextareaTheme);

    return other.decoration == value.decoration &&
        other.padding == value.padding &&
        other.style == value.style &&
        other.placeholderStyle == value.placeholderStyle &&
        other.placeholderAlignment == value.placeholderAlignment &&
        other.inputPadding == value.inputPadding &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.gap == value.gap &&
        other.constraints == value.constraints &&
        other.minHeight == value.minHeight &&
        other.maxHeight == value.maxHeight &&
        other.resizable == value.resizable &&
        other.resizeHandleBuilder == value.resizeHandleBuilder &&
        other.scrollbarPadding == value.scrollbarPadding;
  }

  @override
  int get hashCode {
    final value = (this as ShadTextareaTheme);

    return Object.hash(
      runtimeType,
      value.decoration,
      value.padding,
      value.style,
      value.placeholderStyle,
      value.placeholderAlignment,
      value.inputPadding,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.gap,
      value.constraints,
      value.minHeight,
      value.maxHeight,
      value.resizable,
      value.resizeHandleBuilder,
      value.scrollbarPadding,
    );
  }
}
