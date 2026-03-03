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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadSeparatorTheme(
      color: Color.lerp(a.color, b.color, t),
      thickness: lerpDouble$(a.thickness, b.thickness, t),
      verticalMargin: EdgeInsetsGeometry.lerp(
        a.verticalMargin,
        b.verticalMargin,
        t,
      ),
      horizontalMargin: EdgeInsetsGeometry.lerp(
        a.horizontalMargin,
        b.horizontalMargin,
        t,
      ),
      radius: BorderRadiusGeometry.lerp(a.radius, b.radius, t),
    );
  }

  ShadSeparatorTheme copyWith({
    Color? color,
    double? thickness,
    EdgeInsetsGeometry? verticalMargin,
    EdgeInsetsGeometry? horizontalMargin,
    BorderRadiusGeometry? radius,
  }) {
    final _this = (this as ShadSeparatorTheme);

    return ShadSeparatorTheme(
      color: color ?? _this.color,
      thickness: thickness ?? _this.thickness,
      verticalMargin: verticalMargin ?? _this.verticalMargin,
      horizontalMargin: horizontalMargin ?? _this.horizontalMargin,
      radius: radius ?? _this.radius,
    );
  }

  ShadSeparatorTheme merge(ShadSeparatorTheme? other) {
    final _this = (this as ShadSeparatorTheme);

    if (other == null || identical(_this, other)) {
      return _this;
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

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ShadSeparatorTheme);
    final _other = (other as ShadSeparatorTheme);

    return _other.color == _this.color &&
        _other.thickness == _this.thickness &&
        _other.verticalMargin == _this.verticalMargin &&
        _other.horizontalMargin == _this.horizontalMargin &&
        _other.radius == _this.radius;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSeparatorTheme);

    return Object.hash(
      runtimeType,
      _this.color,
      _this.thickness,
      _this.verticalMargin,
      _this.horizontalMargin,
      _this.radius,
    );
  }
}
