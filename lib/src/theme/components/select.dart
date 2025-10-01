import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';
part 'select.g.theme.dart';

const kDefaultSelectMinWidth = 128.0;
const kDefaultSelectMaxHeight = 384.0;

@themeGen
@immutable
class ShadSelectTheme with _$ShadSelectTheme {
  const ShadSelectTheme({
    bool canMerge = true,
    this.decoration,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.anchor,
    this.searchPadding,
    this.clearSearchOnClose,
    this.effects,
    this.shadows,
    this.filter,
    this.popoverReverseDuration,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

  /// {@macro ShadSelect.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadSelect.minWidth}
  final double? minWidth;

  /// {@macro ShadSelect.maxWidth}
  final double? maxWidth;

  /// {@macro ShadSelect.maxHeight}
  final double? maxHeight;

  /// {@macro ShadSelect.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadSelect.optionsPadding}
  final EdgeInsetsGeometry? optionsPadding;

  /// {@macro ShadSelect.showScrollToTopChevron}
  final bool? showScrollToTopChevron;

  /// {@macro ShadSelect.showScrollToBottomChevron}
  final bool? showScrollToBottomChevron;

  /// {@macro ShadSelect.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadSelect.searchPadding}
  final EdgeInsetsGeometry? searchPadding;

  /// {@macro ShadSelect.clearSearchOnClose}
  final bool? clearSearchOnClose;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  static ShadSelectTheme lerp(
    ShadSelectTheme a,
    ShadSelectTheme b,
    double t,
  ) =>
      _$ShadSelectTheme.lerp(a, b, t);
}
