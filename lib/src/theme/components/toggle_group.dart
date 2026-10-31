import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/toggle.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'toggle_group.g.theme.dart';

/// The theme for ShadToggleGroup.
///
/// Use this class to override some properties to all toggle groups in just
/// one place.
@themeGen
@immutable
class ShadToggleGroupTheme with _$ShadToggleGroupTheme {
  const ShadToggleGroupTheme({
    bool canMerge = true,
    this.variant,
    this.size,
    this.axis,
    this.spacing,
    this.itemPadding,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadToggleGroup.variant}
  final ShadToggleVariant? variant;

  /// {@macro ShadToggleGroup.size}
  final ShadButtonSize? size;

  /// {@macro ShadToggleGroup.axis}
  final Axis? axis;

  /// {@macro ShadToggleGroup.spacing}
  final double? spacing;

  /// {@macro ShadToggleGroupItem.padding}
  final EdgeInsetsGeometry? itemPadding;

  static ShadToggleGroupTheme? lerp(
    ShadToggleGroupTheme? a,
    ShadToggleGroupTheme? b,
    double t,
  ) => _$ShadToggleGroupTheme.lerp(a, b, t);
}
