// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'spinner.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSpinnerTheme {
  bool get canMerge => true;

  static ShadSpinnerTheme? lerp(
    ShadSpinnerTheme? a,
    ShadSpinnerTheme? b,
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

    return ShadSpinnerTheme(
      size: lerpDouble$(a.size, b.size, t),
      color: Color.lerp(a.color, b.color, t),
      icon: t < 0.5 ? a.icon : b.icon,
      duration: lerpDuration$(a.duration, b.duration, t),
      animate: t < 0.5 ? a.animate : b.animate,
      semanticsLabel: t < 0.5 ? a.semanticsLabel : b.semanticsLabel,
    );
  }

  ShadSpinnerTheme copyWith({
    double? size,
    Color? color,
    IconData? icon,
    Duration? duration,
    bool? animate,
    String? semanticsLabel,
  }) {
    final _this = (this as ShadSpinnerTheme);

    return ShadSpinnerTheme(
      size: size ?? _this.size,
      color: color ?? _this.color,
      icon: icon ?? _this.icon,
      duration: duration ?? _this.duration,
      animate: animate ?? _this.animate,
      semanticsLabel: semanticsLabel ?? _this.semanticsLabel,
    );
  }

  ShadSpinnerTheme merge(ShadSpinnerTheme? other) {
    final _this = (this as ShadSpinnerTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      size: other.size,
      color: other.color,
      icon: other.icon,
      duration: other.duration,
      animate: other.animate,
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

    final _this = (this as ShadSpinnerTheme);
    final _other = (other as ShadSpinnerTheme);

    return _other.size == _this.size &&
        _other.color == _this.color &&
        _other.icon == _this.icon &&
        _other.duration == _this.duration &&
        _other.animate == _this.animate &&
        _other.semanticsLabel == _this.semanticsLabel;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSpinnerTheme);

    return Object.hash(
      runtimeType,
      _this.size,
      _this.color,
      _this.icon,
      _this.duration,
      _this.animate,
      _this.semanticsLabel,
    );
  }
}
