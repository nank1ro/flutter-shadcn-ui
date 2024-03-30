import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/image.dart';

@immutable
class ShadAccordionTheme {
  const ShadAccordionTheme({
    this.merge = true,
    this.iconSrc,
    this.iconEffects,
    this.transitionBuilder,
    this.padding,
    this.underlineTitleOnHover,
    this.titleStyle,
    this.curve,
    this.duration,
  });

  final bool merge;
  final ShadImageSrc? iconSrc;
  final List<Effect<dynamic>>? iconEffects;
  final Widget Function(Animation<double> animation, Widget child)?
      transitionBuilder;
  final EdgeInsets? padding;
  final bool? underlineTitleOnHover;
  final TextStyle? titleStyle;
  final Curve? curve;
  final Duration? duration;

  static ShadAccordionTheme lerp(
    ShadAccordionTheme a,
    ShadAccordionTheme b,
    double t,
  ) {
    if (identical(a, b)) return a;
    return ShadAccordionTheme(
      merge: b.merge,
      iconSrc: b.iconSrc,
      iconEffects: b.iconEffects,
      transitionBuilder: b.transitionBuilder,
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      underlineTitleOnHover: b.underlineTitleOnHover,
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      curve: b.curve,
      duration: b.duration,
    );
  }

  ShadAccordionTheme mergeWith(ShadAccordionTheme? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      iconSrc: other.iconSrc,
      iconEffects: other.iconEffects,
      padding: other.padding,
      underlineTitleOnHover: other.underlineTitleOnHover,
      titleStyle: other.titleStyle,
      curve: other.curve,
      duration: other.duration,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadAccordionTheme &&
        other.merge == merge &&
        other.iconSrc == iconSrc &&
        listEquals(other.iconEffects, iconEffects) &&
        other.padding == padding &&
        other.underlineTitleOnHover == underlineTitleOnHover &&
        other.titleStyle == titleStyle &&
        other.curve == curve &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    return merge.hashCode ^
        iconSrc.hashCode ^
        iconEffects.hashCode ^
        padding.hashCode ^
        underlineTitleOnHover.hashCode ^
        titleStyle.hashCode ^
        curve.hashCode ^
        duration.hashCode;
  }

  ShadAccordionTheme copyWith({
    bool? merge,
    ShadImageSrc? iconSrc,
    List<Effect<dynamic>>? iconEffects,
    EdgeInsets? padding,
    bool? underlineTitleOnHover,
    TextStyle? titleStyle,
    Curve? curve,
    Duration? duration,
  }) {
    return ShadAccordionTheme(
      merge: merge ?? this.merge,
      iconSrc: iconSrc ?? this.iconSrc,
      iconEffects: iconEffects ?? this.iconEffects,
      padding: padding ?? this.padding,
      underlineTitleOnHover:
          underlineTitleOnHover ?? this.underlineTitleOnHover,
      titleStyle: titleStyle ?? this.titleStyle,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}
