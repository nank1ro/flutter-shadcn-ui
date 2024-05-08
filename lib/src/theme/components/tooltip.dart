import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

@immutable
class ShadTooltipTheme {
  const ShadTooltipTheme({
    this.merge = true,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.shadows,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
    this.longPressDuration,
  });

  final bool merge;

  /// {@macro tooltip.waitDuration}
  final Duration? waitDuration;

  /// {@macro tooltip.showDuration}
  final Duration? showDuration;

  /// {@macro tooltip.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro tooltip.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro tooltip.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro tooltip.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro tooltip.decoration}
  final BoxDecoration? decoration;

  /// {@macro tooltip.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  final Duration? longPressDuration;

  static ShadTooltipTheme lerp(
    ShadTooltipTheme a,
    ShadTooltipTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadTooltipTheme(
      merge: b.merge,
      waitDuration: a.waitDuration != null && b.waitDuration != null
          ? lerpDuration(a.waitDuration!, b.waitDuration!, t)
          : b.waitDuration,
      showDuration: a.showDuration != null && b.showDuration != null
          ? lerpDuration(a.showDuration!, b.showDuration!, t)
          : b.showDuration,
      effects: b.effects,
      shadows: b.shadows,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      decoration: BoxDecoration.lerp(a.decoration, b.decoration, t),
      anchor: b.anchor,
      hoverStrategies: b.hoverStrategies,
      longPressDuration:
          a.longPressDuration != null && b.longPressDuration != null
              ? lerpDuration(a.longPressDuration!, b.longPressDuration!, t)
              : b.longPressDuration,
    );
  }

  ShadTooltipTheme copyWith({
    bool? merge,
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    BoxDecoration? decoration,
    ShadAnchorBase? anchor,
    ShadHoverStrategies? hoverStrategies,
    Duration? longPressDuration,
  }) {
    return ShadTooltipTheme(
      merge: merge ?? this.merge,
      waitDuration: waitDuration ?? this.waitDuration,
      showDuration: showDuration ?? this.showDuration,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      anchor: anchor ?? this.anchor,
      hoverStrategies: hoverStrategies ?? this.hoverStrategies,
      longPressDuration: longPressDuration ?? this.longPressDuration,
    );
  }

  ShadTooltipTheme mergeWith(ShadTooltipTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      waitDuration: other.waitDuration,
      showDuration: other.showDuration,
      effects: other.effects,
      shadows: other.shadows,
      padding: other.padding,
      decoration: other.decoration,
      anchor: other.anchor,
      hoverStrategies: other.hoverStrategies,
      longPressDuration: other.longPressDuration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadTooltipTheme &&
        other.merge == merge &&
        other.waitDuration == waitDuration &&
        other.showDuration == showDuration &&
        listEquals(other.effects, effects) &&
        listEquals(other.shadows, shadows) &&
        other.padding == padding &&
        other.decoration == decoration &&
        other.anchor == anchor &&
        other.hoverStrategies == hoverStrategies &&
        other.longPressDuration == longPressDuration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        waitDuration.hashCode ^
        showDuration.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        padding.hashCode ^
        decoration.hashCode ^
        anchor.hashCode ^
        hoverStrategies.hashCode ^
        longPressDuration.hashCode;
  }
}
