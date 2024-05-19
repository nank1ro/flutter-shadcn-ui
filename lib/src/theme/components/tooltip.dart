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
  });

  final bool merge;

  /// {@macro tooltip.waitDuration}
  final Duration? waitDuration;

  /// {@macro tooltip.showDuration}
  final Duration? showDuration;

  /// {@macro tooltip.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro tooltip.anchor}
  final ShadAnchorBase? anchor;

  /// {@macro tooltip.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro tooltip.decoration}
  final ShadDecoration? decoration;

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
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
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
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadAnchorBase? anchor,
    ShadHoverStrategies? hoverStrategies,
    Duration? longPressDuration,
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
        other.longPressDuration == longPressDuration;
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
        longPressDuration.hashCode;
  }
}
