import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'popover.g.theme.dart';

@themeGen
@immutable
class ShadPopoverTheme with _$ShadPopoverTheme {
  const ShadPopoverTheme({
    bool canMerge = true,
    this.effects,
    this.shadows,
    this.reverseDuration,
    this.padding,
    this.decoration,
    this.anchor,
    this.filter,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadPopover.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadPopover.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? reverseDuration;

  static ShadPopoverTheme? lerp(
    ShadPopoverTheme? a,
    ShadPopoverTheme? b,
    double t,
  ) =>
      _$ShadPopoverTheme.lerp(a, b, t);
}
