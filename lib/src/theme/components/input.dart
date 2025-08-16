import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputTheme {
  const ShadInputTheme({
    this.merge = true,
    this.decoration,
    this.padding,
    this.style,
    this.cursorColor,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.gap,
    this.constraints,
    this.scrollbarPadding,
  });

  final bool merge;

  /// {@macro ShadInput.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadInput.padding}
  final EdgeInsets? padding;

  /// {@macro ShadInput.style}
  final TextStyle? style;

  /// {@macro ShadInput.cursorColor}
  final Color? cursorColor;

  /// {@macro ShadInput.cursorWidth}
  final double? cursorWidth;

  /// {@macro ShadInput.cursorHeight}
  final double? cursorHeight;

  /// {@macro ShadInput.cursorRadius}
  final Radius? cursorRadius;

  /// {@macro ShadInput.cursorOpacityAnimates}
  final bool? cursorOpacityAnimates;

  /// {@macro ShadInput.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadInput.placeholderAlignment}
  final AlignmentGeometry? placeholderAlignment;

  /// {@macro ShadInput.inputPadding}
  final EdgeInsets? inputPadding;

  /// {@macro ShadInput.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadInput.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadInput.gap}
  final double? gap;

  /// {@macro ShadInput.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadInput.scrollbarPadding}
  final EdgeInsets? scrollbarPadding;

  static ShadInputTheme lerp(
    ShadInputTheme a,
    ShadInputTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadInputTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      style: TextStyle.lerp(a.style, b.style, t),
      cursorColor: Color.lerp(a.cursorColor, b.cursorColor, t),
      cursorWidth: t < 0.5 ? a.cursorWidth : b.cursorWidth,
      cursorHeight: t < 0.5 ? a.cursorHeight : b.cursorHeight,
      cursorRadius: t < 0.5 ? a.cursorRadius : b.cursorRadius,
      cursorOpacityAnimates:
          t < 0.5 ? a.cursorOpacityAnimates : b.cursorOpacityAnimates,
      placeholderStyle:
          TextStyle.lerp(a.placeholderStyle, b.placeholderStyle, t),
      placeholderAlignment: AlignmentGeometry.lerp(
        a.placeholderAlignment,
        b.placeholderAlignment,
        t,
      ),
      inputPadding: EdgeInsets.lerp(a.inputPadding, b.inputPadding, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      gap: t < 0.5 ? a.gap : b.gap,
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
      scrollbarPadding: EdgeInsets.lerp(
        a.scrollbarPadding,
        b.scrollbarPadding,
        t,
      ),
    );
  }

  ShadInputTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    TextStyle? style,
    Color? cursorColor,
    double? cursorWidth,
    double? cursorHeight,
    Radius? cursorRadius,
    bool? cursorOpacityAnimates,
    TextStyle? placeholderStyle,
    AlignmentGeometry? placeholderAlignment,
    EdgeInsets? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? gap,
    BoxConstraints? constraints,
    EdgeInsets? scrollbarPadding,
  }) {
    return ShadInputTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      style: style ?? this.style,
      cursorColor: cursorColor ?? this.cursorColor,
      cursorWidth: cursorWidth ?? this.cursorWidth,
      cursorHeight: cursorHeight ?? this.cursorHeight,
      cursorRadius: cursorRadius ?? this.cursorRadius,
      cursorOpacityAnimates:
          cursorOpacityAnimates ?? this.cursorOpacityAnimates,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      placeholderAlignment: placeholderAlignment ?? this.placeholderAlignment,
      inputPadding: inputPadding ?? this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      gap: gap ?? this.gap,
      constraints: constraints ?? this.constraints,
      scrollbarPadding: scrollbarPadding ?? this.scrollbarPadding,
    );
  }

  ShadInputTheme mergeWith(ShadInputTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      padding: other.padding,
      style: other.style,
      cursorColor: other.cursorColor ?? cursorColor,
      cursorWidth: other.cursorWidth ?? cursorWidth,
      cursorHeight: other.cursorHeight ?? cursorHeight,
      cursorRadius: other.cursorRadius ?? cursorRadius,
      cursorOpacityAnimates: other.cursorOpacityAnimates,
      placeholderStyle: other.placeholderStyle,
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
    if (identical(this, other)) return true;

    return other is ShadInputTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.padding == padding &&
        other.style == style &&
        other.cursorColor == cursorColor &&
        other.cursorWidth == cursorWidth &&
        other.cursorHeight == cursorHeight &&
        other.cursorRadius == cursorRadius &&
        other.cursorOpacityAnimates == cursorOpacityAnimates &&
        other.placeholderStyle == placeholderStyle &&
        other.placeholderAlignment == placeholderAlignment &&
        other.inputPadding == inputPadding &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.gap == gap &&
        other.constraints == constraints &&
        other.scrollbarPadding == scrollbarPadding;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        style.hashCode ^
        cursorColor.hashCode ^
        cursorWidth.hashCode ^
        cursorHeight.hashCode ^
        cursorRadius.hashCode ^
        cursorOpacityAnimates.hashCode ^
        placeholderStyle.hashCode ^
        placeholderAlignment.hashCode ^
        inputPadding.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        gap.hashCode ^
        constraints.hashCode ^
        scrollbarPadding.hashCode;
  }
}
