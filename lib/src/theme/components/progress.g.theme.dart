// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'progress.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadProgressTheme {
  bool get canMerge => true;

  static ShadProgressTheme? lerp(
    ShadProgressTheme? a,
    ShadProgressTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadProgressTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      color: Color.lerp(a?.color, b?.color, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      innerBorderRadius: BorderRadius.lerp(
        a?.innerBorderRadius,
        b?.innerBorderRadius,
        t,
      ),
      minHeight: lerpDouble$(a?.minHeight, b?.minHeight, t),
    );
  }

  ShadProgressTheme copyWith({
    Color? backgroundColor,
    Color? color,
    BorderRadius? borderRadius,
    BorderRadius? innerBorderRadius,
    double? minHeight,
  }) {
    final a = (this as ShadProgressTheme);

    return ShadProgressTheme(
      backgroundColor: backgroundColor ?? a.backgroundColor,
      color: color ?? a.color,
      borderRadius: borderRadius ?? a.borderRadius,
      innerBorderRadius: innerBorderRadius ?? a.innerBorderRadius,
      minHeight: minHeight ?? a.minHeight,
    );
  }

  ShadProgressTheme merge(ShadProgressTheme? other) {
    final current = (this as ShadProgressTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      backgroundColor: other.backgroundColor,
      color: other.color,
      borderRadius: other.borderRadius,
      innerBorderRadius: other.innerBorderRadius,
      minHeight: other.minHeight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is! ShadProgressTheme) {
      return false;
    }

    final value = (this as ShadProgressTheme);

    return other.backgroundColor == value.backgroundColor &&
        other.color == value.color &&
        other.borderRadius == value.borderRadius &&
        other.innerBorderRadius == value.innerBorderRadius &&
        other.minHeight == value.minHeight;
  }

  @override
  int get hashCode {
    final value = (this as ShadProgressTheme);

    return Object.hash(
      runtimeType,
      value.backgroundColor,
      value.color,
      value.borderRadius,
      value.innerBorderRadius,
      value.minHeight,
    );
  }
}
