import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

const kDefaultSelectMinWidth = 128.0;
const kDefaultSelectMaxHeight = 384.0;

@immutable
class ShadcnSelectTheme {
  const ShadcnSelectTheme({
    this.merge = true,
    this.decoration,
    this.offset,
    this.minWidth,
    this.maxHeight,
    this.padding,
    this.optionsPadding,
    this.backgroundColor,
    this.radius,
    this.border,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
  });

  final bool merge;
  final ShadcnDecorationTheme? decoration;
  final Offset? offset;
  final double? minWidth;
  final double? maxHeight;
  final EdgeInsets? padding;
  final EdgeInsets? optionsPadding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final Border? border;
  final bool? showScrollToTopChevron;
  final bool? showScrollToBottomChevron;

  static ShadcnSelectTheme lerp(
    ShadcnSelectTheme a,
    ShadcnSelectTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnSelectTheme(
      merge: b.merge,
      decoration: ShadcnDecorationTheme.lerp(a.decoration, b.decoration, t),
      offset: Offset.lerp(a.offset, b.offset, t),
      minWidth: lerpDouble(a.minWidth, b.minWidth, t),
      maxHeight: lerpDouble(a.maxHeight, b.maxHeight, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      border: Border.lerp(a.border, b.border, t),
      optionsPadding: EdgeInsets.lerp(a.optionsPadding, b.optionsPadding, t),
      showScrollToTopChevron: b.showScrollToTopChevron,
      showScrollToBottomChevron: b.showScrollToBottomChevron,
    );
  }

  ShadcnSelectTheme copyWith({
    bool? merge,
    ShadcnDecorationTheme? decoration,
    Offset? offset,
    double? minWidth,
    double? maxHeight,
    EdgeInsets? padding,
    Color? backgroundColor,
    BorderRadius? radius,
    Border? border,
    EdgeInsets? optionsPadding,
    bool? showScrollToTopChevron,
    bool? showScrollToBottomChevron,
  }) {
    return ShadcnSelectTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      offset: offset ?? this.offset,
      minWidth: minWidth ?? this.minWidth,
      maxHeight: maxHeight ?? this.maxHeight,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      radius: radius ?? this.radius,
      border: border ?? this.border,
      optionsPadding: optionsPadding ?? this.optionsPadding,
      showScrollToTopChevron:
          showScrollToTopChevron ?? this.showScrollToTopChevron,
      showScrollToBottomChevron:
          showScrollToBottomChevron ?? this.showScrollToBottomChevron,
    );
  }

  ShadcnSelectTheme mergeWith(ShadcnSelectTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: other.decoration,
      offset: other.offset,
      minWidth: other.minWidth,
      maxHeight: other.maxHeight,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      radius: other.radius,
      border: other.border,
      optionsPadding: other.optionsPadding,
      showScrollToTopChevron: other.showScrollToTopChevron,
      showScrollToBottomChevron: other.showScrollToBottomChevron,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnSelectTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.offset == offset &&
        other.minWidth == minWidth &&
        other.maxHeight == maxHeight &&
        other.padding == padding &&
        other.backgroundColor == backgroundColor &&
        other.radius == radius &&
        other.border == border &&
        other.optionsPadding == optionsPadding &&
        other.showScrollToTopChevron == showScrollToTopChevron &&
        other.showScrollToBottomChevron == showScrollToBottomChevron;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        offset.hashCode ^
        minWidth.hashCode ^
        maxHeight.hashCode ^
        padding.hashCode ^
        backgroundColor.hashCode ^
        radius.hashCode ^
        border.hashCode ^
        optionsPadding.hashCode ^
        showScrollToTopChevron.hashCode ^
        showScrollToBottomChevron.hashCode;
  }
}
