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
    if (a == null && b == null) {
      return null;
    }

    return ShadAvatarTheme(
      size: Size.lerp(a?.size, b?.size, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      fit: t < 0.5 ? a?.fit : b?.fit,
    );
  }

  ShadAvatarTheme copyWith({
    Size? size,
    ShapeBorder? shape,
    Color? backgroundColor,
    BoxFit? fit,
  }) {
    final a = (this as ShadAvatarTheme);

    return ShadAvatarTheme(
      size: size ?? a.size,
      shape: shape ?? a.shape,
      backgroundColor: backgroundColor ?? a.backgroundColor,
      fit: fit ?? a.fit,
    );
  }

  ShadAvatarTheme merge(ShadAvatarTheme? other) {
    final current = (this as ShadAvatarTheme);

    if (other == null) {
      return current;
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

    final value = (this as ShadAvatarTheme);

    return other is ShadAvatarTheme &&
        other.size == value.size &&
        other.shape == value.shape &&
        other.backgroundColor == value.backgroundColor &&
        other.fit == value.fit;
  }

  @override
  int get hashCode {
    final value = (this as ShadAvatarTheme);

    return Object.hash(
      runtimeType,
      value.size,
      value.shape,
      value.backgroundColor,
      value.fit,
    );
  }
}
