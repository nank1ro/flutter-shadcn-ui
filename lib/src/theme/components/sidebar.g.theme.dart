// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'sidebar.dart';

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ShadSidebarTheme {
  bool get canMerge => true;

  static ShadSidebarTheme? lerp(
    ShadSidebarTheme? a,
    ShadSidebarTheme? b,
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

    return ShadSidebarTheme(
      width: lerpDouble$(a.width, b.width, t),
      collapsedWidth: lerpDouble$(a.collapsedWidth, b.collapsedWidth, t),
      mobileBreakpoint: lerpDouble$(a.mobileBreakpoint, b.mobileBreakpoint, t),
      animationDuration: lerpDuration$(
        a.animationDuration,
        b.animationDuration,
        t,
      ),
      animationCurve: t < 0.5 ? a.animationCurve : b.animationCurve,
      decoration: ShadDecoration.lerp(a.decoration, b.decoration, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      headerPadding: EdgeInsetsGeometry.lerp(
        a.headerPadding,
        b.headerPadding,
        t,
      ),
      headerDecoration: ShadDecoration.lerp(
        a.headerDecoration,
        b.headerDecoration,
        t,
      ),
      footerDecoration: ShadDecoration.lerp(
        a.footerDecoration,
        b.footerDecoration,
        t,
      ),
      footerPadding: EdgeInsetsGeometry.lerp(
        a.footerPadding,
        b.footerPadding,
        t,
      ),
      contentPadding: EdgeInsetsGeometry.lerp(
        a.contentPadding,
        b.contentPadding,
        t,
      ),
      groupPadding: EdgeInsetsGeometry.lerp(a.groupPadding, b.groupPadding, t),
      groupLabelStyle: TextStyle.lerp(a.groupLabelStyle, b.groupLabelStyle, t),
      groupLabelPadding: EdgeInsetsGeometry.lerp(
        a.groupLabelPadding,
        b.groupLabelPadding,
        t,
      ),
      itemHeight: lerpDouble$(a.itemHeight, b.itemHeight, t),
      itemPadding: EdgeInsetsGeometry.lerp(a.itemPadding, b.itemPadding, t),
      itemBorderRadius: BorderRadiusGeometry.lerp(
        a.itemBorderRadius,
        b.itemBorderRadius,
        t,
      ),
      itemHoverColor: Color.lerp(a.itemHoverColor, b.itemHoverColor, t),
      itemActiveColor: Color.lerp(a.itemActiveColor, b.itemActiveColor, t),
      itemTextStyle: TextStyle.lerp(a.itemTextStyle, b.itemTextStyle, t),
      itemActiveTextStyle: TextStyle.lerp(
        a.itemActiveTextStyle,
        b.itemActiveTextStyle,
        t,
      ),
      itemIconSize: lerpDouble$(a.itemIconSize, b.itemIconSize, t),
      itemIconColor: Color.lerp(a.itemIconColor, b.itemIconColor, t),
      itemActiveIconColor: Color.lerp(
        a.itemActiveIconColor,
        b.itemActiveIconColor,
        t,
      ),
      itemSpacing: lerpDouble$(a.itemSpacing, b.itemSpacing, t),
      subItemsMargin: EdgeInsetsGeometry.lerp(
        a.subItemsMargin,
        b.subItemsMargin,
        t,
      ),
      subItemsPadding: EdgeInsetsGeometry.lerp(
        a.subItemsPadding,
        b.subItemsPadding,
        t,
      ),
      subItemsBorderColor: Color.lerp(
        a.subItemsBorderColor,
        b.subItemsBorderColor,
        t,
      ),
      subItemsBorderWidth: lerpDouble$(
        a.subItemsBorderWidth,
        b.subItemsBorderWidth,
        t,
      ),
      subItemHeight: lerpDouble$(a.subItemHeight, b.subItemHeight, t),
      subItemPadding: EdgeInsetsGeometry.lerp(
        a.subItemPadding,
        b.subItemPadding,
        t,
      ),
      subItemBorderRadius: BorderRadiusGeometry.lerp(
        a.subItemBorderRadius,
        b.subItemBorderRadius,
        t,
      ),
      subItemTextStyle: TextStyle.lerp(
        a.subItemTextStyle,
        b.subItemTextStyle,
        t,
      ),
      subItemActiveTextStyle: TextStyle.lerp(
        a.subItemActiveTextStyle,
        b.subItemActiveTextStyle,
        t,
      ),
      separatorPadding: EdgeInsetsGeometry.lerp(
        a.separatorPadding,
        b.separatorPadding,
        t,
      ),
      separatorColor: Color.lerp(a.separatorColor, b.separatorColor, t),
      separatorThickness: lerpDouble$(
        a.separatorThickness,
        b.separatorThickness,
        t,
      ),
      triggerSize: lerpDouble$(a.triggerSize, b.triggerSize, t),
      triggerPadding: EdgeInsetsGeometry.lerp(
        a.triggerPadding,
        b.triggerPadding,
        t,
      ),
      floatingMargin: EdgeInsetsGeometry.lerp(
        a.floatingMargin,
        b.floatingMargin,
        t,
      ),
      floatingBorderRadius: BorderRadiusGeometry.lerp(
        a.floatingBorderRadius,
        b.floatingBorderRadius,
        t,
      ),
      floatingShadow: t < 0.5 ? a.floatingShadow : b.floatingShadow,
    );
  }

  ShadSidebarTheme copyWith({
    double? width,
    double? collapsedWidth,
    double? mobileBreakpoint,
    Duration? animationDuration,
    Curve? animationCurve,
    ShadDecoration? decoration,
    Color? backgroundColor,
    EdgeInsetsGeometry? headerPadding,
    ShadDecoration? headerDecoration,
    ShadDecoration? footerDecoration,
    EdgeInsetsGeometry? footerPadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? groupPadding,
    TextStyle? groupLabelStyle,
    EdgeInsetsGeometry? groupLabelPadding,
    double? itemHeight,
    EdgeInsetsGeometry? itemPadding,
    BorderRadiusGeometry? itemBorderRadius,
    Color? itemHoverColor,
    Color? itemActiveColor,
    TextStyle? itemTextStyle,
    TextStyle? itemActiveTextStyle,
    double? itemIconSize,
    Color? itemIconColor,
    Color? itemActiveIconColor,
    double? itemSpacing,
    EdgeInsetsGeometry? subItemsMargin,
    EdgeInsetsGeometry? subItemsPadding,
    Color? subItemsBorderColor,
    double? subItemsBorderWidth,
    double? subItemHeight,
    EdgeInsetsGeometry? subItemPadding,
    BorderRadiusGeometry? subItemBorderRadius,
    TextStyle? subItemTextStyle,
    TextStyle? subItemActiveTextStyle,
    EdgeInsetsGeometry? separatorPadding,
    Color? separatorColor,
    double? separatorThickness,
    double? triggerSize,
    EdgeInsetsGeometry? triggerPadding,
    EdgeInsetsGeometry? floatingMargin,
    BorderRadiusGeometry? floatingBorderRadius,
    List<BoxShadow>? floatingShadow,
  }) {
    final _this = (this as ShadSidebarTheme);

    return ShadSidebarTheme(
      width: width ?? _this.width,
      collapsedWidth: collapsedWidth ?? _this.collapsedWidth,
      mobileBreakpoint: mobileBreakpoint ?? _this.mobileBreakpoint,
      animationDuration: animationDuration ?? _this.animationDuration,
      animationCurve: animationCurve ?? _this.animationCurve,
      decoration: decoration ?? _this.decoration,
      backgroundColor: backgroundColor ?? _this.backgroundColor,
      headerPadding: headerPadding ?? _this.headerPadding,
      headerDecoration: headerDecoration ?? _this.headerDecoration,
      footerDecoration: footerDecoration ?? _this.footerDecoration,
      footerPadding: footerPadding ?? _this.footerPadding,
      contentPadding: contentPadding ?? _this.contentPadding,
      groupPadding: groupPadding ?? _this.groupPadding,
      groupLabelStyle: groupLabelStyle ?? _this.groupLabelStyle,
      groupLabelPadding: groupLabelPadding ?? _this.groupLabelPadding,
      itemHeight: itemHeight ?? _this.itemHeight,
      itemPadding: itemPadding ?? _this.itemPadding,
      itemBorderRadius: itemBorderRadius ?? _this.itemBorderRadius,
      itemHoverColor: itemHoverColor ?? _this.itemHoverColor,
      itemActiveColor: itemActiveColor ?? _this.itemActiveColor,
      itemTextStyle: itemTextStyle ?? _this.itemTextStyle,
      itemActiveTextStyle: itemActiveTextStyle ?? _this.itemActiveTextStyle,
      itemIconSize: itemIconSize ?? _this.itemIconSize,
      itemIconColor: itemIconColor ?? _this.itemIconColor,
      itemActiveIconColor: itemActiveIconColor ?? _this.itemActiveIconColor,
      itemSpacing: itemSpacing ?? _this.itemSpacing,
      subItemsMargin: subItemsMargin ?? _this.subItemsMargin,
      subItemsPadding: subItemsPadding ?? _this.subItemsPadding,
      subItemsBorderColor: subItemsBorderColor ?? _this.subItemsBorderColor,
      subItemsBorderWidth: subItemsBorderWidth ?? _this.subItemsBorderWidth,
      subItemHeight: subItemHeight ?? _this.subItemHeight,
      subItemPadding: subItemPadding ?? _this.subItemPadding,
      subItemBorderRadius: subItemBorderRadius ?? _this.subItemBorderRadius,
      subItemTextStyle: subItemTextStyle ?? _this.subItemTextStyle,
      subItemActiveTextStyle:
          subItemActiveTextStyle ?? _this.subItemActiveTextStyle,
      separatorPadding: separatorPadding ?? _this.separatorPadding,
      separatorColor: separatorColor ?? _this.separatorColor,
      separatorThickness: separatorThickness ?? _this.separatorThickness,
      triggerSize: triggerSize ?? _this.triggerSize,
      triggerPadding: triggerPadding ?? _this.triggerPadding,
      floatingMargin: floatingMargin ?? _this.floatingMargin,
      floatingBorderRadius: floatingBorderRadius ?? _this.floatingBorderRadius,
      floatingShadow: floatingShadow ?? _this.floatingShadow,
    );
  }

  ShadSidebarTheme merge(ShadSidebarTheme? other) {
    final _this = (this as ShadSidebarTheme);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      width: other.width,
      collapsedWidth: other.collapsedWidth,
      mobileBreakpoint: other.mobileBreakpoint,
      animationDuration: other.animationDuration,
      animationCurve: other.animationCurve,
      decoration: _this.decoration?.merge(other.decoration) ?? other.decoration,
      backgroundColor: other.backgroundColor,
      headerPadding: other.headerPadding,
      headerDecoration:
          _this.headerDecoration?.merge(other.headerDecoration) ??
          other.headerDecoration,
      footerDecoration:
          _this.footerDecoration?.merge(other.footerDecoration) ??
          other.footerDecoration,
      footerPadding: other.footerPadding,
      contentPadding: other.contentPadding,
      groupPadding: other.groupPadding,
      groupLabelStyle:
          _this.groupLabelStyle?.merge(other.groupLabelStyle) ??
          other.groupLabelStyle,
      groupLabelPadding: other.groupLabelPadding,
      itemHeight: other.itemHeight,
      itemPadding: other.itemPadding,
      itemBorderRadius: other.itemBorderRadius,
      itemHoverColor: other.itemHoverColor,
      itemActiveColor: other.itemActiveColor,
      itemTextStyle:
          _this.itemTextStyle?.merge(other.itemTextStyle) ??
          other.itemTextStyle,
      itemActiveTextStyle:
          _this.itemActiveTextStyle?.merge(other.itemActiveTextStyle) ??
          other.itemActiveTextStyle,
      itemIconSize: other.itemIconSize,
      itemIconColor: other.itemIconColor,
      itemActiveIconColor: other.itemActiveIconColor,
      itemSpacing: other.itemSpacing,
      subItemsMargin: other.subItemsMargin,
      subItemsPadding: other.subItemsPadding,
      subItemsBorderColor: other.subItemsBorderColor,
      subItemsBorderWidth: other.subItemsBorderWidth,
      subItemHeight: other.subItemHeight,
      subItemPadding: other.subItemPadding,
      subItemBorderRadius: other.subItemBorderRadius,
      subItemTextStyle:
          _this.subItemTextStyle?.merge(other.subItemTextStyle) ??
          other.subItemTextStyle,
      subItemActiveTextStyle:
          _this.subItemActiveTextStyle?.merge(other.subItemActiveTextStyle) ??
          other.subItemActiveTextStyle,
      separatorPadding: other.separatorPadding,
      separatorColor: other.separatorColor,
      separatorThickness: other.separatorThickness,
      triggerSize: other.triggerSize,
      triggerPadding: other.triggerPadding,
      floatingMargin: other.floatingMargin,
      floatingBorderRadius: other.floatingBorderRadius,
      floatingShadow: other.floatingShadow,
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

    final _this = (this as ShadSidebarTheme);
    final _other = (other as ShadSidebarTheme);

    return _other.width == _this.width &&
        _other.collapsedWidth == _this.collapsedWidth &&
        _other.mobileBreakpoint == _this.mobileBreakpoint &&
        _other.animationDuration == _this.animationDuration &&
        _other.animationCurve == _this.animationCurve &&
        _other.decoration == _this.decoration &&
        _other.backgroundColor == _this.backgroundColor &&
        _other.headerPadding == _this.headerPadding &&
        _other.headerDecoration == _this.headerDecoration &&
        _other.footerDecoration == _this.footerDecoration &&
        _other.footerPadding == _this.footerPadding &&
        _other.contentPadding == _this.contentPadding &&
        _other.groupPadding == _this.groupPadding &&
        _other.groupLabelStyle == _this.groupLabelStyle &&
        _other.groupLabelPadding == _this.groupLabelPadding &&
        _other.itemHeight == _this.itemHeight &&
        _other.itemPadding == _this.itemPadding &&
        _other.itemBorderRadius == _this.itemBorderRadius &&
        _other.itemHoverColor == _this.itemHoverColor &&
        _other.itemActiveColor == _this.itemActiveColor &&
        _other.itemTextStyle == _this.itemTextStyle &&
        _other.itemActiveTextStyle == _this.itemActiveTextStyle &&
        _other.itemIconSize == _this.itemIconSize &&
        _other.itemIconColor == _this.itemIconColor &&
        _other.itemActiveIconColor == _this.itemActiveIconColor &&
        _other.itemSpacing == _this.itemSpacing &&
        _other.subItemsMargin == _this.subItemsMargin &&
        _other.subItemsPadding == _this.subItemsPadding &&
        _other.subItemsBorderColor == _this.subItemsBorderColor &&
        _other.subItemsBorderWidth == _this.subItemsBorderWidth &&
        _other.subItemHeight == _this.subItemHeight &&
        _other.subItemPadding == _this.subItemPadding &&
        _other.subItemBorderRadius == _this.subItemBorderRadius &&
        _other.subItemTextStyle == _this.subItemTextStyle &&
        _other.subItemActiveTextStyle == _this.subItemActiveTextStyle &&
        _other.separatorPadding == _this.separatorPadding &&
        _other.separatorColor == _this.separatorColor &&
        _other.separatorThickness == _this.separatorThickness &&
        _other.triggerSize == _this.triggerSize &&
        _other.triggerPadding == _this.triggerPadding &&
        _other.floatingMargin == _this.floatingMargin &&
        _other.floatingBorderRadius == _this.floatingBorderRadius &&
        _other.floatingShadow == _this.floatingShadow;
  }

  @override
  int get hashCode {
    final _this = (this as ShadSidebarTheme);

    return Object.hashAll([
      runtimeType,
      _this.width,
      _this.collapsedWidth,
      _this.mobileBreakpoint,
      _this.animationDuration,
      _this.animationCurve,
      _this.decoration,
      _this.backgroundColor,
      _this.headerPadding,
      _this.headerDecoration,
      _this.footerDecoration,
      _this.footerPadding,
      _this.contentPadding,
      _this.groupPadding,
      _this.groupLabelStyle,
      _this.groupLabelPadding,
      _this.itemHeight,
      _this.itemPadding,
      _this.itemBorderRadius,
      _this.itemHoverColor,
      _this.itemActiveColor,
      _this.itemTextStyle,
      _this.itemActiveTextStyle,
      _this.itemIconSize,
      _this.itemIconColor,
      _this.itemActiveIconColor,
      _this.itemSpacing,
      _this.subItemsMargin,
      _this.subItemsPadding,
      _this.subItemsBorderColor,
      _this.subItemsBorderWidth,
      _this.subItemHeight,
      _this.subItemPadding,
      _this.subItemBorderRadius,
      _this.subItemTextStyle,
      _this.subItemActiveTextStyle,
      _this.separatorPadding,
      _this.separatorColor,
      _this.separatorThickness,
      _this.triggerSize,
      _this.triggerPadding,
      _this.floatingMargin,
      _this.floatingBorderRadius,
      _this.floatingShadow,
    ]);
  }
}
