import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

@immutable
class ShadAccordionTheme {
  const ShadAccordionTheme({
    this.merge = true,
    this.iconData,
    this.iconEffects,
    this.padding,
    this.underlineTitleOnHover,
    this.titleStyle,
    this.curve,
    this.duration,
    this.maintainState,
    this.effects,
  });

  final bool merge;
  final IconData? iconData;
  final List<Effect<dynamic>>? iconEffects;
  final EdgeInsets? padding;
  final bool? underlineTitleOnHover;
  final TextStyle? titleStyle;
  final Curve? curve;
  final Duration? duration;
  final bool? maintainState;
  final List<Effect<dynamic>>? effects;

  static ShadAccordionTheme lerp(
    ShadAccordionTheme a,
    ShadAccordionTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadAccordionTheme(
      merge: t < 0.5 ? a.merge : b.merge,
      iconData: t < 0.5 ? a.iconData : b.iconData,
      iconEffects: t < 0.5 ? a.iconEffects : b.iconEffects,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      underlineTitleOnHover:
          t < 0.5 ? a.underlineTitleOnHover : b.underlineTitleOnHover,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      curve: t < 0.5 ? a.curve : b.curve,
      duration: t < 0.5 ? a.duration : b.duration,
      maintainState: t < 0.5 ? a.maintainState : b.maintainState,
      effects: t < 0.5 ? a.effects : b.effects,
    );
  }

  ShadAccordionTheme mergeWith(ShadAccordionTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      iconData: other.iconData,
      iconEffects: other.iconEffects,
      padding: other.padding,
      underlineTitleOnHover: other.underlineTitleOnHover,
      titleStyle: other.titleStyle,
      curve: other.curve,
      duration: other.duration,
      maintainState: other.maintainState,
      effects: other.effects,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAccordionTheme &&
        other.merge == merge &&
        other.iconData == iconData &&
        listEquals(other.iconEffects, iconEffects) &&
        other.padding == padding &&
        other.underlineTitleOnHover == underlineTitleOnHover &&
        other.titleStyle == titleStyle &&
        other.curve == curve &&
        other.duration == duration &&
        other.maintainState == maintainState &&
        listEquals(other.effects, effects);
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        iconData.hashCode ^
        iconEffects.hashCode ^
        padding.hashCode ^
        underlineTitleOnHover.hashCode ^
        titleStyle.hashCode ^
        curve.hashCode ^
        duration.hashCode ^
        maintainState.hashCode ^
        effects.hashCode;
  }

  ShadAccordionTheme copyWith({
    bool? merge,
    IconData? iconData,
    List<Effect<dynamic>>? iconEffects,
    EdgeInsets? padding,
    bool? underlineTitleOnHover,
    TextStyle? titleStyle,
    Curve? curve,
    Duration? duration,
    bool? maintainState,
    List<Effect<dynamic>>? effects,
  }) {
    return ShadAccordionTheme(
      merge: merge ?? this.merge,
      iconData: iconData ?? this.iconData,
      iconEffects: iconEffects ?? this.iconEffects,
      padding: padding ?? this.padding,
      underlineTitleOnHover:
          underlineTitleOnHover ?? this.underlineTitleOnHover,
      titleStyle: titleStyle ?? this.titleStyle,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      maintainState: maintainState ?? this.maintainState,
      effects: effects ?? this.effects,
    );
  }
}
