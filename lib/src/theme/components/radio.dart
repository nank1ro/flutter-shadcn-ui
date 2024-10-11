import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadRadioTheme {
  const ShadRadioTheme({
    this.merge = true,
    this.color,
    this.duration,
    this.decoration,
    this.size,
    this.padding,
    this.circleSize,
    this.axis,
    this.spacing,
    this.runSpacing,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
  });

  final bool merge;

  final Color? color;

  final double? size;

  final Duration? duration;

  final ShadDecoration? decoration;

  final EdgeInsets? padding;

  final double? circleSize;

  /// {@macro ShadRadioGroup.axis}
  final Axis? axis;

  /// {@macro ShadRadioGroup.spacing}
  final double? spacing;

  /// {@macro ShadRadioGroup.runSpacing}
  final double? runSpacing;

  /// {@macro ShadRadioGroup.alignment}
  final WrapAlignment? alignment;

  /// {@macro ShadRadioGroup.runAlignment}
  final WrapAlignment? runAlignment;

  /// {@macro ShadRadioGroup.crossAxisAlignment}
  final WrapCrossAlignment? crossAxisAlignment;

  static ShadRadioTheme lerp(
    ShadRadioTheme a,
    ShadRadioTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadRadioTheme(
      merge: b.merge,
      color: Color.lerp(a.color, b.color, t),
      duration: b.duration,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      size: lerpDouble(a.size, b.size, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      circleSize: lerpDouble(a.circleSize, b.circleSize, t),
      axis: t < 0.5 ? a.axis : b.axis,
      spacing: lerpDouble(a.spacing, b.spacing, t),
      runSpacing: lerpDouble(a.runSpacing, b.runSpacing, t),
      alignment: t < 0.5 ? a.alignment : b.alignment,
      runAlignment: t < 0.5 ? a.runAlignment : b.runAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
    );
  }

  ShadRadioTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsets? padding,
    double? circleSize,
    Axis? axis,
    double? spacing,
    double? runSpacing,
    WrapAlignment? alignment,
    WrapAlignment? runAlignment,
    WrapCrossAlignment? crossAxisAlignment,
  }) {
    return ShadRadioTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
      color: color ?? this.color,
      padding: padding ?? this.padding,
      circleSize: circleSize ?? this.circleSize,
      axis: axis ?? this.axis,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
      alignment: alignment ?? this.alignment,
      runAlignment: runAlignment ?? this.runAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }

  ShadRadioTheme mergeWith(ShadRadioTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      duration: other.duration,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      size: other.size,
      padding: other.padding,
      circleSize: other.circleSize,
      axis: other.axis,
      spacing: other.spacing,
      runSpacing: other.runSpacing,
      alignment: other.alignment,
      runAlignment: other.runAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadRadioTheme &&
        other.merge == merge &&
        other.color == color &&
        other.size == size &&
        other.duration == duration &&
        other.decoration == decoration &&
        other.padding == padding &&
        other.circleSize == circleSize &&
        other.axis == axis &&
        other.spacing == spacing &&
        other.runSpacing == runSpacing &&
        other.alignment == alignment &&
        other.runAlignment == runAlignment &&
        other.crossAxisAlignment == crossAxisAlignment;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        color.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        circleSize.hashCode ^
        axis.hashCode ^
        spacing.hashCode ^
        runSpacing.hashCode ^
        alignment.hashCode ^
        runAlignment.hashCode ^
        crossAxisAlignment.hashCode;
  }
}
