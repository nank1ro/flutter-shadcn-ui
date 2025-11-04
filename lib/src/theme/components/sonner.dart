import 'package:flutter/widgets.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sonner.g.theme.dart';

@themeGen
@immutable
class ShadSonnerTheme with _$ShadSonnerTheme {
  const ShadSonnerTheme({
    bool canMerge = true,
    this.visibleToastsAmount,
    this.alignment,
    this.padding,
    this.expandedGap,
    this.collapsedGap,
    this.scaleFactor,
    this.animationDuration,
    this.animationCurve,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadSonner.visible_toasts_amount}
  final int? visibleToastsAmount;

  /// {@macro ShadSonner.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ShadSonner.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadSonner.expandedGap}
  final double? expandedGap;

  /// {@macro ShadSonner.collapsedGap}
  final double? collapsedGap;

  /// {@macro ShadSonner.scaleFactor}
  final double? scaleFactor;

  /// {@macro ShadSonner.animationDuration}
  final Duration? animationDuration;

  /// {@macro ShadSonner.animationCurve}
  final Curve? animationCurve;

  static ShadSonnerTheme? lerp(
    ShadSonnerTheme? a,
    ShadSonnerTheme? b,
    double t,
  ) => _$ShadSonnerTheme.lerp(a, b, t);
}
