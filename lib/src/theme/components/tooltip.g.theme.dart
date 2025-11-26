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
    final _this = (this as ShadTooltipTheme);

    return ShadTooltipTheme(
      waitDuration: waitDuration ?? _this.waitDuration,
      showDuration: showDuration ?? _this.showDuration,
      effects: effects ?? _this.effects,
      anchor: anchor ?? _this.anchor,
      padding: padding ?? _this.padding,
      decoration: decoration ?? _this.decoration,
      hoverStrategies: hoverStrategies ?? _this.hoverStrategies,
      longPressDuration: longPressDuration ?? _this.longPressDuration,
      duration: duration ?? _this.duration,
      reverseDuration: reverseDuration ?? _this.reverseDuration,
    );
  }

  ShadTooltipTheme merge(ShadTooltipTheme? other) {
    final _this = (this as ShadTooltipTheme);

    if (other == null) {
      return _this;
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

    final _this = (this as ShadTooltipTheme);
    final _other = (other as ShadTooltipTheme);

    return _other.waitDuration == _this.waitDuration &&
        _other.showDuration == _this.showDuration &&
        _other.effects == _this.effects &&
        _other.anchor == _this.anchor &&
        _other.padding == _this.padding &&
        _other.decoration == _this.decoration &&
        _other.hoverStrategies == _this.hoverStrategies &&
        _other.longPressDuration == _this.longPressDuration &&
        _other.duration == _this.duration &&
        _other.reverseDuration == _this.reverseDuration;
  }

  @override
  int get hashCode {
    final _this = (this as ShadTooltipTheme);

    return Object.hash(
      runtimeType,
      _this.waitDuration,
      _this.showDuration,
      _this.effects,
      _this.anchor,
      _this.padding,
      _this.decoration,
      _this.hoverStrategies,
      _this.longPressDuration,
      _this.duration,
      _this.reverseDuration,
    );
  }
}
