import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadTooltipTheme {
  const ShadTooltipTheme({
    this.merge = true,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
    this.longPressDuration,
    this.duration,
    this.reverseDuration,
  });

  final bool merge;

  /// {@macro ShadTooltip.waitDuration}
  final Duration? waitDuration;

  /// {@macro ShadTooltip.showDuration}
  final Duration? showDuration;

  /// {@macro ShadTooltip.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadTooltip.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro ShadTooltip.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadTooltip.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadTooltip.hoverStrategies}
  final ShadHoverStrategies? hoverStrategies;

  /// {@macro ShadTooltip.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadTooltip.duration}
  final Duration? duration;

  /// {@macro ShadTooltip.reverseDuration}
  final Duration? reverseDuration;

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
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      anchor: b.anchor,
      hoverStrategies: b.hoverStrategies,
      longPressDuration:
          a.longPressDuration != null && b.longPressDuration != null
              ? lerpDuration(a.longPressDuration!, b.longPressDuration!, t)
              : b.longPressDuration,
      duration: a.duration != null && b.duration != null
          ? lerpDuration(a.duration!, b.duration!, t)
          : b.duration,
      reverseDuration: a.reverseDuration != null && b.reverseDuration != null
          ? lerpDuration(a.reverseDuration!, b.reverseDuration!, t)
          : b.reverseDuration,
    );
  }

  ShadTooltipTheme copyWith({
    bool? merge,
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadAnchorBase? anchor,
    ShadHoverStrategies? hoverStrategies,
    Duration? longPressDuration,
    Duration? duration,
    Duration? reverseDuration,
  }) {
    return ShadTooltipTheme(
      merge: merge ?? this.merge,
      waitDuration: waitDuration ?? this.waitDuration,
      showDuration: showDuration ?? this.showDuration,
      effects: effects ?? this.effects,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      anchor: anchor ?? this.anchor,
      hoverStrategies: hoverStrategies ?? this.hoverStrategies,
      longPressDuration: longPressDuration ?? this.longPressDuration,
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
    );
  }

  ShadTooltipTheme mergeWith(ShadTooltipTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      waitDuration: other.waitDuration,
      showDuration: other.showDuration,
      effects: other.effects,
      padding: other.padding,
      decoration: other.decoration,
      anchor: other.anchor,
      hoverStrategies: other.hoverStrategies,
      longPressDuration: other.longPressDuration,
      duration: other.duration,
      reverseDuration: other.reverseDuration,
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
        other.padding == padding &&
        other.decoration == decoration &&
        other.anchor == anchor &&
        other.hoverStrategies == hoverStrategies &&
        other.longPressDuration == longPressDuration &&
        other.duration == duration &&
        other.reverseDuration == reverseDuration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        waitDuration.hashCode ^
        showDuration.hashCode ^
        effects.hashCode ^
        padding.hashCode ^
        decoration.hashCode ^
        anchor.hashCode ^
        hoverStrategies.hashCode ^
        longPressDuration.hashCode ^
        duration.hashCode ^
        reverseDuration.hashCode;
  }
}
