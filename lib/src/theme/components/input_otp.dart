import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'input_otp.g.theme.dart';

@themeGen
@immutable
class ShadInputOTPTheme with _$ShadInputOTPTheme {
  const ShadInputOTPTheme({
    bool canMerge = true,
    this.gap,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.firstRadius,
    this.lastRadius,
    this.singleRadius,
    this.middleRadius,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadInputOTP.gap}
  final double? gap;

  /// {@macro ShadInputOTPSlot.style}
  final TextStyle? style;

  /// {@macro ShadInputOTPSlot.width}
  final double? width;

  /// {@macro ShadInputOTPSlot.height}
  final double? height;

  /// {@macro ShadInputOTPSlot.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadInputOTPSlot.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadInputOTPSlot.firstRadius}
  final BorderRadius? firstRadius;

  /// {@macro ShadInputOTPSlot.lastRadius}
  final BorderRadius? lastRadius;

  /// {@macro ShadInputOTPSlot.singleRadius}
  final BorderRadius? singleRadius;

  /// {@macro ShadInputOTPSlot.middleRadius}
  final BorderRadius? middleRadius;

  static ShadInputOTPTheme? lerp(
    ShadInputOTPTheme? a,
    ShadInputOTPTheme? b,
    double t,
  ) => _$ShadInputOTPTheme.lerp(a, b, t);
}
