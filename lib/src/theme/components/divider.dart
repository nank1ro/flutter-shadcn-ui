import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadDivider;
import 'package:shadcn_ui/src/components/divider.dart' show ShadDivider;

@immutable

/// {@template ShadDividerTheme}
/// Theme for the [ShadDivider] widget.
/// {@endtemplate}
class ShadDividerTheme {
  /// {@macro ShadDividerTheme}
  const ShadDividerTheme({
    this.merge = true,
    this.verticalMargin,
    this.horizontalMargin,
    this.thickness,
    this.color,
    this.radius,
  });

  final bool merge;

  /// {@macro ShadDivider.color}
  final Color? color;

  /// {@macro ShadDivider.thickness}
  final double? thickness;

  /// The margin (or space) around the vertical divider.
  final EdgeInsetsGeometry? verticalMargin;

  /// The margin (or space) around the horizontal divider.
  final EdgeInsetsGeometry? horizontalMargin;

  /// {@macro ShadDivider.radius}
  final BorderRadiusGeometry? radius;

  ShadDividerTheme mergeWith(ShadDividerTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      merge: other.merge,
      verticalMargin: other.verticalMargin,
      horizontalMargin: other.horizontalMargin,
      color: other.color,
      thickness: other.thickness,
      radius: other.radius,
    );
  }

  ShadDividerTheme copyWith({
    bool? merge,
    Color? color,
    double? thickness,
    EdgeInsetsGeometry? verticalMargin,
    EdgeInsetsGeometry? horizontalMargin,
    BorderRadiusGeometry? radius,
  }) {
    return ShadDividerTheme(
      merge: merge ?? this.merge,
      color: color ?? this.color,
      verticalMargin: verticalMargin ?? this.verticalMargin,
      horizontalMargin: horizontalMargin ?? this.horizontalMargin,
      thickness: thickness ?? this.thickness,
      radius: radius ?? this.radius,
    );
  }

  static ShadDividerTheme lerp(
    ShadDividerTheme a,
    ShadDividerTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadDividerTheme(
      merge: b.merge,
      verticalMargin:
          EdgeInsetsGeometry.lerp(a.verticalMargin, b.verticalMargin, t),
      horizontalMargin:
          EdgeInsetsGeometry.lerp(a.horizontalMargin, b.horizontalMargin, t),
      thickness: lerpDouble(a.thickness, b.thickness, t),
      color: Color.lerp(a.color, b.color, t),
      radius: BorderRadiusGeometry.lerp(a.radius, b.radius, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShadDividerTheme &&
        other.merge == merge &&
        other.color == color &&
        other.thickness == thickness &&
        other.verticalMargin == verticalMargin &&
        other.horizontalMargin == horizontalMargin &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      merge,
      color,
      thickness,
      verticalMargin,
      horizontalMargin,
      radius,
    ]);
  }
}
