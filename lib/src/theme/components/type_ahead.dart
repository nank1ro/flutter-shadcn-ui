import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'type_ahead.g.theme.dart';

const kDefaultTypeAheadMinWidth = 128.0;
const kDefaultTypeAheadMaxHeight = 384.0;
const kDefaultTypeAheadDebounceDuration = Duration(milliseconds: 300);

@themeGen
@immutable
class ShadTypeAheadTheme with _$ShadTypeAheadTheme {
  const ShadTypeAheadTheme({
    bool canMerge = true,
    this.decoration,
    this.placeholderStyle,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.anchor,
    this.effects,
    this.shadows,
    this.filter,
    this.popoverReverseDuration,
    this.debounceDuration,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadTypeAhead.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTypeAhead.placeholderStyle}
  final TextStyle? placeholderStyle;

  /// {@macro ShadTypeAhead.minWidth}
  final double? minWidth;

  /// {@macro ShadTypeAhead.maxWidth}
  final double? maxWidth;

  /// {@macro ShadTypeAhead.maxHeight}
  final double? maxHeight;

  /// {@macro ShadTypeAhead.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadTypeAhead.optionsPadding}
  final EdgeInsetsGeometry? optionsPadding;

  /// {@macro ShadTypeAhead.showScrollToTopChevron}
  final bool? showScrollToTopChevron;

  /// {@macro ShadTypeAhead.showScrollToBottomChevron}
  final bool? showScrollToBottomChevron;

  /// {@macro ShadTypeAhead.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

  /// {@macro ShadTypeAhead.debounceDuration}
  final Duration? debounceDuration;

  static ShadTypeAheadTheme? lerp(
    ShadTypeAheadTheme? a,
    ShadTypeAheadTheme? b,
    double t,
  ) => _$ShadTypeAheadTheme.lerp(a, b, t);
}
