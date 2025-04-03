import 'dart:ui';

import 'package:flutter/widgets.dart';

@immutable
class ShadSonnerTheme {
  const ShadSonnerTheme({
    this.merge = true,
    this.visibleToastsAmount,
    this.alignment,
    this.padding,
    this.expandedGap,
    this.collapsedGap,
    this.scaleFactor,
  });

  final bool merge;

  /// {@macro ShadSonner.visible_toasts_amount}
  final int? visibleToastsAmount;

  /// {@macro ShadSonner.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ShadSonner.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadSonner.expandedGap}
  final double? expandedGap;

  /// {@macro ShadSonner.collapsedGap}
  final double? collapsedGap;

  /// {@macro ShadSonner.scaleFactor}
  final double? scaleFactor;

  static ShadSonnerTheme lerp(
    ShadSonnerTheme a,
    ShadSonnerTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadSonnerTheme(
      merge: b.merge,
      visibleToastsAmount:
          t < .5 ? a.visibleToastsAmount : b.visibleToastsAmount,
      alignment: AlignmentGeometry.lerp(a.alignment, b.alignment, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      expandedGap: lerpDouble(a.expandedGap, b.expandedGap, t),
      collapsedGap: lerpDouble(a.collapsedGap, b.collapsedGap, t),
      scaleFactor: lerpDouble(a.scaleFactor, b.scaleFactor, t),
    );
  }

  ShadSonnerTheme copyWith({
    bool? merge,
    int? visibleToastsAmount,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    double? expandedGap,
    double? collapsedGap,
    double? scaleFactor,
  }) {
    return ShadSonnerTheme(
      merge: merge ?? this.merge,
      visibleToastsAmount: visibleToastsAmount ?? this.visibleToastsAmount,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      expandedGap: expandedGap ?? this.expandedGap,
      collapsedGap: collapsedGap ?? this.collapsedGap,
      scaleFactor: scaleFactor ?? this.scaleFactor,
    );
  }

  ShadSonnerTheme mergeWith(ShadSonnerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      visibleToastsAmount: other.visibleToastsAmount,
      alignment: other.alignment,
      padding: other.padding,
      expandedGap: other.expandedGap,
      collapsedGap: other.collapsedGap,
      scaleFactor: other.scaleFactor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadSonnerTheme &&
        other.merge == merge &&
        other.visibleToastsAmount == visibleToastsAmount &&
        other.alignment == alignment &&
        other.padding == padding &&
        other.expandedGap == expandedGap &&
        other.collapsedGap == collapsedGap &&
        other.scaleFactor == scaleFactor;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        visibleToastsAmount.hashCode ^
        alignment.hashCode ^
        padding.hashCode ^
        expandedGap.hashCode ^
        collapsedGap.hashCode ^
        scaleFactor.hashCode;
  }
}
