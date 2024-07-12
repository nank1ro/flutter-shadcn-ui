import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';

@immutable
class ShadPopoverTheme {
  const ShadPopoverTheme({
    this.merge = true,
    this.effects,
    this.shadows,
    this.padding,
    this.decoration,
    this.anchor,
  });

  final bool merge;

  /// {@macro popover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro popover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro popover.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro popover.decoration}
  final ShadDecoration? decoration;

  /// {@macro popover.anchor}
  final ShadAnchorBase? anchor;

  static ShadPopoverTheme lerp(
    ShadPopoverTheme a,
    ShadPopoverTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadPopoverTheme(
      merge: b.merge,
      effects: b.effects,
      shadows: b.shadows,
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      anchor: b.anchor,
    );
  }

  ShadPopoverTheme copyWith({
    bool? merge,
    Duration? waitDuration,
    Duration? showDuration,
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadAnchorBase? anchor,
  }) {
    return ShadPopoverTheme(
      merge: merge ?? this.merge,
      effects: effects ?? this.effects,
      shadows: shadows ?? this.shadows,
      padding: padding ?? this.padding,
      decoration: decoration ?? this.decoration,
      anchor: anchor ?? this.anchor,
    );
  }

  ShadPopoverTheme mergeWith(ShadPopoverTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      effects: other.effects,
      shadows: other.shadows,
      padding: other.padding,
      decoration: decoration?.mergeWith(other.decoration) ?? other.decoration,
      anchor: other.anchor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadPopoverTheme &&
        other.merge == merge &&
        listEquals(other.effects, effects) &&
        listEquals(other.shadows, shadows) &&
        other.padding == padding &&
        other.decoration == decoration &&
        other.anchor == anchor;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        effects.hashCode ^
        shadows.hashCode ^
        padding.hashCode ^
        decoration.hashCode ^
        anchor.hashCode;
  }
}
