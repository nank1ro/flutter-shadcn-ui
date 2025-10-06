// The theme for an individual size of ShadButton.
import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'button_sizes.g.theme.dart';

@themeGen
@immutable
class ShadButtonSizeTheme with _$ShadButtonSizeTheme {
  const ShadButtonSizeTheme({
    bool canMerge = true,
    required this.height,
    required this.padding,
    this.width,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  final double height;
  final EdgeInsetsGeometry padding;
  final double? width;

  static ShadButtonSizeTheme? lerp(
    ShadButtonSizeTheme? a,
    ShadButtonSizeTheme? b,
    double t,
  ) {
    return _$ShadButtonSizeTheme.lerp(a, b, t);
  }
}

/// {@template ShadButtonSizesTheme}
/// The theme for the predefined sizes of ShadButton.
/// {@endtemplate}
@themeGen
@immutable
class ShadButtonSizesTheme with _$ShadButtonSizesTheme {
  const ShadButtonSizesTheme({
    bool canMerge = true,
    this.regular,
    this.sm,
    this.lg,
    this.icon,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  final ShadButtonSizeTheme? regular;
  final ShadButtonSizeTheme? sm;
  final ShadButtonSizeTheme? lg;
  final ShadButtonSizeTheme? icon;

  static ShadButtonSizesTheme? lerp(
    ShadButtonSizesTheme? a,
    ShadButtonSizesTheme? b,
    double t,
  ) =>
      _$ShadButtonSizesTheme.lerp(a, b, t);
}
