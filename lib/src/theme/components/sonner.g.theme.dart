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
    final _this = (this as ShadSonnerTheme);

    return ShadSonnerTheme(
      visibleToastsAmount: visibleToastsAmount ?? _this.visibleToastsAmount,
      alignment: alignment ?? _this.alignment,
      padding: padding ?? _this.padding,
      expandedGap: expandedGap ?? _this.expandedGap,
      collapsedGap: collapsedGap ?? _this.collapsedGap,
      scaleFactor: scaleFactor ?? _this.scaleFactor,
      animationDuration: animationDuration ?? _this.animationDuration,
      animationCurve: animationCurve ?? _this.animationCurve,
    );
  }

  ShadSonnerTheme merge(ShadSonnerTheme? other) {
    final _this = (this as ShadSonnerTheme);

    if (other == null) {
      return _this;
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadSonnerTheme);
    final _other = (other as ShadSonnerTheme);

    return _other.visibleToastsAmount == _this.visibleToastsAmount &&
        _other.alignment == _this.alignment &&
        _other.padding == _this.padding &&
        _other.expandedGap == _this.expandedGap &&
        _other.collapsedGap == _this.collapsedGap &&
        _other.scaleFactor == _this.scaleFactor &&
        _other.animationDuration == _this.animationDuration &&
        _other.animationCurve == _this.animationCurve;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSonnerTheme);

    return Object.hash(
      runtimeType,
      _this.visibleToastsAmount,
      _this.alignment,
      _this.padding,
      _this.expandedGap,
      _this.collapsedGap,
      _this.scaleFactor,
      _this.animationDuration,
      _this.animationCurve,
    );
  }
}
