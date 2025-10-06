// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sidebar_scaffold.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSidebarScaffoldTheme {
  bool get canMerge => true;

  static ShadSidebarScaffoldTheme? lerp(
    ShadSidebarScaffoldTheme? a,
    ShadSidebarScaffoldTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSidebarScaffoldTheme(
      side: t < 0.5 ? a?.side : b?.side,
      variant: t < 0.5 ? a?.variant : b?.variant,
      initiallyExtended: t < 0.5 ? a?.initiallyExtended : b?.initiallyExtended,
      animationDuration: lerpDuration$(
        a?.animationDuration,
        b?.animationDuration,
        t,
      ),
      animationCurve: t < 0.5 ? a?.animationCurve : b?.animationCurve,
      collapsedToIconsWidth: lerpDouble$(
        a?.collapsedToIconsWidth,
        b?.collapsedToIconsWidth,
        t,
      ),
      extendedWidth: lerpDouble$(a?.extendedWidth, b?.extendedWidth, t),
      mobileWidth: lerpDouble$(a?.mobileWidth, b?.mobileWidth, t),
      collapseMode: t < 0.5 ? a?.collapseMode : b?.collapseMode,
      mobileBreakPoint: lerpDouble$(
        a?.mobileBreakPoint,
        b?.mobileBreakPoint,
        t,
      ),
      keyboardShortcut: t < 0.5 ? a?.keyboardShortcut : b?.keyboardShortcut,
      sidebarBorderColor: Color.lerp(
        a?.sidebarBorderColor,
        b?.sidebarBorderColor,
        t,
      ),
    );
  }

  ShadSidebarScaffoldTheme copyWith({
    ShadSidebarSide? side,
    ShadSidebarVariant? variant,
    bool? initiallyExtended,
    Duration? animationDuration,
    Curve? animationCurve,
    double? collapsedToIconsWidth,
    double? extendedWidth,
    double? mobileWidth,
    ShadSidebarCollapseMode? collapseMode,
    double? mobileBreakPoint,
    ShortcutActivator? keyboardShortcut,
    Color? sidebarBorderColor,
  }) {
    final a = (this as ShadSidebarScaffoldTheme);

    return ShadSidebarScaffoldTheme(
      side: side ?? a.side,
      variant: variant ?? a.variant,
      initiallyExtended: initiallyExtended ?? a.initiallyExtended,
      animationDuration: animationDuration ?? a.animationDuration,
      animationCurve: animationCurve ?? a.animationCurve,
      collapsedToIconsWidth: collapsedToIconsWidth ?? a.collapsedToIconsWidth,
      extendedWidth: extendedWidth ?? a.extendedWidth,
      mobileWidth: mobileWidth ?? a.mobileWidth,
      collapseMode: collapseMode ?? a.collapseMode,
      mobileBreakPoint: mobileBreakPoint ?? a.mobileBreakPoint,
      keyboardShortcut: keyboardShortcut ?? a.keyboardShortcut,
      sidebarBorderColor: sidebarBorderColor ?? a.sidebarBorderColor,
    );
  }

  ShadSidebarScaffoldTheme merge(ShadSidebarScaffoldTheme? other) {
    final current = (this as ShadSidebarScaffoldTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      side: other.side,
      variant: other.variant,
      initiallyExtended: other.initiallyExtended,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
      collapsedToIconsWidth: other.collapsedToIconsWidth,
      extendedWidth: other.extendedWidth,
      mobileWidth: other.mobileWidth,
      collapseMode: other.collapseMode,
      mobileBreakPoint: other.mobileBreakPoint,
      keyboardShortcut: other.keyboardShortcut,
      sidebarBorderColor: other.sidebarBorderColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadSidebarScaffoldTheme);

    return other is ShadSidebarScaffoldTheme &&
        other.side == value.side &&
        other.variant == value.variant &&
        other.initiallyExtended == value.initiallyExtended &&
        other.animationDuration == value.animationDuration &&
        other.animationCurve == value.animationCurve &&
        other.collapsedToIconsWidth == value.collapsedToIconsWidth &&
        other.extendedWidth == value.extendedWidth &&
        other.mobileWidth == value.mobileWidth &&
        other.collapseMode == value.collapseMode &&
        other.mobileBreakPoint == value.mobileBreakPoint &&
        other.keyboardShortcut == value.keyboardShortcut &&
        other.sidebarBorderColor == value.sidebarBorderColor;
  }

  @override
  int get hashCode {
    final value = (this as ShadSidebarScaffoldTheme);

    return Object.hash(
      runtimeType,
      value.side,
      value.variant,
      value.initiallyExtended,
      value.animationDuration,
      value.animationCurve,
      value.collapsedToIconsWidth,
      value.extendedWidth,
      value.mobileWidth,
      value.collapseMode,
      value.mobileBreakPoint,
      value.keyboardShortcut,
      value.sidebarBorderColor,
    );
  }
}
