// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'checkbox.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadCheckboxTheme {
  bool get canMerge => true;

  static ShadCheckboxTheme? lerp(
    ShadCheckboxTheme? a,
    ShadCheckboxTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadCheckboxTheme(
      color: Color.lerp(a?.color, b?.color, t),
      size: lerpDouble$(a?.size, b?.size, t),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      crossAxisAlignment:
          t < 0.5 ? a?.crossAxisAlignment : b?.crossAxisAlignment,
      checkboxPadding: EdgeInsetsGeometry.lerp(
        a?.checkboxPadding,
        b?.checkboxPadding,
        t,
      ),
    );
  }

  ShadCheckboxTheme copyWith({
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? checkboxPadding,
  }) {
    final a = (this as ShadCheckboxTheme);

    return ShadCheckboxTheme(
      color: color ?? a.color,
      size: size ?? a.size,
      duration: duration ?? a.duration,
      decoration: decoration ?? a.decoration,
      padding: padding ?? a.padding,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      checkboxPadding: checkboxPadding ?? a.checkboxPadding,
    );
  }

  ShadCheckboxTheme merge(ShadCheckboxTheme? other) {
    final current = (this as ShadCheckboxTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      color: other.color,
      size: other.size,
      duration: other.duration,
      decoration: other.decoration,
      padding: other.padding,
      crossAxisAlignment: other.crossAxisAlignment,
      checkboxPadding: other.checkboxPadding,
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

    final value = (this as ShadCheckboxTheme);

    return other is ShadCheckboxTheme &&
        other.color == value.color &&
        other.size == value.size &&
        other.duration == value.duration &&
        other.decoration == value.decoration &&
        other.padding == value.padding &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.checkboxPadding == value.checkboxPadding;
  }

  @override
  int get hashCode {
    final value = (this as ShadCheckboxTheme);

    return Object.hash(
      runtimeType,
      value.color,
      value.size,
      value.duration,
      value.decoration,
      value.padding,
      value.crossAxisAlignment,
      value.checkboxPadding,
    );
  }
}
