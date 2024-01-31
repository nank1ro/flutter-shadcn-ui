import 'package:flutter/widgets.dart';

@immutable
class ShadcnCardTheme {
  const ShadcnCardTheme({
    this.merge = true,
    this.backgroundColor,
    this.padding,
    this.radius,
    this.border,
    this.shadows,
  });

  final bool merge;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? radius;
  final Border? border;
  final List<BoxShadow>? shadows;

  static ShadcnCardTheme lerp(
    ShadcnCardTheme a,
    ShadcnCardTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadcnCardTheme(
      merge: b.merge,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      border: Border.lerp(a.border, b.border, t),
      shadows: b.shadows,
    );
  }

  ShadcnCardTheme copyWith({
    bool? merge,
    Color? backgroundColor,
    EdgeInsets? padding,
    BorderRadius? radius,
    Border? border,
    List<BoxShadow>? shadows,
  }) {
    return ShadcnCardTheme(
      merge: merge ?? this.merge,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      border: border ?? this.border,
      shadows: shadows ?? this.shadows,
    );
  }

  ShadcnCardTheme mergeWith(ShadcnCardTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      backgroundColor: other.backgroundColor,
      padding: other.padding,
      radius: other.radius,
      border: other.border,
      shadows: other.shadows,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnCardTheme &&
        other.merge == merge &&
        other.backgroundColor == backgroundColor &&
        other.padding == padding &&
        other.radius == radius &&
        other.border == border &&
        other.shadows == shadows;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        backgroundColor.hashCode ^
        padding.hashCode ^
        radius.hashCode ^
        border.hashCode ^
        shadows.hashCode;
  }
}
