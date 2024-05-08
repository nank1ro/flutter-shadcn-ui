import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadInputTheme {
  const ShadInputTheme({
    this.merge = true,
    this.decoration,
    this.padding,
    this.border,
    this.radius,
    this.backgroundColor,
  });

  final bool merge;
  final ShadDecoration? decoration;
  final EdgeInsets? padding;
  final Border? border;
  final BorderRadius? radius;
  final Color? backgroundColor;

  static ShadInputTheme lerp(
    ShadInputTheme a,
    ShadInputTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadInputTheme(
      merge: b.merge,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      border: Border.lerp(a.border, b.border, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
    );
  }

  ShadInputTheme copyWith({
    bool? merge,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    Border? border,
    BorderRadius? radius,
    Color? backgroundColor,
  }) {
    return ShadInputTheme(
      merge: merge ?? this.merge,
      decoration: decoration ?? this.decoration,
      padding: padding ?? this.padding,
      border: border ?? this.border,
      radius: radius ?? this.radius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  ShadInputTheme mergeWith(ShadInputTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      decoration: other.decoration,
      padding: other.padding,
      border: other.border,
      radius: other.radius,
      backgroundColor: other.backgroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadInputTheme &&
        other.merge == merge &&
        other.decoration == decoration &&
        other.padding == padding &&
        other.border == border &&
        other.radius == radius &&
        other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        border.hashCode ^
        radius.hashCode ^
        backgroundColor.hashCode;
  }
}
