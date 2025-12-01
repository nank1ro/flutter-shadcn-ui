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

  static ShadBadgeTheme? lerp(ShadBadgeTheme? a, ShadBadgeTheme? b, double t) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadBadgeTheme(
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      hoverBackgroundColor: Color.lerp(
        a.hoverBackgroundColor,
        b.hoverBackgroundColor,
        t,
      ),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      cursor: t < 0.5 ? a.cursor : b.cursor,
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
    final _this = (this as ShadBadgeTheme);

    return ShadBadgeTheme(
      shape: shape ?? _this.shape,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? _this.hoverBackgroundColor,
      foregroundColor: foregroundColor ?? _this.foregroundColor,
      padding: padding ?? _this.padding,
      cursor: cursor ?? _this.cursor,
    );
  }

  ShadBadgeTheme merge(ShadBadgeTheme? other) {
    final _this = (this as ShadBadgeTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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

    final _this = (this as ShadBadgeTheme);
    final _other = (other as ShadBadgeTheme);

    return _other.shape == _this.shape &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.hoverBackgroundColor == _this.hoverBackgroundColor &&
        _other.foregroundColor == _this.foregroundColor &&
        _other.padding == _this.padding &&
        _other.cursor == _this.cursor;
  }

  @override
  int get hashCode {
    final _this = (this as ShadBadgeTheme);

    return Object.hash(
      runtimeType,
      _this.shape,
      _this.backgroundColor,
      _this.hoverBackgroundColor,
      _this.foregroundColor,
      _this.padding,
      _this.cursor,
    );
  }
}
