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
      underlineTitleOnHover:
          t < 0.5 ? a?.underlineTitleOnHover : b?.underlineTitleOnHover,
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
    final _this = (this as ShadAccordionTheme);

    return ShadAccordionTheme(
      iconData: iconData ?? _this.iconData,
      iconEffects: iconEffects ?? _this.iconEffects,
      padding: padding ?? _this.padding,
      underlineTitleOnHover:
          underlineTitleOnHover ?? _this.underlineTitleOnHover,
      titleStyle: titleStyle ?? _this.titleStyle,
      curve: curve ?? _this.curve,
      duration: duration ?? _this.duration,
      maintainState: maintainState ?? _this.maintainState,
      effects: effects ?? _this.effects,
    );
  }

  ShadAccordionTheme merge(ShadAccordionTheme? other) {
    final _this = (this as ShadAccordionTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      iconData: other.iconData,
      iconEffects: other.iconEffects,
      padding: other.padding,
      underlineTitleOnHover: other.underlineTitleOnHover,
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
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

    final _this = (this as ShadAccordionTheme);
    final _other = (other as ShadAccordionTheme);

    return _other.iconData == _this.iconData &&
        _other.iconEffects == _this.iconEffects &&
        _other.padding == _this.padding &&
        _other.underlineTitleOnHover == _this.underlineTitleOnHover &&
        _other.titleStyle == _this.titleStyle &&
        _other.curve == _this.curve &&
        _other.duration == _this.duration &&
        _other.maintainState == _this.maintainState &&
        _other.effects == _this.effects;
  }

  @override
  int get hashCode {
    final _this = (this as ShadAccordionTheme);

    return Object.hash(
      runtimeType,
      _this.iconData,
      _this.iconEffects,
      _this.padding,
      _this.underlineTitleOnHover,
      _this.titleStyle,
      _this.curve,
      _this.duration,
      _this.maintainState,
      _this.effects,
    );
  }
}
