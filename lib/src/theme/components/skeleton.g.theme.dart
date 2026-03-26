// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'skeleton.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSkeletonTheme {
  bool get canMerge => true;

  static ShadSkeletonTheme? lerp(
    ShadSkeletonTheme? a,
    ShadSkeletonTheme? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadSkeletonTheme(
      color: Color.lerp(a.color, b.color, t),
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      pulseHalfDuration: lerpDuration$(
        a.pulseHalfDuration,
        b.pulseHalfDuration,
        t,
      ),
      pulseCurve: t < 0.5 ? a.pulseCurve : b.pulseCurve,
      minPulseOpacity: lerpDouble$(a.minPulseOpacity, b.minPulseOpacity, t),
      semanticsLabel: t < 0.5 ? a.semanticsLabel : b.semanticsLabel,
    );
  }

  ShadSkeletonTheme copyWith({
    Color? color,
    BorderRadius? borderRadius,
    Duration? pulseHalfDuration,
    Curve? pulseCurve,
    double? minPulseOpacity,
    String? semanticsLabel,
  }) {
    final _this = (this as ShadSkeletonTheme);

    return ShadSkeletonTheme(
      color: color ?? _this.color,
      borderRadius: borderRadius ?? _this.borderRadius,
      pulseHalfDuration: pulseHalfDuration ?? _this.pulseHalfDuration,
      pulseCurve: pulseCurve ?? _this.pulseCurve,
      minPulseOpacity: minPulseOpacity ?? _this.minPulseOpacity,
      semanticsLabel: semanticsLabel ?? _this.semanticsLabel,
    );
  }

  ShadSkeletonTheme merge(ShadSkeletonTheme? other) {
    final _this = (this as ShadSkeletonTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      color: other.color,
      borderRadius: other.borderRadius,
      pulseHalfDuration: other.pulseHalfDuration,
      pulseCurve: other.pulseCurve,
      minPulseOpacity: other.minPulseOpacity,
      semanticsLabel: other.semanticsLabel,
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

    final _this = (this as ShadSkeletonTheme);
    final _other = (other as ShadSkeletonTheme);

    return _other.color == _this.color &&
        _other.borderRadius == _this.borderRadius &&
        _other.pulseHalfDuration == _this.pulseHalfDuration &&
        _other.pulseCurve == _this.pulseCurve &&
        _other.minPulseOpacity == _this.minPulseOpacity &&
        _other.semanticsLabel == _this.semanticsLabel;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSkeletonTheme);

    return Object.hash(
      runtimeType,
      _this.color,
      _this.borderRadius,
      _this.pulseHalfDuration,
      _this.pulseCurve,
      _this.minPulseOpacity,
      _this.semanticsLabel,
    );
  }
}
