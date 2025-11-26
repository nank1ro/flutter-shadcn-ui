import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'input.g.theme.dart';

@themeGen
@immutable
class ShadInputTheme with _$ShadInputTheme {
  const ShadInputTheme({
    bool canMerge = true,
    this.decoration,
    this.padding,
    this.style,
    this.cursorColor,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.placeholderStyle,
    this.alignment,
    this.placeholderAlignment,
    this.inputPadding,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.gap,
    this.constraints,
    this.scrollbarPadding,
    this.verticalGap,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadInput.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadInput.padding}
  final EdgeInsetsGeometry? padding;

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

  /// {@macro ShadInput.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ShadInput.placeholderAlignment}
  final AlignmentGeometry? placeholderAlignment;

  /// {@macro ShadInput.inputPadding}
  final EdgeInsetsGeometry? inputPadding;

  /// {@macro ShadInput.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadInput.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadInput.gap}
  final double? gap;

  /// {@macro ShadInput.constraints}
  final BoxConstraints? constraints;

  /// {@macro ShadInput.scrollbarPadding}
  final EdgeInsetsGeometry? scrollbarPadding;

  /// {@macro ShadInput.verticalGap}
  final double? verticalGap;

  static ShadInputTheme? lerp(
    ShadInputTheme? a,
    ShadInputTheme? b,
    double t,
  ) =>
      _$ShadInputTheme.lerp(a, b, t);
}
