import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'accordion.g.theme.dart';

@themeGen
@immutable
class ShadAccordionTheme with _$ShadAccordionTheme {
  const ShadAccordionTheme({
    bool canMerge = true,
    this.iconData,
    this.iconEffects,
    this.padding,
    this.underlineTitleOnHover,
    this.titleStyle,
    this.curve,
    this.duration,
    this.maintainState,
    this.effects,
    this.clipBehavior,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadAccordionItem.iconData}
  final IconData? iconData;

  /// {@macro ShadAccordionItem.iconEffects}
  final List<Effect<dynamic>>? iconEffects;

  /// {@macro ShadAccordionItem.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadAccordionItem.underlineTitleOnHover}
  final bool? underlineTitleOnHover;

  /// {@macro ShadAccordionItem.titleStyle}
  final TextStyle? titleStyle;

  /// {@macro ShadAccordionItem.curve}
  final Curve? curve;

  /// {@macro ShadAccordionItem.duration}
  final Duration? duration;

  /// {@macro ShadAccordion.maintainState}
  final bool? maintainState;

  /// {@macro ShadAccordionItem.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadAccordionItem.clipBehavior}
  final Clip? clipBehavior;

  static ShadAccordionTheme? lerp(
    ShadAccordionTheme? a,
    ShadAccordionTheme? b,
    double t,
  ) => _$ShadAccordionTheme.lerp(a, b, t);
}
