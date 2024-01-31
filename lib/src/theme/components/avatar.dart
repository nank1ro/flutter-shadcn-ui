import 'package:flutter/widgets.dart';

@immutable
class ShadAvatarTheme {
  const ShadAvatarTheme({
    this.merge = true,
    this.size,
    this.shape,
    this.backgroundColor,
    this.fit,
  });

  final bool merge;
  final Size? size;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final BoxFit? fit;

  static ShadAvatarTheme lerp(
    ShadAvatarTheme a,
    ShadAvatarTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadAvatarTheme(
      merge: b.merge,
      shape: ShapeBorder.lerp(a.shape, b.shape, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      size: Size.lerp(a.size, b.size, t),
      fit: b.fit,
    );
  }

  ShadAvatarTheme copyWith({
    bool? merge,
    Size? size,
    ShapeBorder? shape,
    Color? backgroundColor,
    BoxFit? fit,
  }) {
    return ShadAvatarTheme(
      merge: merge ?? this.merge,
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      size: size ?? this.size,
      fit: fit ?? this.fit,
    );
  }

  ShadAvatarTheme mergeWith(ShadAvatarTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      shape: other.shape,
      backgroundColor: other.backgroundColor,
      size: other.size,
      fit: other.fit,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAvatarTheme &&
        other.merge == merge &&
        other.shape == shape &&
        other.backgroundColor == backgroundColor &&
        other.size == size &&
        other.fit == fit;
  }

  @override
  int get hashCode {
    return shape.hashCode ^
        merge.hashCode ^
        backgroundColor.hashCode ^
        size.hashCode ^
        fit.hashCode;
  }
}
