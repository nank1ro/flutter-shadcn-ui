// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'tooltip.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadTooltipTheme {
  bool get canMerge => true;

  static ShadTooltipTheme? lerp(
    ShadTooltipTheme? a,
    ShadTooltipTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadTooltipTheme(
      waitDuration: lerpDuration$(a?.waitDuration, b?.waitDuration, t),
      showDuration: lerpDuration$(a?.showDuration, b?.showDuration, t),
      effects: t < 0.5 ? a?.effects : b?.effects,
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      hoverStrategies: t < 0.5 ? a?.hoverStrategies : b?.hoverStrategies,
      longPressDuration: lerpDuration$(
        a?.longPressDuration,
        b?.longPressDuration,
        t,
      ),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      reverseDuration: lerpDuration$(a?.reverseDuration, b?.reverseDuration, t),
    );
  }

  ShadTooltipTheme copyWith({
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    ShadAnchorBase? anchor,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadHoverStrategies? hoverStrategies,
    Duration? longPressDuration,
    Duration? duration,
    Duration? reverseDuration,
  }) {
    final a = (this as ShadTooltipTheme);

    return ShadTooltipTheme(
      waitDuration: waitDuration ?? a.waitDuration,
      showDuration: showDuration ?? a.showDuration,
      effects: effects ?? a.effects,
      anchor: anchor ?? a.anchor,
      padding: padding ?? a.padding,
      decoration: decoration ?? a.decoration,
      hoverStrategies: hoverStrategies ?? a.hoverStrategies,
      longPressDuration: longPressDuration ?? a.longPressDuration,
      duration: duration ?? a.duration,
      reverseDuration: reverseDuration ?? a.reverseDuration,
    );
  }

  ShadTooltipTheme merge(ShadTooltipTheme? other) {
    final current = (this as ShadTooltipTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      waitDuration: other.waitDuration,
      showDuration: other.showDuration,
      effects: other.effects,
      anchor: other.anchor,
      padding: other.padding,
      decoration: other.decoration,
      hoverStrategies: other.hoverStrategies,
      longPressDuration: other.longPressDuration,
      duration: other.duration,
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

    final value = (this as ShadTooltipTheme);

    return other is ShadTooltipTheme &&
        other.waitDuration == value.waitDuration &&
        other.showDuration == value.showDuration &&
        other.effects == value.effects &&
        other.anchor == value.anchor &&
        other.padding == value.padding &&
        other.decoration == value.decoration &&
        other.hoverStrategies == value.hoverStrategies &&
        other.longPressDuration == value.longPressDuration &&
        other.duration == value.duration &&
        other.reverseDuration == value.reverseDuration;
  }

  @override
  int get hashCode {
    final value = (this as ShadTooltipTheme);

    return Object.hash(
      runtimeType,
      value.waitDuration,
      value.showDuration,
      value.effects,
      value.anchor,
      value.padding,
      value.decoration,
      value.hoverStrategies,
      value.longPressDuration,
      value.duration,
      value.reverseDuration,
    );
  }
}
