import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'progress.g.theme.dart';

@themeGen
@immutable
class ShadProgressTheme with _$ShadProgressTheme {
  const ShadProgressTheme({
    bool canMerge = true,
    this.backgroundColor,
    this.color,
    this.borderRadius,
    this.innerBorderRadius,
    this.minHeight,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadProgress.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadProgress.color}
  final Color? color;

  /// {@macro ShadProgress.borderRadius}
  final BorderRadius? borderRadius;

  /// {@macro ShadProgress.innerBorderRadius}
  final BorderRadius? innerBorderRadius;

  /// {@macro ShadProgress.minHeight}
  final double? minHeight;

  static ShadProgressTheme? lerp(
    ShadProgressTheme? a,
    ShadProgressTheme? b,
    double t,
  ) => _$ShadProgressTheme.lerp(a, b, t);
}
