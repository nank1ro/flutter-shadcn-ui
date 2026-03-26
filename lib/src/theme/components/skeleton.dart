import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'skeleton.g.theme.dart';

/// {@template ShadSkeletonTheme}
/// Theme for the skeleton loading placeholder widget.
/// {@endtemplate}
@themeGen
@immutable
class ShadSkeletonTheme with _$ShadSkeletonTheme {
  /// {@macro ShadSkeletonTheme}
  const ShadSkeletonTheme({
    bool canMerge = true,
    this.color,
    this.borderRadius,
    this.pulseHalfDuration,
    this.pulseCurve,
    this.minPulseOpacity,
    this.semanticsLabel,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSkeleton.color}
  final Color? color;

  /// {@macro ShadSkeleton.borderRadius}
  final BorderRadius? borderRadius;

  /// {@macro ShadSkeleton.pulseHalfDuration}
  final Duration? pulseHalfDuration;

  /// {@macro ShadSkeleton.pulseCurve}
  final Curve? pulseCurve;

  /// {@macro ShadSkeleton.minPulseOpacity}
  final double? minPulseOpacity;

  /// {@macro ShadSkeleton.semanticsLabel}
  final String? semanticsLabel;

  static ShadSkeletonTheme? lerp(
    ShadSkeletonTheme? a,
    ShadSkeletonTheme? b,
    double t,
  ) => _$ShadSkeletonTheme.lerp(a, b, t);
}
