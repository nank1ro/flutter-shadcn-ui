import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

const kDefaultSelectMinWidth = 128.0;
const kDefaultSelectMaxHeight = 384.0;

@immutable
class ShadSelectTheme {
  const ShadSelectTheme({
    this.merge = true,
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
  });

  final bool merge;
  final ShadDecoration? decoration;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final EdgeInsets? padding;
  final EdgeInsets? optionsPadding;
  final bool? showScrollToTopChevron;
  final bool? showScrollToBottomChevron;
  final ShadAnchorBase? anchor;
  final EdgeInsets? searchPadding;
  final bool? clearSearchOnClose;

  /// {@macro popover.filter}
  final ImageFilter? filter;

  /// {@macro popover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro popover.shadows}
  final List<BoxShadow>? shadows;

  static ShadSelectTheme lerp(
    ShadSelectTheme a,
    ShadSelectTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSelectTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      minWidth: lerpDouble(a.minWidth, b.minWidth, t),
      maxWidth: lerpDouble(a.maxWidth, b.maxWidth, t),
      maxHeight: lerpDouble(a.maxHeight, b.maxHeight, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      optionsPadding: EdgeInsets.lerp(a.optionsPadding, b.optionsPadding, t),
      showScrollToTopChevron:
          t < 0.5 ? a.showScrollToTopChevron : b.showScrollToTopChevron,
      showScrollToBottomChevron:
          t < 0.5 ? a.showScrollToBottomChevron : b.showScrollToBottomChevron,
      anchor: t < 0.5 ? a.anchor : b.anchor,
      searchPadding: EdgeInsets.lerp(a.searchPadding, b.searchPadding, t),
      clearSearchOnClose: t < 0.5 ? a.clearSearchOnClose : b.clearSearchOnClose,
      effects: t < 0.5 ? a.effects : b.effects,
      shadows: t < 0.5 ? a.shadows : b.shadows,
    );
  }

  ShadSelectTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    double? minWidth,
    double? maxWidth,
    double? maxHeight,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ShadAnchorBase? anchor,
    EdgeInsets? searchPadding,
    bool? clearSearchOnClose,
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    ImageFilter? filter,
  }) {
    return ShadSelectTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      maxHeight: maxHeight ?? this.maxHeight,
      padding: padding ?? this.padding,
      optionsPadding: optionsPadding ?? this.optionsPadding,
      showScrollToTopChevron:
          showScrollToTopChevron ?? this.showScrollToTopChevron,
      showScrollToBottomChevron:
          showScrollToBottomChevron ?? this.showScrollToBottomChevron,
      anchor: anchor ?? this.anchor,
      searchPadding: searchPadding ?? this.searchPadding,
      clearSearchOnClose: clearSearchOnClose ?? this.clearSearchOnClose,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      filter: filter ?? this.filter,
    );
  }

  ShadSelectTheme mergeWith(ShadSelectTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      minWidth: other.minWidth,
      maxWidth: other.maxWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
      anchor: other.anchor,
      searchPadding: other.searchPadding,
      clearSearchOnClose: other.clearSearchOnClose,
      effects: other.effects,
      shadows: other.shadows,
      filter: other.filter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSelectTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.minWidth == minWidth &&
        other.maxWidth == maxWidth &&
        other.maxHeight == maxHeight &&
        other.padding == padding &&
        other.optionsPadding == optionsPadding &&
        other.showScrollToTopChevron == showScrollToTopChevron &&
        other.showScrollToBottomChevron == showScrollToBottomChevron &&
        other.anchor == anchor &&
        other.searchPadding == searchPadding &&
        other.clearSearchOnClose == clearSearchOnClose &&
        other.effects == effects &&
        other.shadows == shadows &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        minWidth.hashCode ^
        maxWidth.hashCode ^
        maxHeight.hashCode ^
        padding.hashCode ^
        optionsPadding.hashCode ^
        showScrollToTopChevron.hashCode ^
        showScrollToBottomChevron.hashCode ^
        anchor.hashCode ^
        searchPadding.hashCode ^
        clearSearchOnClose.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        filter.hashCode;
  }
}
