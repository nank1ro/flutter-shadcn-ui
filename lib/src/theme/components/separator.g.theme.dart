// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'separator.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSeparatorTheme {
  bool get canMerge => true;

  static ShadSeparatorTheme? lerp(
    ShadSeparatorTheme? a,
    ShadSeparatorTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadSeparatorTheme(
      color: Color.lerp(a?.color, b?.color, t),
      thickness: lerpDouble$(a?.thickness, b?.thickness, t),
      verticalMargin: EdgeInsetsGeometry.lerp(
        a?.verticalMargin,
        b?.verticalMargin,
        t,
      ),
      horizontalMargin: EdgeInsetsGeometry.lerp(
        a?.horizontalMargin,
        b?.horizontalMargin,
        t,
      ),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
    );
  }

  ShadSeparatorTheme copyWith({
    Color? color,
    double? thickness,
    EdgeInsetsGeometry? verticalMargin,
    EdgeInsetsGeometry? horizontalMargin,
    BorderRadiusGeometry? radius,
  }) {
    final a = (this as ShadSeparatorTheme);

    return ShadSeparatorTheme(
      color: color ?? a.color,
      thickness: thickness ?? a.thickness,
      verticalMargin: verticalMargin ?? a.verticalMargin,
      horizontalMargin: horizontalMargin ?? a.horizontalMargin,
      radius: radius ?? a.radius,
    );
  }

  ShadSeparatorTheme merge(ShadSeparatorTheme? other) {
    final current = (this as ShadSeparatorTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      color: other.color,
      thickness: other.thickness,
      verticalMargin: other.verticalMargin,
      horizontalMargin: other.horizontalMargin,
      radius: other.radius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadSeparatorTheme) {
      return false;
    }

    final value = (this as ShadSeparatorTheme);

    return other.color == value.color &&
        other.thickness == value.thickness &&
        other.verticalMargin == value.verticalMargin &&
        other.horizontalMargin == value.horizontalMargin &&
        other.radius == value.radius;
  }

  @override
  int get hashCode {
    final value = (this as ShadSeparatorTheme);

    return Object.hash(
      runtimeType,
      value.color,
      value.thickness,
      value.verticalMargin,
      value.horizontalMargin,
      value.radius,
    );
  }
}
