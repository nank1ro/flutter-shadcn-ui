// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'accordion.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadAccordionTheme {
  bool get canMerge => true;

  static ShadAccordionTheme? lerp(
    ShadAccordionTheme? a,
    ShadAccordionTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadAccordionTheme(
      iconData: t < 0.5 ? a?.iconData : b?.iconData,
      iconEffects: t < 0.5 ? a?.iconEffects : b?.iconEffects,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      underlineTitleOnHover: t < 0.5
          ? a?.underlineTitleOnHover
          : b?.underlineTitleOnHover,
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      curve: t < 0.5 ? a?.curve : b?.curve,
      duration: lerpDuration$(a?.duration, b?.duration, t),
      maintainState: t < 0.5 ? a?.maintainState : b?.maintainState,
      effects: t < 0.5 ? a?.effects : b?.effects,
    );
  }

  ShadAccordionTheme copyWith({
    IconData? iconData,
    List<Effect<dynamic>>? iconEffects,
    EdgeInsetsGeometry? padding,
    bool? underlineTitleOnHover,
    TextStyle? titleStyle,
    Curve? curve,
    Duration? duration,
    bool? maintainState,
    List<Effect<dynamic>>? effects,
  }) {
    final a = (this as ShadAccordionTheme);

    return ShadAccordionTheme(
      iconData: iconData ?? a.iconData,
      iconEffects: iconEffects ?? a.iconEffects,
      padding: padding ?? a.padding,
      underlineTitleOnHover: underlineTitleOnHover ?? a.underlineTitleOnHover,
      titleStyle: titleStyle ?? a.titleStyle,
      curve: curve ?? a.curve,
      duration: duration ?? a.duration,
      maintainState: maintainState ?? a.maintainState,
      effects: effects ?? a.effects,
    );
  }

  ShadAccordionTheme merge(ShadAccordionTheme? other) {
    final current = (this as ShadAccordionTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      iconData: other.iconData,
      iconEffects: other.iconEffects,
      padding: other.padding,
      underlineTitleOnHover: other.underlineTitleOnHover,
      titleStyle:
          current.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      curve: other.curve,
      duration: other.duration,
      maintainState: other.maintainState,
      effects: other.effects,
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

    final value = (this as ShadAccordionTheme);

    return other is ShadAccordionTheme &&
        other.iconData == value.iconData &&
        other.iconEffects == value.iconEffects &&
        other.padding == value.padding &&
        other.underlineTitleOnHover == value.underlineTitleOnHover &&
        other.titleStyle == value.titleStyle &&
        other.curve == value.curve &&
        other.duration == value.duration &&
        other.maintainState == value.maintainState &&
        other.effects == value.effects;
  }

  @override
  int get hashCode {
    final value = (this as ShadAccordionTheme);

    return Object.hash(
      runtimeType,
      value.iconData,
      value.iconEffects,
      value.padding,
      value.underlineTitleOnHover,
      value.titleStyle,
      value.curve,
      value.duration,
      value.maintainState,
      value.effects,
    );
  }
}
