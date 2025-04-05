import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputTheme {
  const ShadInputTheme({
    this.merge = true,
    this.decoration,
    this.padding,
    this.style,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.gap,
    this.constraints,
  });

  final bool merge;

  /// {@macro ShadInput.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadInput.padding}
  final EdgeInsets? padding;

  /// {@macro ShadInput.style}
  final TextStyle? style;

  /// {@macro ShadInput.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadInput.placeholderAlignment}
  final Alignment? placeholderAlignment;

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
      placeholderStyle:
          TextStyle.lerp(a.placeholderStyle, b.placeholderStyle, t),
      inputPadding: EdgeInsets.lerp(a.inputPadding, b.inputPadding, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      gap: t < 0.5 ? a.gap : b.gap,
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t),
    );
  }

  ShadInputTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    TextStyle? style,
    TextStyle? placeholderStyle,
    EdgeInsets? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? gap,
    BoxConstraints? constraints,
  }) {
    return ShadInputTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      style: style ?? this.style,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      inputPadding: inputPadding ?? this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      gap: gap ?? this.gap,
      constraints: constraints ?? this.constraints,
    );
  }

  ShadInputTheme mergeWith(ShadInputTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      padding: other.padding,
      style: other.style,
      placeholderStyle: other.placeholderStyle,
      inputPadding: other.inputPadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      gap: other.gap,
      constraints: other.constraints,
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
        other.placeholderStyle == placeholderStyle &&
        other.inputPadding == inputPadding &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.gap == gap &&
        other.constraints == constraints;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        style.hashCode ^
        placeholderStyle.hashCode ^
        inputPadding.hashCode ^
        mainAxisAlignment.hashCode ^
        crossAxisAlignment.hashCode ^
        gap.hashCode ^
        constraints.hashCode;
  }
}
