// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'alert.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadAlertTheme {
  bool get canMerge => true;

  static ShadAlertTheme? lerp(ShadAlertTheme? a, ShadAlertTheme? b, double t) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadAlertTheme(
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      iconPadding: EdgeInsetsGeometry.lerp(a.iconPadding, b.iconPadding, t),
      iconColor: Color.lerp(a.iconColor, b.iconColor, t),
      titleStyle: TextStyle.lerp(a.titleStyle, b.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a.descriptionStyle,
        b.descriptionStyle,
        t,
      ),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      iconSize: lerpDouble$(a.iconSize, b.iconSize, t),
    );
  }

  ShadAlertTheme copyWith({
    ShadDecoration? decoration,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    double? iconSize,
  }) {
    final _this = (this as ShadAlertTheme);

    return ShadAlertTheme(
      decoration: decoration ?? _this.decoration,
      iconPadding: iconPadding ?? _this.iconPadding,
      iconColor: iconColor ?? _this.iconColor,
      titleStyle: titleStyle ?? _this.titleStyle,
      descriptionStyle: descriptionStyle ?? _this.descriptionStyle,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      iconSize: iconSize ?? _this.iconSize,
    );
  }

  ShadAlertTheme merge(ShadAlertTheme? other) {
    final _this = (this as ShadAlertTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      iconPadding: other.iconPadding,
      iconColor: other.iconColor,
      titleStyle: _this.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          _this.descriptionStyle?.merge(other.descriptionStyle) ??
          other.descriptionStyle,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      iconSize: other.iconSize,
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

    final _this = (this as ShadAlertTheme);
    final _other = (other as ShadAlertTheme);

    return _other.decoration == _this.decoration &&
        _other.iconPadding == _this.iconPadding &&
        _other.iconColor == _this.iconColor &&
        _other.titleStyle == _this.titleStyle &&
        _other.descriptionStyle == _this.descriptionStyle &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.iconSize == _this.iconSize;
  }

  @override
  int get hashCode {
    final _this = (this as ShadAlertTheme);

    return Object.hash(
      runtimeType,
      _this.decoration,
      _this.iconPadding,
      _this.iconColor,
      _this.titleStyle,
      _this.descriptionStyle,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.iconSize,
    );
  }
}
