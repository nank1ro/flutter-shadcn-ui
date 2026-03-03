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
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ShadBreadcrumbTheme(
      separator: t < 0.5 ? a.separator : b.separator,
      ellipsis: t < 0.5 ? a.ellipsis : b.ellipsis,
      separatorSize: lerpDouble$(a.separatorSize, b.separatorSize, t),
      separatorColor: Color.lerp(a.separatorColor, b.separatorColor, t),
      ellipsisSize: lerpDouble$(a.ellipsisSize, b.ellipsisSize, t),
      spacing: lerpDouble$(a.spacing, b.spacing, t),
      itemTextStyle: TextStyle.lerp(a.itemTextStyle, b.itemTextStyle, t),
      linkTextStyle: TextStyle.lerp(a.linkTextStyle, b.linkTextStyle, t),
      linkNormalTextColor: Color.lerp(
        a.linkNormalTextColor,
        b.linkNormalTextColor,
        t,
      ),
      linkHoverTextColor: Color.lerp(
        a.linkHoverTextColor,
        b.linkHoverTextColor,
        t,
      ),
      mainAxisAlignment: t < 0.5 ? a.mainAxisAlignment : b.mainAxisAlignment,
      crossAxisAlignment: t < 0.5 ? a.crossAxisAlignment : b.crossAxisAlignment,
      dropdownMenuBackgroundColor: Color.lerp(
        a.dropdownMenuBackgroundColor,
        b.dropdownMenuBackgroundColor,
        t,
      ),
      dropdownMenuPadding: EdgeInsetsGeometry.lerp(
        a.dropdownMenuPadding,
        b.dropdownMenuPadding,
        t,
      ),
      dropdownTextStyle: TextStyle.lerp(
        a.dropdownTextStyle,
        b.dropdownTextStyle,
        t,
      ),
      dropdownItemPadding: EdgeInsetsGeometry.lerp(
        a.dropdownItemPadding,
        b.dropdownItemPadding,
        t,
      ),
      dropdownMenuAnchor: t < 0.5 ? a.dropdownMenuAnchor : b.dropdownMenuAnchor,
      dropdownArrowGap: lerpDouble$(a.dropdownArrowGap, b.dropdownArrowGap, t),
      lastItemTextColor: Color.lerp(
        a.lastItemTextColor,
        b.lastItemTextColor,
        t,
      ),
      showDropdownArrow: t < 0.5 ? a.showDropdownArrow : b.showDropdownArrow,
    );
  }

  ShadBreadcrumbTheme copyWith({
    Widget? separator,
    Widget? ellipsis,
    double? separatorSize,
    Color? separatorColor,
    double? ellipsisSize,
    double? spacing,
    TextStyle? itemTextStyle,
    TextStyle? linkTextStyle,
    Color? linkNormalTextColor,
    Color? linkHoverTextColor,
    WrapAlignment? mainAxisAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    Color? dropdownMenuBackgroundColor,
    EdgeInsetsGeometry? dropdownMenuPadding,
    TextStyle? dropdownTextStyle,
    EdgeInsetsGeometry? dropdownItemPadding,
    ShadAnchorBase? dropdownMenuAnchor,
    double? dropdownArrowGap,
    Color? lastItemTextColor,
    bool? showDropdownArrow,
  }) {
    final _this = (this as ShadBreadcrumbTheme);

    return ShadBreadcrumbTheme(
      separator: separator ?? _this.separator,
      ellipsis: ellipsis ?? _this.ellipsis,
      separatorSize: separatorSize ?? _this.separatorSize,
      separatorColor: separatorColor ?? _this.separatorColor,
      ellipsisSize: ellipsisSize ?? _this.ellipsisSize,
      spacing: spacing ?? _this.spacing,
      itemTextStyle: itemTextStyle ?? _this.itemTextStyle,
      linkTextStyle: linkTextStyle ?? _this.linkTextStyle,
      linkNormalTextColor: linkNormalTextColor ?? _this.linkNormalTextColor,
      linkHoverTextColor: linkHoverTextColor ?? _this.linkHoverTextColor,
      mainAxisAlignment: mainAxisAlignment ?? _this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? _this.crossAxisAlignment,
      dropdownMenuBackgroundColor:
          dropdownMenuBackgroundColor ?? _this.dropdownMenuBackgroundColor,
      dropdownMenuPadding: dropdownMenuPadding ?? _this.dropdownMenuPadding,
      dropdownTextStyle: dropdownTextStyle ?? _this.dropdownTextStyle,
      dropdownItemPadding: dropdownItemPadding ?? _this.dropdownItemPadding,
      dropdownMenuAnchor: dropdownMenuAnchor ?? _this.dropdownMenuAnchor,
      dropdownArrowGap: dropdownArrowGap ?? _this.dropdownArrowGap,
      lastItemTextColor: lastItemTextColor ?? _this.lastItemTextColor,
      showDropdownArrow: showDropdownArrow ?? _this.showDropdownArrow,
    );
  }

  ShadBreadcrumbTheme merge(ShadBreadcrumbTheme? other) {
    final _this = (this as ShadBreadcrumbTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      separator: other.separator,
      ellipsis: other.ellipsis,
      separatorSize: other.separatorSize,
      separatorColor: other.separatorColor,
      ellipsisSize: other.ellipsisSize,
      spacing: other.spacing,
      itemTextStyle:
          _this.itemTextStyle?.merge(other.itemTextStyle) ??
          other.itemTextStyle,
      linkTextStyle:
          _this.linkTextStyle?.merge(other.linkTextStyle) ??
          other.linkTextStyle,
      linkNormalTextColor: other.linkNormalTextColor,
      linkHoverTextColor: other.linkHoverTextColor,
      mainAxisAlignment: other.mainAxisAlignment,
      crossAxisAlignment: other.crossAxisAlignment,
      dropdownMenuBackgroundColor: other.dropdownMenuBackgroundColor,
      dropdownMenuPadding: other.dropdownMenuPadding,
      dropdownTextStyle:
          _this.dropdownTextStyle?.merge(other.dropdownTextStyle) ??
          other.dropdownTextStyle,
      dropdownItemPadding: other.dropdownItemPadding,
      dropdownMenuAnchor: other.dropdownMenuAnchor,
      dropdownArrowGap: other.dropdownArrowGap,
      lastItemTextColor: other.lastItemTextColor,
      showDropdownArrow: other.showDropdownArrow,
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

    final _this = (this as ShadBreadcrumbTheme);
    final _other = (other as ShadBreadcrumbTheme);

    return _other.separator == _this.separator &&
        _other.ellipsis == _this.ellipsis &&
        _other.separatorSize == _this.separatorSize &&
        _other.separatorColor == _this.separatorColor &&
        _other.ellipsisSize == _this.ellipsisSize &&
        _other.spacing == _this.spacing &&
        _other.itemTextStyle == _this.itemTextStyle &&
        _other.linkTextStyle == _this.linkTextStyle &&
        _other.linkNormalTextColor == _this.linkNormalTextColor &&
        _other.linkHoverTextColor == _this.linkHoverTextColor &&
        _other.mainAxisAlignment == _this.mainAxisAlignment &&
        _other.crossAxisAlignment == _this.crossAxisAlignment &&
        _other.dropdownMenuBackgroundColor ==
            _this.dropdownMenuBackgroundColor &&
        _other.dropdownMenuPadding == _this.dropdownMenuPadding &&
        _other.dropdownTextStyle == _this.dropdownTextStyle &&
        _other.dropdownItemPadding == _this.dropdownItemPadding &&
        _other.dropdownMenuAnchor == _this.dropdownMenuAnchor &&
        _other.dropdownArrowGap == _this.dropdownArrowGap &&
        _other.lastItemTextColor == _this.lastItemTextColor &&
        _other.showDropdownArrow == _this.showDropdownArrow;
  }

  @override
  int get hashCode {
    final _this = (this as ShadBreadcrumbTheme);

    return Object.hashAll([
      runtimeType,
      _this.separator,
      _this.ellipsis,
      _this.separatorSize,
      _this.separatorColor,
      _this.ellipsisSize,
      _this.spacing,
      _this.itemTextStyle,
      _this.linkTextStyle,
      _this.linkNormalTextColor,
      _this.linkHoverTextColor,
      _this.mainAxisAlignment,
      _this.crossAxisAlignment,
      _this.dropdownMenuBackgroundColor,
      _this.dropdownMenuPadding,
      _this.dropdownTextStyle,
      _this.dropdownItemPadding,
      _this.dropdownMenuAnchor,
      _this.dropdownArrowGap,
      _this.lastItemTextColor,
      _this.showDropdownArrow,
    ]);
  }
}
