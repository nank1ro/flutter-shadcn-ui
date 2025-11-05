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
      ellipsisSize: Size.lerp(a?.ellipsisSize, b?.ellipsisSize, t),
      spacing: lerpDouble$(a?.spacing, b?.spacing, t),
      itemTextStyle: TextStyle.lerp(a?.itemTextStyle, b?.itemTextStyle, t),
      linkTextStyle: TextStyle.lerp(a?.linkTextStyle, b?.linkTextStyle, t),
      linkHoverTextStyle: TextStyle.lerp(
        a?.linkHoverTextStyle,
        b?.linkHoverTextStyle,
        t,
      ),
      currentPageTextStyle: TextStyle.lerp(
        a?.currentPageTextStyle,
        b?.currentPageTextStyle,
        t,
      ),
      itemPadding: EdgeInsets.lerp(a?.itemPadding, b?.itemPadding, t),
      pagePadding: EdgeInsets.lerp(a?.pagePadding, b?.pagePadding, t),
      mainAxisAlignment: t < 0.5 ? a?.mainAxisAlignment : b?.mainAxisAlignment,
      crossAxisAlignment: t < 0.5
          ? a?.crossAxisAlignment
          : b?.crossAxisAlignment,
    );
  }

  ShadBreadcrumbTheme copyWith({
    Widget? separator,
    Widget? ellipsis,
    Size? ellipsisSize,
    double? spacing,
    TextStyle? itemTextStyle,
    TextStyle? linkTextStyle,
    TextStyle? linkHoverTextStyle,
    TextStyle? currentPageTextStyle,
    EdgeInsets? itemPadding,
    EdgeInsets? pagePadding,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    final a = (this as ShadBreadcrumbTheme);

    return ShadBreadcrumbTheme(
      separator: separator ?? a.separator,
      ellipsis: ellipsis ?? a.ellipsis,
      ellipsisSize: ellipsisSize ?? a.ellipsisSize,
      spacing: spacing ?? a.spacing,
      itemTextStyle: itemTextStyle ?? a.itemTextStyle,
      linkTextStyle: linkTextStyle ?? a.linkTextStyle,
      linkHoverTextStyle: linkHoverTextStyle ?? a.linkHoverTextStyle,
      currentPageTextStyle: currentPageTextStyle ?? a.currentPageTextStyle,
      itemPadding: itemPadding ?? a.itemPadding,
      pagePadding: pagePadding ?? a.pagePadding,
      mainAxisAlignment: mainAxisAlignment ?? a.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? a.crossAxisAlignment,
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
      ellipsisSize: other.ellipsisSize,
      spacing: other.spacing,
      itemTextStyle:
          current.itemTextStyle?.merge(other.itemTextStyle) ??
          other.itemTextStyle,
      linkTextStyle:
          current.linkTextStyle?.merge(other.linkTextStyle) ??
          other.linkTextStyle,
      linkHoverTextStyle:
          current.linkHoverTextStyle?.merge(other.linkHoverTextStyle) ??
          other.linkHoverTextStyle,
      currentPageTextStyle:
          current.currentPageTextStyle?.merge(other.currentPageTextStyle) ??
          other.currentPageTextStyle,
      itemPadding: other.itemPadding,
      pagePadding: other.pagePadding,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
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
        other.ellipsisSize == value.ellipsisSize &&
        other.spacing == value.spacing &&
        other.itemTextStyle == value.itemTextStyle &&
        other.linkTextStyle == value.linkTextStyle &&
        other.linkHoverTextStyle == value.linkHoverTextStyle &&
        other.currentPageTextStyle == value.currentPageTextStyle &&
        other.itemPadding == value.itemPadding &&
        other.pagePadding == value.pagePadding &&
        other.mainAxisAlignment == value.mainAxisAlignment &&
        other.crossAxisAlignment == value.crossAxisAlignment;
  }

  @override
  int get hashCode {
    final value = (this as ShadBreadcrumbTheme);

    return Object.hash(
      runtimeType,
      value.separator,
      value.ellipsis,
      value.ellipsisSize,
      value.spacing,
      value.itemTextStyle,
      value.linkTextStyle,
      value.linkHoverTextStyle,
      value.currentPageTextStyle,
      value.itemPadding,
      value.pagePadding,
      value.mainAxisAlignment,
      value.crossAxisAlignment,
    );
  }
}
