import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadSidebarScaffoldTheme {
  const ShadSidebarScaffoldTheme({
    this.keyboardShortcut,
    this.mobileBreakPoint,
    this.side,
    this.variant,
    this.initiallyExtended,
    this.animationDuration,
    this.animationCurve,
    this.collapsedToIconsWidth,
    this.extendedWidth,
    this.mobileWidth,
    this.collapseMode,
    this.sidebarBorderColor,
    this.merge = true,
  });

  final bool merge;

  // {{@macro ShadSidebarScaffold.side}}
  final ShadSidebarSide? side;

  // {{@macro ShadSidebarScaffold.variant}}
  final ShadSidebarVariant? variant;

  // {{@macro ShadSidebarScaffold.initiallyExtended}}
  final bool? initiallyExtended;

  // {{@macro ShadSidebarScaffold.animationDuration}}
  final Duration? animationDuration;

  // {{@macro ShadSidebarScaffold.animationCurve}}
  final Curve? animationCurve;

  // {{@macro ShadSidebarScaffold.collapsedToIconsWidth}}
  final double? collapsedToIconsWidth;

  // {{@macro ShadSidebarScaffold.extendedWidth}}
  final double? extendedWidth;

  // {{@macro ShadSidebarScaffold.mobileWidth}}
  final double? mobileWidth;

  // {{@macro ShadSidebarScaffold.collapseMode}}
  final ShadSidebarCollapseMode? collapseMode;

  // {{@macro ShadSidebarScaffold.mobileBreakPoint}}
  final double? mobileBreakPoint;

  // {{@macro ShadSidebarScaffold.keyboardShortcut}}
  final ShortcutActivator? keyboardShortcut;

  // {{@macro ShadSidebarScaffold.sidebarBorderColor}}
  final Color? sidebarBorderColor;

  static ShadSidebarScaffoldTheme lerp(
    ShadSidebarScaffoldTheme a,
    ShadSidebarScaffoldTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSidebarScaffoldTheme(
      merge: b.merge,
      keyboardShortcut: b.keyboardShortcut,
      mobileBreakPoint: lerpDouble(a.mobileBreakPoint, b.mobileBreakPoint, t),
      side: t < .5 ? a.side : b.side,
      variant: t < .5 ? a.variant : b.variant,
      initiallyExtended: t < .5 ? a.initiallyExtended : b.initiallyExtended,
      collapsedToIconsWidth:
          lerpDouble(a.collapsedToIconsWidth, b.collapsedToIconsWidth, t),
      extendedWidth: lerpDouble(a.extendedWidth, b.extendedWidth, t),
      mobileWidth: lerpDouble(a.mobileWidth, b.mobileWidth, t),
      animationDuration: t < .5 ? a.animationDuration : b.animationDuration,
      animationCurve: t < .5 ? a.animationCurve : b.animationCurve,
      collapseMode: t < .5 ? a.collapseMode : b.collapseMode,
      sidebarBorderColor:
          Color.lerp(a.sidebarBorderColor, b.sidebarBorderColor, t),
    );
  }

  ShadSidebarScaffoldTheme copyWith({
    bool? merge,
    ShortcutActivator? keyboardShortcut,
    double? mobileBreakPoint,
    ShadSidebarSide? side,
    ShadSidebarVariant? variant,
    bool? initiallyExtended,
    double? collapsedToIconsWidth,
    double? extendedWidth,
    double? mobileWidth,
    Duration? animationDuration,
    Curve? animationCurve,
    ShadSidebarCollapseMode? collapseMode,
    Color? sidebarBorderColor,
  }) {
    return ShadSidebarScaffoldTheme(
      merge: merge ?? this.merge,
      keyboardShortcut: keyboardShortcut ?? this.keyboardShortcut,
      mobileBreakPoint: mobileBreakPoint ?? this.mobileBreakPoint,
      side: side ?? this.side,
      variant: variant ?? this.variant,
      initiallyExtended: initiallyExtended ?? this.initiallyExtended,
      collapsedToIconsWidth:
          collapsedToIconsWidth ?? this.collapsedToIconsWidth,
      extendedWidth: extendedWidth ?? this.extendedWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      collapseMode: collapseMode ?? this.collapseMode,
      mobileWidth: mobileWidth ?? this.mobileWidth,
      sidebarBorderColor: sidebarBorderColor ?? this.sidebarBorderColor,
    );
  }

  ShadSidebarScaffoldTheme mergeWith(ShadSidebarScaffoldTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      merge: other.merge,
      keyboardShortcut: other.keyboardShortcut,
      sidebarBorderColor: other.sidebarBorderColor,
      mobileWidth: other.mobileWidth,
      extendedWidth: other.extendedWidth,
      collapseMode: other.collapseMode,
      animationCurve: other.animationCurve,
      animationDuration: other.animationDuration,
      mobileBreakPoint: other.mobileBreakPoint,
      side: other.side,
      variant: other.variant,
      initiallyExtended: other.initiallyExtended,
      collapsedToIconsWidth: other.collapsedToIconsWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSidebarScaffoldTheme &&
        other.merge == merge &&
        other.keyboardShortcut == keyboardShortcut &&
        other.mobileBreakPoint == mobileBreakPoint &&
        other.side == side &&
        other.variant == variant &&
        other.initiallyExtended == initiallyExtended &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.collapsedToIconsWidth == collapsedToIconsWidth &&
        other.extendedWidth == extendedWidth &&
        other.mobileWidth == mobileWidth &&
        other.collapseMode == collapseMode &&
        other.sidebarBorderColor == sidebarBorderColor;
  }

  @override
  int get hashCode =>
      merge.hashCode ^
      keyboardShortcut.hashCode ^
      mobileBreakPoint.hashCode ^
      side.hashCode ^
      variant.hashCode ^
      initiallyExtended.hashCode ^
      animationDuration.hashCode ^
      animationCurve.hashCode ^
      collapsedToIconsWidth.hashCode ^
      extendedWidth.hashCode ^
      mobileWidth.hashCode ^
      collapseMode.hashCode ^
      sidebarBorderColor.hashCode;
}
