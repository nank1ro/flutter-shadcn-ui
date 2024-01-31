import 'package:flutter/widgets.dart';

@immutable
class ShadOptionTheme {
  const ShadOptionTheme({
    this.merge = true,
    this.hoveredBackgroundColor,
    this.padding,
    this.radius,
  });

  final bool merge;

  final Color? hoveredBackgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? radius;

  static ShadOptionTheme lerp(
    ShadOptionTheme a,
    ShadOptionTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadOptionTheme(
      merge: b.merge,
      hoveredBackgroundColor:
          Color.lerp(a.hoveredBackgroundColor, b.hoveredBackgroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
    );
  }

  ShadOptionTheme copyWith({
    bool? merge,
    Color? hoveredBackgroundColor,
    EdgeInsets? padding,
    BorderRadius? radius,
  }) {
    return ShadOptionTheme(
      merge: merge ?? this.merge,
      hoveredBackgroundColor:
          hoveredBackgroundColor ?? this.hoveredBackgroundColor,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
    );
  }

  ShadOptionTheme mergeWith(ShadOptionTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      hoveredBackgroundColor: other.hoveredBackgroundColor,
      padding: other.padding,
      radius: other.radius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadOptionTheme &&
        other.merge == merge &&
        other.hoveredBackgroundColor == hoveredBackgroundColor &&
        other.padding == padding &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        hoveredBackgroundColor.hashCode ^
        padding.hashCode ^
        radius.hashCode;
  }
}
