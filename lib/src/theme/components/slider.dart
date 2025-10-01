import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'slider.g.theme.dart';

@themeGen
@immutable
class ShadSliderTheme with _$ShadSliderTheme {
  const ShadSliderTheme({
    bool canMerge = true,
    this.min,
    this.max,
    this.mouseCursor,
    this.disabledMouseCursor,
    this.thumbColor,
    this.disabledThumbColor,
    this.thumbBorderColor,
    this.disabledThumbBorderColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.trackHeight,
    this.thumbRadius,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSlider.min}
  final double? min;

  /// {@macro ShadSlider.max}
  final double? max;

  /// {@macro ShadSlider.mouseCursor}
  final MouseCursor? mouseCursor;

  /// {@macro ShadSlider.disabledMouseCursor}
  final MouseCursor? disabledMouseCursor;

  /// {@macro ShadSlider.thumbColor}
  final Color? thumbColor;

  /// {@macro ShadSlider.disabledThumbColor}
  final Color? disabledThumbColor;

  /// {@macro ShadSlider.thumbBorderColor}
  final Color? thumbBorderColor;

  /// {@macro ShadSlider.disabledThumbBorderColor}
  final Color? disabledThumbBorderColor;

  /// {@macro ShadSlider.activeTrackColor}
  final Color? activeTrackColor;

  /// {@macro ShadSlider.inactiveTrackColor}
  final Color? inactiveTrackColor;

  /// {@macro ShadSlider.disabledActiveTrackColor}
  final Color? disabledActiveTrackColor;

  /// {@macro ShadSlider.disabledInactiveTrackColor}
  final Color? disabledInactiveTrackColor;

  /// {@macro ShadSlider.trackHeight}
  final double? trackHeight;

  /// {@macro ShadSlider.thumbRadius}
  final double? thumbRadius;

  static ShadSliderTheme lerp(
    ShadSliderTheme a,
    ShadSliderTheme b,
    double t,
  ) =>
      _$ShadSliderTheme.lerp(a, b, t);
}
