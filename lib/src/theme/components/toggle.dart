import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/button_sizes.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'toggle.g.theme.dart';

/// The theme for ShadToggle.
///
/// Use this class to override some properties to all toggles in just one
/// place.
@themeGen
@immutable
class ShadToggleTheme with _$ShadToggleTheme {
  const ShadToggleTheme({
    bool canMerge = true,
    this.size,
    this.sizesTheme,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.selectedBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.selectedForegroundColor,
    this.selectedHoverForegroundColor,
    this.shadows,
    this.decoration,
    this.cursor,
    this.textStyle,
    this.gap,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadToggle.size}
  final ShadButtonSize? size;

  /// The sizes of the toggle, overrides `ShadThemeData.toggleSizesTheme`.
  final ShadButtonSizesTheme? sizesTheme;

  /// {@macro ShadToggle.height}
  final double? height;

  /// {@macro ShadToggle.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadToggle.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadToggle.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadToggle.selectedBackgroundColor}
  final Color? selectedBackgroundColor;

  /// {@macro ShadToggle.selectedHoverBackgroundColor}
  final Color? selectedHoverBackgroundColor;

  /// {@macro ShadToggle.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadToggle.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ShadToggle.selectedForegroundColor}
  final Color? selectedForegroundColor;

  /// {@macro ShadToggle.selectedHoverForegroundColor}
  final Color? selectedHoverForegroundColor;

  /// {@macro ShadToggle.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadToggle.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadToggle.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadToggle.textStyle}
  final TextStyle? textStyle;

  /// {@macro ShadToggle.gap}
  final double? gap;

  static ShadToggleTheme? lerp(
    ShadToggleTheme? a,
    ShadToggleTheme? b,
    double t,
  ) => _$ShadToggleTheme.lerp(a, b, t);
}
