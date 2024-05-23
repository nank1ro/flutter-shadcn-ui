import 'dart:ui';

import 'package:flutter/widgets.dart';
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
    this.maxHeight,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.anchor,
    this.searchPadding,
    this.clearSearchOnClose,
  });

  final bool merge;
  final ShadDecoration? decoration;
  final double? minWidth;
  final double? maxHeight;
  final EdgeInsets? padding;
  final EdgeInsets? optionsPadding;
  final bool? showScrollToTopChevron;
  final bool? showScrollToBottomChevron;
  final ShadAnchorBase? anchor;
  final EdgeInsets? searchPadding;
  final bool? clearSearchOnClose;

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
      maxHeight: lerpDouble(a.maxHeight, b.maxHeight, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      optionsPadding: EdgeInsets.lerp(a.optionsPadding, b.optionsPadding, t),
      showScrollToTopChevron: b.showScrollToTopChevron,
      showScrollToBottomChevron: b.showScrollToBottomChevron,
      anchor: b.anchor,
      searchPadding: EdgeInsets.lerp(a.searchPadding, b.searchPadding, t),
      clearSearchOnClose: t < 0.5 ? a.clearSearchOnClose : b.clearSearchOnClose,
    );
  }

  ShadSelectTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    double? minWidth,
    double? maxHeight,
    EdgeInsets? padding,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
    ShadAnchorBase? anchor,
    EdgeInsets? searchPadding,
    bool? clearSearchOnClose,
  }) {
    return ShadSelectTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      minWidth: minWidth ?? this.minWidth,
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
    );
  }

  ShadSelectTheme mergeWith(ShadSelectTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      minWidth: other.minWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
      anchor: other.anchor,
      searchPadding: other.searchPadding,
      clearSearchOnClose: other.clearSearchOnClose,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSelectTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.minWidth == minWidth &&
        other.maxHeight == maxHeight &&
        other.padding == padding &&
        other.optionsPadding == optionsPadding &&
        other.showScrollToTopChevron == showScrollToTopChevron &&
        other.showScrollToBottomChevron == showScrollToBottomChevron &&
        other.anchor == anchor &&
        other.searchPadding == searchPadding &&
        other.clearSearchOnClose == clearSearchOnClose;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        minWidth.hashCode ^
        maxHeight.hashCode ^
        padding.hashCode ^
        optionsPadding.hashCode ^
        showScrollToTopChevron.hashCode ^
        showScrollToBottomChevron.hashCode ^
        anchor.hashCode ^
        searchPadding.hashCode ^
        clearSearchOnClose.hashCode;
  }
}
