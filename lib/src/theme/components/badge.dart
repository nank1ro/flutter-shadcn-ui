import 'package:flutter/widgets.dart';

@immutable
class ShadcnBadgeTheme {
  const ShadcnBadgeTheme({
    this.merge = true,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
  });

  final bool merge;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;

  static ShadcnBadgeTheme lerp(
    ShadcnBadgeTheme a,
    ShadcnBadgeTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnBadgeTheme(
      merge: b.merge,
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
    );
  }

  ShadcnBadgeTheme copyWith({
    bool? merge,
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
  }) {
    return ShadcnBadgeTheme(
      merge: merge ?? this.merge,
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      padding: padding ?? this.padding,
    );
  }

  ShadcnBadgeTheme mergeWith(ShadcnBadgeTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      shape: other.shape,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      padding: other.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnBadgeTheme &&
        other.merge == merge &&
        other.shape == shape &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        merge.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode ^
        padding.hashCode;
  }
}
