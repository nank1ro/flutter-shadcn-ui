// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button_sizes.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadButtonSizeTheme {
  bool get canMerge => true;

  static ShadButtonSizeTheme lerp(
    ShadButtonSizeTheme? a,
    ShadButtonSizeTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadButtonSizeTheme(
      height: lerpDouble$(a?.height, b?.height, t)!,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t)!,
      width: lerpDouble$(a?.width, b?.width, t),
    );
  }

  ShadButtonSizeTheme copyWith({
    double? height,
    EdgeInsetsGeometry? padding,
    double? width,
  }) {
    final a = (this as ShadButtonSizeTheme);

    return ShadButtonSizeTheme(
      height: height ?? a.height,
      padding: padding ?? a.padding,
      width: width ?? a.width,
    );
  }

  ShadButtonSizeTheme merge(ShadButtonSizeTheme? other) {
    final current = (this as ShadButtonSizeTheme);
    if (other == null) return current;
    if (!other.canMerge) return other;
    return copyWith(
      height: other.height,
      padding: other.padding,
      width: other.width,
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

    final value = (this as ShadButtonSizeTheme);

    return other is ShadButtonSizeTheme &&
        other.height == value.height &&
        other.padding == value.padding &&
        other.width == value.width;
  }

  @override
  int get hashCode {
    final value = (this as ShadButtonSizeTheme);

    return Object.hash(runtimeType, value.height, value.padding, value.width);
  }
}

mixin _$ShadButtonSizesTheme {
  bool get canMerge => true;

  static ShadButtonSizesTheme lerp(
    ShadButtonSizesTheme? a,
    ShadButtonSizesTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadButtonSizesTheme(
      regular: ShadButtonSizeTheme.lerp(a?.regular, b?.regular, t),
      sm: ShadButtonSizeTheme.lerp(a?.sm, b?.sm, t),
      lg: ShadButtonSizeTheme.lerp(a?.lg, b?.lg, t),
      icon: ShadButtonSizeTheme.lerp(a?.icon, b?.icon, t),
    );
  }

  ShadButtonSizesTheme copyWith({
    ShadButtonSizeTheme? regular,
    ShadButtonSizeTheme? sm,
    ShadButtonSizeTheme? lg,
    ShadButtonSizeTheme? icon,
  }) {
    final a = (this as ShadButtonSizesTheme);

    return ShadButtonSizesTheme(
      regular: regular ?? a.regular,
      sm: sm ?? a.sm,
      lg: lg ?? a.lg,
      icon: icon ?? a.icon,
    );
  }

  ShadButtonSizesTheme merge(ShadButtonSizesTheme? other) {
    final current = (this as ShadButtonSizesTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      regular: other.regular,
      sm: other.sm,
      lg: other.lg,
      icon: other.icon,
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

    final value = (this as ShadButtonSizesTheme);

    return other is ShadButtonSizesTheme &&
        other.regular == value.regular &&
        other.sm == value.sm &&
        other.lg == value.lg &&
        other.icon == value.icon;
  }

  @override
  int get hashCode {
    final value = (this as ShadButtonSizesTheme);

    return Object.hash(
      runtimeType,
      value.regular,
      value.sm,
      value.lg,
      value.icon,
    );
  }
}
