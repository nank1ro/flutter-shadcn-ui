import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadTextareaTheme {
  const ShadTextareaTheme({
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
    this.minHeight,
    this.maxHeight,
    this.resizable,
    this.resizeHandleBuilder,
    this.scrollbarPadding,
  });

  final bool merge;

  /// {@macro ShadTextarea.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTextarea.padding}
  final EdgeInsets? padding;

  /// {@macro ShadTextarea.style}
  final TextStyle? style;

  /// {@macro ShadTextarea.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadTextarea.placeholderAlignment}
  final AlignmentGeometry? placeholderAlignment;

  /// {@macro ShadTextarea.inputPadding}
  final EdgeInsets? inputPadding;

  /// {@macro ShadTextarea.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadTextarea.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadTextarea.gap}
  final double? gap;

  /// {@macro ShadTextarea.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadTextarea.minHeight}
  final double? minHeight;

  /// {@macro ShadTextarea.maxHeight}
  final double? maxHeight;

  /// {@macro ShadTextarea.resizable}
  final bool? resizable;

  /// {@macro ShadTextarea.resizeHandleBuilder}
  final WidgetBuilder? resizeHandleBuilder;

  /// {@macro ShadTextarea.scrollbarPadding}
  final EdgeInsets? scrollbarPadding;

  static ShadTextareaTheme lerp(
    ShadTextareaTheme a,
    ShadTextareaTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTextareaTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      style: TextStyle.lerp(a.style, b.style, t),
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
      minHeight: t < 0.5 ? a.minHeight : b.minHeight,
      maxHeight: t < 0.5 ? a.maxHeight : b.maxHeight,
      resizable: t < 0.5 ? a.resizable : b.resizable,
      resizeHandleBuilder:
          t < 0.5 ? a.resizeHandleBuilder : b.resizeHandleBuilder,
      scrollbarPadding:
          EdgeInsets.lerp(a.scrollbarPadding, b.scrollbarPadding, t),
    );
  }

  ShadTextareaTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    TextStyle? style,
    TextStyle? placeholderStyle,
    AlignmentGeometry? placeholderAlignment,
    EdgeInsets? inputPadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? gap,
    BoxConstraints? constraints,
    double? minHeight,
    double? maxHeight,
    bool? resizable,
    WidgetBuilder? resizeHandleBuilder,
    EdgeInsets? scrollbarPadding,
  }) {
    return ShadTextareaTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      style: style ?? this.style,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      placeholderAlignment: placeholderAlignment ?? this.placeholderAlignment,
      inputPadding: inputPadding ?? this.inputPadding,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      gap: gap ?? this.gap,
      constraints: constraints ?? this.constraints,
      minHeight: minHeight ?? this.minHeight,
      maxHeight: maxHeight ?? this.maxHeight,
      resizable: resizable ?? this.resizable,
      resizeHandleBuilder: resizeHandleBuilder ?? this.resizeHandleBuilder,
      scrollbarPadding: scrollbarPadding ?? this.scrollbarPadding,
    );
  }

  ShadTextareaTheme mergeWith(ShadTextareaTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      padding: other.padding,
      style: other.style,
      placeholderStyle: other.placeholderStyle,
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShadTextareaTheme &&
          runtimeType == other.runtimeType &&
          merge == other.merge &&
          decoration == other.decoration &&
          padding == other.padding &&
          style == other.style &&
          placeholderStyle == other.placeholderStyle &&
          placeholderAlignment == other.placeholderAlignment &&
          inputPadding == other.inputPadding &&
          mainAxisAlignment == other.mainAxisAlignment &&
          crossAxisAlignment == other.crossAxisAlignment &&
          gap == other.gap &&
          constraints == other.constraints &&
          minHeight == other.minHeight &&
          maxHeight == other.maxHeight &&
          resizable == other.resizable &&
          resizeHandleBuilder == other.resizeHandleBuilder &&
          scrollbarPadding == other.scrollbarPadding;

  @override
  int get hashCode =>
      merge.hashCode ^
      decoration.hashCode ^
      padding.hashCode ^
      style.hashCode ^
      placeholderStyle.hashCode ^
      placeholderAlignment.hashCode ^
      inputPadding.hashCode ^
      mainAxisAlignment.hashCode ^
      crossAxisAlignment.hashCode ^
      gap.hashCode ^
      constraints.hashCode ^
      minHeight.hashCode ^
      maxHeight.hashCode ^
      resizable.hashCode ^
      resizeHandleBuilder.hashCode ^
      scrollbarPadding.hashCode;
}
