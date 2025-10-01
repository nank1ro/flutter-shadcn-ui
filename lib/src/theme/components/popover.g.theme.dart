// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'popover.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadPopoverTheme {
  bool get canMerge => true;

  static ShadPopoverTheme lerp(
    ShadPopoverTheme? a,
    ShadPopoverTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      throw ArgumentError('Both a and b cannot be null');
    }

    return ShadPopoverTheme(
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      filter: t < 0.5 ? a?.filter : b?.filter,
      reverseDuration: lerpDuration$(a?.reverseDuration, b?.reverseDuration, t),
    );
  }

  ShadPopoverTheme copyWith({
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Duration? reverseDuration,
  }) {
    final a = (this as ShadPopoverTheme);

    return ShadPopoverTheme(
      effects: effects ?? a.effects,
      shadows: shadows ?? a.shadows,
      padding: padding ?? a.padding,
      decoration: decoration ?? a.decoration,
      anchor: anchor ?? a.anchor,
      filter: filter ?? a.filter,
      reverseDuration: reverseDuration ?? a.reverseDuration,
    );
  }

  ShadPopoverTheme merge(ShadPopoverTheme? other) {
    final current = (this as ShadPopoverTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      effects: other.effects,
      shadows: other.shadows,
      padding: other.padding,
      decoration: other.decoration,
      anchor: other.anchor,
      filter: other.filter,
      reverseDuration: other.reverseDuration,
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

    final value = (this as ShadPopoverTheme);

    return other is ShadPopoverTheme &&
        other.effects == value.effects &&
        other.shadows == value.shadows &&
        other.padding == value.padding &&
        other.decoration == value.decoration &&
        other.anchor == value.anchor &&
        other.filter == value.filter &&
        other.reverseDuration == value.reverseDuration;
  }

  @override
  int get hashCode {
    final value = (this as ShadPopoverTheme);

    return Object.hash(
      runtimeType,
      value.effects,
      value.shadows,
      value.padding,
      value.decoration,
      value.anchor,
      value.filter,
      value.reverseDuration,
    );
  }
}
