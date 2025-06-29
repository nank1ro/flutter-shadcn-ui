import 'dart:ui';

import 'package:flutter/material.dart';

/// The theme for breadcrumb components.
///
/// Use this class to override properties for all breadcrumb components.
@immutable
class ShadBreadcrumbTheme {
  const ShadBreadcrumbTheme({
    this.merge = true,
    this.separator,
    this.ellipsis,
    this.spacing,
    this.itemTextStyle,
    this.linkTextStyle,
    this.linkHoverTextStyle,
    this.currentPageTextStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final bool merge;

  /// The widget to use as separator between breadcrumb items.
  final Widget? separator;

  /// The widget to use as ellipsis indicator.
  final Widget? ellipsis;

  /// The spacing around separators between breadcrumb items.
  final double? spacing;

  /// The text style for breadcrumb items.
  final TextStyle? itemTextStyle;

  /// The text style for breadcrumb links.
  final TextStyle? linkTextStyle;

  /// The text style for breadcrumb links when hovered.
  final TextStyle? linkHoverTextStyle;

  /// The text style for the current page breadcrumb item.
  final TextStyle? currentPageTextStyle;

  /// How the breadcrumb children should be aligned along the main axis.
  final MainAxisAlignment? mainAxisAlignment;

  /// How the breadcrumb children should be aligned along the cross axis.
  final CrossAxisAlignment? crossAxisAlignment;

  /// Creates a copy of this theme but with the given fields replaced with
  /// the new values.
  ShadBreadcrumbTheme copyWith({
    bool? merge,
    Widget? separator,
    Widget? ellipsis,
    double? spacing,
    TextStyle? itemTextStyle,
    TextStyle? linkTextStyle,
    TextStyle? linkHoverTextStyle,
    TextStyle? currentPageTextStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return ShadBreadcrumbTheme(
      merge: merge ?? this.merge,
      separator: separator ?? this.separator,
      ellipsis: ellipsis ?? this.ellipsis,
      spacing: spacing ?? this.spacing,
      itemTextStyle: itemTextStyle ?? this.itemTextStyle,
      linkTextStyle: linkTextStyle ?? this.linkTextStyle,
      linkHoverTextStyle: linkHoverTextStyle ?? this.linkHoverTextStyle,
      currentPageTextStyle: currentPageTextStyle ?? this.currentPageTextStyle,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }

  /// Merges this theme with another [ShadBreadcrumbTheme].
  ShadBreadcrumbTheme mergeWith(ShadBreadcrumbTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      separator: other.separator,
      ellipsis: other.ellipsis,
      spacing: other.spacing,
      itemTextStyle: other.itemTextStyle,
      linkTextStyle: other.linkTextStyle,
      linkHoverTextStyle: other.linkHoverTextStyle,
      currentPageTextStyle: other.currentPageTextStyle,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
    );
  }

  /// Linearly interpolates between two [ShadBreadcrumbTheme].
  static ShadBreadcrumbTheme lerp(
    ShadBreadcrumbTheme a,
    ShadBreadcrumbTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadBreadcrumbTheme(
      merge: t < 0.5 ? a.merge : b.merge,
      separator: t < 0.5 ? a.separator : b.separator,
      ellipsis: t < 0.5 ? a.ellipsis : b.ellipsis,
      spacing: lerpDouble(a.spacing, b.spacing, t),
      itemTextStyle: TextStyle.lerp(a.itemTextStyle, b.itemTextStyle, t),
      linkTextStyle: TextStyle.lerp(a.linkTextStyle, b.linkTextStyle, t),
      linkHoverTextStyle: TextStyle.lerp(a.linkHoverTextStyle, b.linkHoverTextStyle, t),
      currentPageTextStyle: TextStyle.lerp(a.currentPageTextStyle, b.currentPageTextStyle, t),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadBreadcrumbTheme &&
        other.merge == merge &&
        other.separator == separator &&
        other.ellipsis == ellipsis &&
        other.spacing == spacing &&
        other.itemTextStyle == itemTextStyle &&
        other.linkTextStyle == linkTextStyle &&
        other.linkHoverTextStyle == linkHoverTextStyle &&
        other.currentPageTextStyle == currentPageTextStyle &&
        other.mainAxisAlignment == mainAxisAlignment &&
        other.crossAxisAlignment == crossAxisAlignment;
  }

  @override
  int get hashCode {
    return Object.hash(
      merge,
      separator,
      ellipsis,
      spacing,
      itemTextStyle,
      linkTextStyle,
      linkHoverTextStyle,
      currentPageTextStyle,
      mainAxisAlignment,
      crossAxisAlignment,
    );
  }
}
