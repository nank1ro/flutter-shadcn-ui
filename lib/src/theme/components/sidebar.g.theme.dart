// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sidebar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSidebarTheme {
  bool get canMerge => true;

  static ShadSidebarTheme? lerp(
    ShadSidebarTheme? a,
    ShadSidebarTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSidebarTheme(
      side: t < 0.5 ? a?.side : b?.side,
      extendedWidth: lerpDouble$(a?.extendedWidth, b?.extendedWidth, t),
      mobileWidth: lerpDouble$(a?.mobileWidth, b?.mobileWidth, t),
      mobileBreakPoint: lerpDouble$(
        a?.mobileBreakPoint,
        b?.mobileBreakPoint,
        t,
      ),
      collapsedToIconsWidth: lerpDouble$(
        a?.collapsedToIconsWidth,
        b?.collapsedToIconsWidth,
        t,
      ),
      collapseMode: t < 0.5 ? a?.collapseMode : b?.collapseMode,
      animationDuration: lerpDuration$(
        a?.animationDuration,
        b?.animationDuration,
        t,
      ),
      animationCurve: t < 0.5 ? a?.animationCurve : b?.animationCurve,
    );
  }

  ShadSidebarTheme copyWith({
    ShadSidebarSide? side,
    double? extendedWidth,
    double? mobileWidth,
    double? mobileBreakPoint,
    double? collapsedToIconsWidth,
    ShadSidebarCollapseMode? collapseMode,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    final a = (this as ShadSidebarTheme);

    return ShadSidebarTheme(
      side: side ?? a.side,
      extendedWidth: extendedWidth ?? a.extendedWidth,
      mobileWidth: mobileWidth ?? a.mobileWidth,
      mobileBreakPoint: mobileBreakPoint ?? a.mobileBreakPoint,
      collapsedToIconsWidth: collapsedToIconsWidth ?? a.collapsedToIconsWidth,
      collapseMode: collapseMode ?? a.collapseMode,
      animationDuration: animationDuration ?? a.animationDuration,
      animationCurve: animationCurve ?? a.animationCurve,
    );
  }

  ShadSidebarTheme merge(ShadSidebarTheme? other) {
    final current = (this as ShadSidebarTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      side: other.side,
      extendedWidth: other.extendedWidth,
      mobileWidth: other.mobileWidth,
      mobileBreakPoint: other.mobileBreakPoint,
      collapsedToIconsWidth: other.collapsedToIconsWidth,
      collapseMode: other.collapseMode,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
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

    final value = (this as ShadSidebarTheme);

    return other is ShadSidebarTheme &&
        other.side == value.side &&
        other.extendedWidth == value.extendedWidth &&
        other.mobileWidth == value.mobileWidth &&
        other.mobileBreakPoint == value.mobileBreakPoint &&
        other.collapsedToIconsWidth == value.collapsedToIconsWidth &&
        other.collapseMode == value.collapseMode &&
        other.animationDuration == value.animationDuration &&
        other.animationCurve == value.animationCurve;
  }

  @override
  int get hashCode {
    final value = (this as ShadSidebarTheme);

    return Object.hash(
      runtimeType,
      value.side,
      value.extendedWidth,
      value.mobileWidth,
      value.mobileBreakPoint,
      value.collapsedToIconsWidth,
      value.collapseMode,
      value.animationDuration,
      value.animationCurve,
    );
  }
}
