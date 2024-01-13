import 'package:flutter/widgets.dart';

@immutable
class ShadcnBadgeTheme {
  const ShadcnBadgeTheme({
    required this.shape,
    required this.backgroundColor,
    required this.hoverBackgroundColor,
    required this.foregroundColor,
  });

  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;

  static ShadcnBadgeTheme lerp(
    ShadcnBadgeTheme a,
    ShadcnBadgeTheme b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }
    return ShadcnBadgeTheme(
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a.hoverBackgroundColor, b.hoverBackgroundColor, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
    );
  }

  ShadcnBadgeTheme copyWith({
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
  }) {
    return ShadcnBadgeTheme(
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnBadgeTheme &&
        other.shape == shape &&
        other.backgroundColor == backgroundColor &&
        other.hoverBackgroundColor == hoverBackgroundColor &&
        other.foregroundColor == foregroundColor;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        backgroundColor.hashCode ^
        hoverBackgroundColor.hashCode ^
        foregroundColor.hashCode;
  }
}
