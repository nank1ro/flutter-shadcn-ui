import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'checkbox.g.theme.dart';

@themeGen
@immutable
class ShadCheckboxTheme with _$ShadCheckboxTheme {
  const ShadCheckboxTheme({
    bool canMerge = true,
    this.color,
    this.duration,
    this.decoration,
    this.size,
    this.padding,
    this.crossAxisAlignment,
    this.checkboxPadding,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadCheckbox.color}
  final Color? color;

  /// {@macro ShadCheckbox.size}
  final double? size;

  /// {@macro ShadCheckbox.duration}
  final Duration? duration;

  /// {@macro ShadCheckbox.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadCheckbox.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadCheckbox.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadCheckbox.checkboxPadding}
  final EdgeInsetsGeometry? checkboxPadding;

  static ShadCheckboxTheme lerp(
    ShadCheckboxTheme a,
    ShadCheckboxTheme b,
    double t,
  ) =>
      _$ShadCheckboxTheme.lerp(a, b, t);
}
