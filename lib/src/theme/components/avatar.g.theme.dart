// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'avatar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadAvatarTheme {
  bool get canMerge => true;

  static ShadAvatarTheme? lerp(
    ShadAvatarTheme? a,
    ShadAvatarTheme? b,
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

    return ShadAvatarTheme(
      size: Size.lerp(a.size, b.size, t),
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      fit: t < 0.5 ? a.fit : b.fit,
    );
  }

  ShadAvatarTheme copyWith({
    Size? size,
    ShapeBorder? shape,
    Color? backgroundColor,
    BoxFit? fit,
  }) {
    final _this = (this as ShadAvatarTheme);

    return ShadAvatarTheme(
      size: size ?? _this.size,
      shape: shape ?? _this.shape,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      fit: fit ?? _this.fit,
    );
  }

  ShadAvatarTheme merge(ShadAvatarTheme? other) {
    final _this = (this as ShadAvatarTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      size: other.size,
      shape: other.shape,
      backgroundColor: other.backgroundColor,
      fit: other.fit,
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

    final _this = (this as ShadAvatarTheme);
    final _other = (other as ShadAvatarTheme);

    return _other.size == _this.size &&
        _other.shape == _this.shape &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.fit == _this.fit;
  }

  @override
  int get hashCode {
    final _this = (this as ShadAvatarTheme);

    return Object.hash(
      runtimeType,
      _this.size,
      _this.shape,
      _this.backgroundColor,
      _this.fit,
    );
  }
}
