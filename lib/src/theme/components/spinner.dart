import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'spinner.g.theme.dart';

@themeGen
@immutable
class ShadSpinnerTheme with _$ShadSpinnerTheme {
  const ShadSpinnerTheme({
    bool canMerge = true,
    this.size,
    this.color,
    this.icon,
    this.duration,
    this.animate,
    this.semanticsLabel,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSpinner.size}
  final double? size;

  /// {@macro ShadSpinner.color}
  final Color? color;

  /// {@macro ShadSpinner.icon}
  final IconData? icon;

  /// {@macro ShadSpinner.duration}
  final Duration? duration;

  /// {@macro ShadSpinner.animate}
  final bool? animate;

  /// {@macro ShadSpinner.semanticsLabel}
  final String? semanticsLabel;

  static ShadSpinnerTheme? lerp(
    ShadSpinnerTheme? a,
    ShadSpinnerTheme? b,
    double t,
  ) => _$ShadSpinnerTheme.lerp(a, b, t);
}
