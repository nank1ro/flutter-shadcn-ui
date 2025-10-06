import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'tooltip.g.theme.dart';

@themeGen
@immutable
class ShadTooltipTheme with _$ShadTooltipTheme {
  const ShadTooltipTheme({
    bool canMerge = true,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
    this.longPressDuration,
    this.duration,
    this.reverseDuration,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadTooltip.waitDuration}
  final Duration? waitDuration;

  /// {@macro ShadTooltip.showDuration}
  final Duration? showDuration;

  /// {@macro ShadTooltip.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadTooltip.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadTooltip.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadTooltip.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTooltip.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadTooltip.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadTooltip.duration}
  final Duration? duration;

  /// {@macro ShadTooltip.reverseDuration}
  final Duration? reverseDuration;

  static ShadTooltipTheme? lerp(
    ShadTooltipTheme? a,
    ShadTooltipTheme? b,
    double t,
  ) =>
      _$ShadTooltipTheme.lerp(a, b, t);
}
