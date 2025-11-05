// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'breadcrumb.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadBreadcrumbTheme {
  bool get canMerge => true;

  static ShadBreadcrumbTheme? lerp(
    ShadBreadcrumbTheme? a,
    ShadBreadcrumbTheme? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }

    return ShadBreadcrumbTheme(
      separator: t < 0.5 ? a?.separator : b?.separator,
      ellipsis: t < 0.5 ? a?.ellipsis : b?.ellipsis,
      separatorSize: lerpDouble$(a?.separatorSize, b?.separatorSize, t),
      ellipsisSize: lerpDouble$(a?.ellipsisSize, b?.ellipsisSize, t),
      spacing: lerpDouble$(a?.spacing, b?.spacing, t),
      itemTextStyle: TextStyle.lerp(a?.itemTextStyle, b?.itemTextStyle, t),
      linkTextStyle: TextStyle.lerp(a?.linkTextStyle, b?.linkTextStyle, t),
      linkNormalTextColor: Color.lerp(
        a?.linkNormalTextColor,
        b?.linkNormalTextColor,
        t,
      ),
      linkHoverTextColor: Color.lerp(
        a?.linkHoverTextColor,
        b?.linkHoverTextColor,
        t,
      ),
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
      dropdownMenuBackgroundColor: Color.lerp(
        a?.dropdownMenuBackgroundColor,
        b?.dropdownMenuBackgroundColor,
        t,
      ),
      dropdownMenuPadding: EdgeInsets.lerp(
        a?.dropdownMenuPadding,
        b?.dropdownMenuPadding,
        t,
      ),
      dropdownTextStyle: TextStyle.lerp(
        a?.dropdownTextStyle,
        b?.dropdownTextStyle,
        t,
      ),
      dropdownItemPadding: EdgeInsets.lerp(
        a?.dropdownItemPadding,
        b?.dropdownItemPadding,
        t,
      ),
    );
  }

  ShadBreadcrumbTheme copyWith({
    Widget? separator,
    Widget? ellipsis,
    double? separatorSize,
    double? ellipsisSize,
    double? spacing,
    TextStyle? itemTextStyle,
    TextStyle? linkTextStyle,
    Color? linkNormalTextColor,
    Color? linkHoverTextColor,
    WrapAlignment? mainAxisAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    Color? dropdownMenuBackgroundColor,
    EdgeInsets? dropdownMenuPadding,
    TextStyle? dropdownTextStyle,
    EdgeInsets? dropdownItemPadding,
  }) {
    final a = (this as ShadBreadcrumbTheme);

    return ShadBreadcrumbTheme(
      separator: separator ?? a.separator,
      ellipsis: ellipsis ?? a.ellipsis,
      separatorSize: separatorSize ?? a.separatorSize,
      ellipsisSize: ellipsisSize ?? a.ellipsisSize,
      spacing: spacing ?? a.spacing,
      itemTextStyle: itemTextStyle ?? a.itemTextStyle,
      linkTextStyle: linkTextStyle ?? a.linkTextStyle,
      linkNormalTextColor: linkNormalTextColor ?? a.linkNormalTextColor,
      linkHoverTextColor: linkHoverTextColor ?? a.linkHoverTextColor,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
      dropdownMenuBackgroundColor:
          dropdownMenuBackgroundColor ?? a.dropdownMenuBackgroundColor,
      dropdownMenuPadding: dropdownMenuPadding ?? a.dropdownMenuPadding,
      dropdownTextStyle: dropdownTextStyle ?? a.dropdownTextStyle,
      dropdownItemPadding: dropdownItemPadding ?? a.dropdownItemPadding,
    );
  }

  ShadBreadcrumbTheme merge(ShadBreadcrumbTheme? other) {
    final current = (this as ShadBreadcrumbTheme);

    if (other == null) {
      return current;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      separator: other.separator,
      ellipsis: other.ellipsis,
      separatorSize: other.separatorSize,
      ellipsisSize: other.ellipsisSize,
      spacing: other.spacing,
      itemTextStyle:
          current.itemTextStyle?.merge(other.itemTextStyle) ??
          other.itemTextStyle,
      linkTextStyle:
          current.linkTextStyle?.merge(other.linkTextStyle) ??
          other.linkTextStyle,
      linkNormalTextColor: other.linkNormalTextColor,
      linkHoverTextColor: other.linkHoverTextColor,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      dropdownMenuBackgroundColor: other.dropdownMenuBackgroundColor,
      dropdownMenuPadding: other.dropdownMenuPadding,
      dropdownTextStyle:
          current.dropdownTextStyle?.merge(other.dropdownTextStyle) ??
          other.dropdownTextStyle,
      dropdownItemPadding: other.dropdownItemPadding,
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

    final value = (this as ShadBreadcrumbTheme);

    return other is ShadBreadcrumbTheme &&
        other.separator == value.separator &&
        other.ellipsis == value.ellipsis &&
        other.separatorSize == value.separatorSize &&
        other.ellipsisSize == value.ellipsisSize &&
        other.spacing == value.spacing &&
        other.itemTextStyle == value.itemTextStyle &&
        other.linkTextStyle == value.linkTextStyle &&
        other.linkNormalTextColor == value.linkNormalTextColor &&
        other.linkHoverTextColor == value.linkHoverTextColor &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment &&
        other.dropdownMenuBackgroundColor ==
            value.dropdownMenuBackgroundColor &&
        other.dropdownMenuPadding == value.dropdownMenuPadding &&
        other.dropdownTextStyle == value.dropdownTextStyle &&
        other.dropdownItemPadding == value.dropdownItemPadding;
  }

  @override
  int get hashCode {
    final value = (this as ShadBreadcrumbTheme);

    return Object.hash(
      runtimeType,
      value.separator,
      value.ellipsis,
      value.separatorSize,
      value.ellipsisSize,
      value.spacing,
      value.itemTextStyle,
      value.linkTextStyle,
      value.linkNormalTextColor,
      value.linkHoverTextColor,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
      value.dropdownMenuBackgroundColor,
      value.dropdownMenuPadding,
      value.dropdownTextStyle,
      value.dropdownItemPadding,
    );
  }
}
