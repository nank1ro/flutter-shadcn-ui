import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadCheckboxTheme {
  const ShadCheckboxTheme({
    this.merge = true,
    this.color,
    this.duration,
    this.decoration,
    this.size,
    this.padding,
    this.crossAxisAlignment,
    this.checkboxPadding,
  });

  final bool merge;

  /// {@macro ShadCheckbox.color}
  final Color? color;

  /// {@macro ShadCheckbox.size}
  final double? size;

  /// {@macro ShadCheckbox.duration}
  final Duration? duration;

  /// {@macro ShadCheckbox.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadCheckbox.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadCheckbox.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadCheckbox.checkboxPadding}
  final EdgeInsetsGeometry? checkboxPadding;

  static ShadCheckboxTheme lerp(
    ShadCheckboxTheme a,
    ShadCheckboxTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadCheckboxTheme(
      merge: b.merge,
      color: Color.lerp(a.color, b.color, t),
      duration: b.duration,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      size: lerpDouble(a.size, b.size, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      crossAxisAlignment: t < .5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      checkboxPadding:
          EdgeInsetsGeometry.lerp(a.checkboxPadding, b.checkboxPadding, t),
    );
  }

  ShadCheckboxTheme copyWith({
    bool? merge,
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? checkboxPadding,
  }) {
    return ShadCheckboxTheme(
      merge: merge ?? this.merge,
      duration: duration ?? this.duration,
      decoration: decoration ?? this.decoration,
      size: size ?? this.size,
      color: color ?? this.color,
      padding: padding ?? this.padding,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      checkboxPadding: checkboxPadding ?? this.checkboxPadding,
    );
  }

  ShadCheckboxTheme mergeWith(ShadCheckboxTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      color: other.color,
      duration: other.duration,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      size: other.size,
      padding: other.padding,
      crossAxisAlignment: other.crossAxisAlignment,
      checkboxPadding: other.checkboxPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadCheckboxTheme &&
        other.merge == merge &&
        other.color == color &&
        other.size == size &&
        other.duration == duration &&
        other.decoration == decoration &&
        other.padding == padding &&
        other.crossAxisAlignment == crossAxisAlignment &&
        other.checkboxPadding == checkboxPadding;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        color.hashCode ^
        size.hashCode ^
        duration.hashCode ^
        decoration.hashCode ^
        padding.hashCode ^
        crossAxisAlignment.hashCode ^
        checkboxPadding.hashCode;
  }
}
