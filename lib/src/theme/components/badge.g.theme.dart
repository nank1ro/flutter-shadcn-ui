// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'badge.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadBadgeTheme {
  bool get canMerge => true;

  static ShadBadgeTheme lerp(ShadBadgeTheme? a, ShadBadgeTheme? b, double t) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadBadgeTheme(
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a?.hoverBackgroundColor,
        b?.hoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      cursor: t < 0.5 ? a?.cursor : b?.cursor,
    );
  }

  ShadBadgeTheme copyWith({
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? hoverBackgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    MouseCursor? cursor,
  }) {
    final a = (this as ShadBadgeTheme);

    return ShadBadgeTheme(
      shape: shape ?? a.shape,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? a.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? a.foregroundColor,
      padding: padding ?? a.padding,
      cursor: cursor ?? a.cursor,
    );
  }

  ShadBadgeTheme merge(ShadBadgeTheme? other) {
    final current = (this as ShadBadgeTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      shape: other.shape,
      backgroundColor: other.backgroundColor,
      hoverBackgroundColor: other.hoverBackgroundColor,
      foregroundColor: other.foregroundColor,
      padding: other.padding,
      cursor: other.cursor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final value = (this as ShadBadgeTheme);

    return other is ShadBadgeTheme &&
        other.shape == value.shape &&
        other.backgroundColor == value.backgroundColor &&
        other.hoverBackgroundColor == value.hoverBackgroundColor &&
        other.foregroundColor == value.foregroundColor &&
        other.padding == value.padding &&
        other.cursor == value.cursor;
  }

  @override
  int get hashCode {
    final value = (this as ShadBadgeTheme);

    return Object.hash(
      runtimeType,
      value.shape,
      value.backgroundColor,
      value.hoverBackgroundColor,
      value.foregroundColor,
      value.padding,
      value.cursor,
    );
  }
}
