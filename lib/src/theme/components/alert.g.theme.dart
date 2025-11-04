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
    if (a == null && b == null) {
      return null;
    }

    return ShadAlertTheme(
      decoration: ShadDecoration.lerp(a?.decoration, b?.decoration, t),
      iconPadding: EdgeInsetsGeometry.lerp(a?.iconPadding, b?.iconPadding, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      descriptionStyle: TextStyle.lerp(
        a?.descriptionStyle,
        b?.descriptionStyle,
        t,
      ),
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      iconSize: lerpDouble$(a?.iconSize, b?.iconSize, t),
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
    final a = (this as ShadAlertTheme);

    return ShadAlertTheme(
      decoration: decoration ?? a.decoration,
      iconPadding: iconPadding ?? a.iconPadding,
      iconColor: iconColor ?? a.iconColor,
      titleStyle: titleStyle ?? a.titleStyle,
      descriptionStyle: descriptionStyle ?? a.descriptionStyle,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      iconSize: iconSize ?? a.iconSize,
    );
  }

  ShadAlertTheme merge(ShadAlertTheme? other) {
    final current = (this as ShadAlertTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      decoration: other.decoration,
      iconPadding: other.iconPadding,
      iconColor: other.iconColor,
      titleStyle:
          current.titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      descriptionStyle:
          current.descriptionStyle?.merge(other.descriptionStyle) ??
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

    final value = (this as ShadAlertTheme);

    return other is ShadAlertTheme &&
        other.decoration == value.decoration &&
        other.iconPadding == value.iconPadding &&
        other.iconColor == value.iconColor &&
        other.titleStyle == value.titleStyle &&
        other.descriptionStyle == value.descriptionStyle &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.iconSize == value.iconSize;
  }

  @override
  int get hashCode {
    final value = (this as ShadAlertTheme);

    return Object.hash(
      runtimeType,
      value.decoration,
      value.iconPadding,
      value.iconColor,
      value.titleStyle,
      value.descriptionStyle,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.iconSize,
    );
  }
}
