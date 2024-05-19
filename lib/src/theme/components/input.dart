import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputTheme {
  const ShadInputTheme({
    this.merge = true,
    this.decoration,
    this.padding,
    this.backgroundColor,
    this.style,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final bool merge;
  final ShadDecoration? decoration;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final TextStyle? style;
  final TextStyle? placeholderStyle;
  final Alignment? placeholderAlignment;
  final EdgeInsets? inputPadding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

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
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      style: TextStyle.lerp(a.style, b.style, t),
      placeholderStyle:
          TextStyle.lerp(a.placeholderStyle, b.placeholderStyle, t),
      inputPadding: EdgeInsets.lerp(a.inputPadding, b.inputPadding, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
    );
  }

  ShadInputTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    Color? backgroundColor,
    TextStyle? style,
    TextStyle? placeholderStyle,
    EdgeInsets? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return ShadInputTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      style: style ?? this.style,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      inputPadding: inputPadding ?? this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }

  ShadInputTheme mergeWith(ShadInputTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      style: other.style,
      placeholderStyle: other.placeholderStyle,
      inputPadding: other.inputPadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadInputTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.padding == padding &&
        other.backgroundColor == backgroundColor &&
        other.style == style &&
        other.placeholderStyle == placeholderStyle &&
        other.inputPadding == inputPadding &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        backgroundColor.hashCode ^
        style.hashCode ^
        placeholderStyle.hashCode ^
        inputPadding.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode;
  }
}
