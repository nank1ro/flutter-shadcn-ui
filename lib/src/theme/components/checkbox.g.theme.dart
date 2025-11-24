// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'checkbox.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadCheckboxTheme {
  bool get canMerge => true;

  static ShadCheckboxTheme? lerp(
    ShadCheckboxTheme? a,
    ShadCheckboxTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadCheckboxTheme(
      color: Color.lerp(a?.color, b?.color, t),
      size: lerpDouble$(a?.size, b?.size, t),
      duration: lerpDuration$(a?.duration, b?.duration, t),
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      checkboxPadding: EdgeInsetsGeometry.lerp(
        a?.checkboxPadding,
        b?.checkboxPadding,
        t,
      ),
    );
  }

  ShadCheckboxTheme copyWith({
    Color? color,
    double? size,
    Duration? duration,
    ShadDecoration? decoration,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsetsGeometry? checkboxPadding,
  }) {
    final _this = (this as ShadCheckboxTheme);

    return ShadCheckboxTheme(
      color: color ?? _this.color,
      size: size ?? _this.size,
      duration: duration ?? _this.duration,
      decoration: decoration ?? _this.decoration,
      padding: padding ?? _this.padding,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      checkboxPadding: checkboxPadding ?? _this.checkboxPadding,
    );
  }

  ShadCheckboxTheme merge(ShadCheckboxTheme? other) {
    final _this = (this as ShadCheckboxTheme);

    if (other == null) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      color: other.color,
      size: other.size,
      duration: other.duration,
      decoration: other.decoration,
      padding: other.padding,
      crossAxisAlignment: other.crossAxisAlignment,
      checkboxPadding: other.checkboxPadding,
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

    final _this = (this as ShadCheckboxTheme);
    final _other = (other as ShadCheckboxTheme);

    return _other.color == _this.color &&
        _other.size == _this.size &&
        _other.duration == _this.duration &&
        _other.decoration == _this.decoration &&
        _other.padding == _this.padding &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.checkboxPadding == _this.checkboxPadding;
  }

  @override
  int get hashCode {
    final _this = (this as ShadCheckboxTheme);

    return Object.hash(
      runtimeType,
      _this.color,
      _this.size,
      _this.duration,
      _this.decoration,
      _this.padding,
      _this.crossAxisAlignment,
      _this.checkboxPadding,
    );
  }
}
