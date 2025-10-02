import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'switch.g.theme.dart';

@themeGen
@immutable
class ShadSwitchTheme with _$ShadSwitchTheme {
  const ShadSwitchTheme({
    bool canMerge = true,
    this.thumbColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.height,
    this.margin,
    this.duration,
    this.decoration,
    this.padding,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSwitch.thumbColor}
  final Color? thumbColor;

  /// {@macro ShadSwitch.uncheckedTrackColor}
  final Color? uncheckedTrackColor;

  /// {@macro ShadSwitch.checkedTrackColor}
  final Color? checkedTrackColor;

  /// {@macro ShadSwitch.width}
  final double? width;

  /// {@macro ShadSwitch.height}
  final double? height;

  /// {@macro ShadSwitch.margin}
  final double? margin;

  /// {@macro ShadSwitch.duration}
  final Duration? duration;

  /// {@macro ShadSwitch.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadSwitch.padding}
  final EdgeInsetsGeometry? padding;

  static ShadSwitchTheme? lerp(
    ShadSwitchTheme? a,
    ShadSwitchTheme? b,
    double t,
  ) =>
      _$ShadSwitchTheme.lerp(a, b, t);
}
