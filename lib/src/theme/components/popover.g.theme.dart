// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'popover.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadPopoverTheme {
  bool get canMerge => true;

  static ShadPopoverTheme? lerp(
    ShadPopoverTheme? a,
    ShadPopoverTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadPopoverTheme(
      effects: t < 0.5 ? a?.effects : b?.effects,
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      anchor: t < 0.5 ? a?.anchor : b?.anchor,
      filter: t < 0.5 ? a?.filter : b?.filter,
      reverseDuration: lerpDuration$(a?.reverseDuration, b?.reverseDuration, t),
    );
  }

  ShadPopoverTheme copyWith({
    List<Effect<dynamic>>? effects,
    List<BoxShadow>? shadows,
    EdgeInsetsGeometry? padding,
    ShadDecoration? decoration,
    ShadAnchorBase? anchor,
    ImageFilter? filter,
    Duration? reverseDuration,
  }) {
    final _this = (this as ShadPopoverTheme);

    return ShadPopoverTheme(
      effects: effects ?? _this.effects,
      shadows: shadows ?? _this.shadows,
      padding: padding ?? _this.padding,
      decoration: decoration ?? _this.decoration,
      anchor: anchor ?? _this.anchor,
      filter: filter ?? _this.filter,
      reverseDuration: reverseDuration ?? _this.reverseDuration,
    );
  }

  ShadPopoverTheme merge(ShadPopoverTheme? other) {
    final _this = (this as ShadPopoverTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      effects: other.effects,
      shadows: other.shadows,
      padding: other.padding,
      decoration: other.decoration,
      anchor: other.anchor,
      filter: other.filter,
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

    final _this = (this as ShadPopoverTheme);
    final _other = (other as ShadPopoverTheme);

    return _other.effects == _this.effects &&
        _other.shadows == _this.shadows &&
        _other.padding == _this.padding &&
        _other.decoration == _this.decoration &&
        _other.anchor == _this.anchor &&
        _other.filter == _this.filter &&
        _other.reverseDuration == _this.reverseDuration;
  }

  @override
  int get hashCode {
    final _this = (this as ShadPopoverTheme);

    return Object.hash(
      runtimeType,
      _this.effects,
      _this.shadows,
      _this.padding,
      _this.decoration,
      _this.anchor,
      _this.filter,
      _this.reverseDuration,
    );
  }
}
