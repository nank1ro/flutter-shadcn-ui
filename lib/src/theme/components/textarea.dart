import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'textarea.g.theme.dart';

@themeGen
@immutable
class ShadTextareaTheme with _$ShadTextareaTheme {
  const ShadTextareaTheme({
    bool canMerge = true,
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
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadTextarea.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTextarea.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadTextarea.style}
  final TextStyle? style;

  /// {@macro ShadTextarea.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadTextarea.placeholderAlignment}
  final AlignmentGeometry? placeholderAlignment;

  /// {@macro ShadTextarea.inputPadding}
  final EdgeInsetsGeometry? inputPadding;

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
  final EdgeInsetsGeometry? scrollbarPadding;

  static ShadTextareaTheme? lerp(
    ShadTextareaTheme? a,
    ShadTextareaTheme? b,
    double t,
  ) => _$ShadTextareaTheme.lerp(a, b, t);
}
