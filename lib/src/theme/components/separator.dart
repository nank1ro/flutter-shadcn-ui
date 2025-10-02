import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'separator.g.theme.dart';

/// {@template ShadDividerTheme}
/// Theme for the `ShadSeparator` widget.
/// {@endtemplate}
@themeGen
@immutable
class ShadSeparatorTheme with _$ShadSeparatorTheme {
  /// {@macro ShadDividerTheme}
  const ShadSeparatorTheme({
    bool canMerge = true,
    this.verticalMargin,
    this.horizontalMargin,
    this.thickness,
    this.color,
    this.radius,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadDivider.color}
  final Color? color;

  /// {@macro ShadDivider.thickness}
  final double? thickness;

  /// The margin (or space) around the vertical divider.
  final EdgeInsetsGeometry? verticalMargin;

  /// The margin (or space) around the horizontal divider.
  final EdgeInsetsGeometry? horizontalMargin;

  /// {@macro ShadDivider.radius}
  final BorderRadiusGeometry? radius;

  static ShadSeparatorTheme? lerp(
    ShadSeparatorTheme? a,
    ShadSeparatorTheme? b,
    double t,
  ) =>
      _$ShadSeparatorTheme.lerp(a, b, t);
}
