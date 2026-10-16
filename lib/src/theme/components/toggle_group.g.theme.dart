// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'toggle_group.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadToggleGroupTheme {
  bool get canMerge => true;

  static ShadToggleGroupTheme? lerp(
    ShadToggleGroupTheme? a,
    ShadToggleGroupTheme? b,
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

    return ShadToggleGroupTheme(
      variant: t < 0.5 ? a.variant : b.variant,
      size: t < 0.5 ? a.size : b.size,
      axis: t < 0.5 ? a.axis : b.axis,
      spacing: lerpDouble$(a.spacing, b.spacing, t),
      itemPadding: EdgeInsetsGeometry.lerp(a.itemPadding, b.itemPadding, t),
    );
  }

  ShadToggleGroupTheme copyWith({
    ShadToggleVariant? variant,
    ShadButtonSize? size,
    Axis? axis,
    double? spacing,
    EdgeInsetsGeometry? itemPadding,
  }) {
    final _this = (this as ShadToggleGroupTheme);

    return ShadToggleGroupTheme(
      variant: variant ?? _this.variant,
      size: size ?? _this.size,
      axis: axis ?? _this.axis,
      spacing: spacing ?? _this.spacing,
      itemPadding: itemPadding ?? _this.itemPadding,
    );
  }

  ShadToggleGroupTheme merge(ShadToggleGroupTheme? other) {
    final _this = (this as ShadToggleGroupTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      variant: other.variant,
      size: other.size,
      axis: other.axis,
      spacing: other.spacing,
      itemPadding: other.itemPadding,
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

    final _this = (this as ShadToggleGroupTheme);
    final _other = (other as ShadToggleGroupTheme);

    return _other.variant == _this.variant &&
        _other.size == _this.size &&
        _other.axis == _this.axis &&
        _other.spacing == _this.spacing &&
        _other.itemPadding == _this.itemPadding;
  }

  @override
  int get hashCode {
    final _this = (this as ShadToggleGroupTheme);

    return Object.hash(
      runtimeType,
      _this.variant,
      _this.size,
      _this.axis,
      _this.spacing,
      _this.itemPadding,
    );
  }
}
