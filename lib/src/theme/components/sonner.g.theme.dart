// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sonner.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSonnerTheme {
  bool get canMerge => true;

  static ShadSonnerTheme? lerp(
    ShadSonnerTheme? a,
    ShadSonnerTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSonnerTheme(
      visibleToastsAmount: t < 0.5
          ? a?.visibleToastsAmount
          : b?.visibleToastsAmount,
      alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      expandedGap: lerpDouble$(a?.expandedGap, b?.expandedGap, t),
      collapsedGap: lerpDouble$(a?.collapsedGap, b?.collapsedGap, t),
      scaleFactor: lerpDouble$(a?.scaleFactor, b?.scaleFactor, t),
      animationDuration: lerpDuration$(
        a?.animationDuration,
        b?.animationDuration,
        t,
      ),
      animationCurve: t < 0.5 ? a?.animationCurve : b?.animationCurve,
    );
  }

  ShadSonnerTheme copyWith({
    int? visibleToastsAmount,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    double? expandedGap,
    double? collapsedGap,
    double? scaleFactor,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    final a = (this as ShadSonnerTheme);

    return ShadSonnerTheme(
      visibleToastsAmount: visibleToastsAmount ?? a.visibleToastsAmount,
      alignment: alignment ?? a.alignment,
      padding: padding ?? a.padding,
      expandedGap: expandedGap ?? a.expandedGap,
      collapsedGap: collapsedGap ?? a.collapsedGap,
      scaleFactor: scaleFactor ?? a.scaleFactor,
      animationDuration: animationDuration ?? a.animationDuration,
      animationCurve: animationCurve ?? a.animationCurve,
    );
  }

  ShadSonnerTheme merge(ShadSonnerTheme? other) {
    final current = (this as ShadSonnerTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      visibleToastsAmount: other.visibleToastsAmount,
      alignment: other.alignment,
      padding: other.padding,
      expandedGap: other.expandedGap,
      collapsedGap: other.collapsedGap,
      scaleFactor: other.scaleFactor,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadSonnerTheme) {
      return false;
    }

    final value = (this as ShadSonnerTheme);

    return other.visibleToastsAmount == value.visibleToastsAmount &&
        other.alignment == value.alignment &&
        other.padding == value.padding &&
        other.expandedGap == value.expandedGap &&
        other.collapsedGap == value.collapsedGap &&
        other.scaleFactor == value.scaleFactor &&
        other.animationDuration == value.animationDuration &&
        other.animationCurve == value.animationCurve;
  }

  @override
  int get hashCode {
    final value = (this as ShadSonnerTheme);

    return Object.hash(
      runtimeType,
      value.visibleToastsAmount,
      value.alignment,
      value.padding,
      value.expandedGap,
      value.collapsedGap,
      value.scaleFactor,
      value.animationDuration,
      value.animationCurve,
    );
  }
}
