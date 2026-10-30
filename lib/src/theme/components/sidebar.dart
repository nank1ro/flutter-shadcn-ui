import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar.g.theme.dart';

/// Theme data for `ShadSidebar` and related widgets.
@themeGen
@immutable
class ShadSidebarTheme with _$ShadSidebarTheme {
  const ShadSidebarTheme({
    bool canMerge = true,
    // Sizing
    this.width,
    this.collapsedWidth,
    this.mobileBreakpoint,
    // Animation
    this.animationDuration,
    this.animationCurve,
    // Sidebar container
    this.decoration,
    this.backgroundColor,
    // Header
    this.headerPadding,
    this.headerDecoration,
    // Footer
    this.footerPadding,
    this.footerDecoration,

    // Content
    this.contentPadding,
    // Group
    this.groupPadding,
    this.groupLabelStyle,
    this.groupLabelPadding,
    // Item
    this.itemHeight,
    this.itemPadding,
    this.itemBorderRadius,
    this.itemHoverColor,
    this.itemActiveColor,
    this.itemTextStyle,
    this.itemActiveTextStyle,
    this.itemIconSize,
    this.itemIconColor,
    this.itemActiveIconColor,
    this.itemSpacing,
    // Sub-items (children)
    this.subItemsBorderColor,
    this.subItemsBorderWidth,
    this.subItemsMargin,
    this.subItemsPadding,
    this.subItemHeight,
    this.subItemPadding,
    this.subItemBorderRadius,
    this.subItemTextStyle,
    this.subItemActiveTextStyle,
    this.subItemsSpacing,
    // Separator
    this.separatorMargin,
    this.separatorColor,
    this.separatorThickness,
    // Trigger
    this.triggerSize,
    this.triggerPadding,
    // Floating variant overrides
    this.floatingMargin,
    this.floatingBorderRadius,
    this.floatingShadows,
  }) : _canMerge = canMerge;

  @ignore
  final bool _canMerge;

  @override
  bool get canMerge => _canMerge;

  // -- Sizing --

  /// {@macro ShadSidebarScaffold.width}
  final double? width;

  /// {@macro ShadSidebarScaffold.collapsedWidth}
  final double? collapsedWidth;

  /// {@macro ShadSidebarScaffold.breakpoint}
  final double? mobileBreakpoint;

  // -- Animation --

  /// {@macro ShadSidebarScaffold.animationDuration}
  final Duration? animationDuration;

  /// {@macro ShadSidebarScaffold.animationCurve}
  final Curve? animationCurve;

  // -- Sidebar container --

  /// {@macro ShadSidebar.decoration}
  final ShadDecoration? decoration;

  /// {@macro ShadSidebar.backgroundColor}
  final Color? backgroundColor;

  // -- Header --

  /// {@macro ShadSidebarHeader.padding}
  final EdgeInsetsGeometry? headerPadding;

  /// {@macro ShadSidebarHeader.decoration}
  final ShadDecoration? headerDecoration;

  // -- Footer --

  /// {@macro ShadSidebarFooter.decoration}
  final ShadDecoration? footerDecoration;

  /// {@macro ShadSidebarFooter.padding}
  final EdgeInsetsGeometry? footerPadding;

  // -- Content --

  /// {@macro ShadSidebarContent.padding}
  final EdgeInsetsGeometry? contentPadding;

  // -- Group --

  /// {@macro ShadSidebarGroup.padding}
  final EdgeInsetsGeometry? groupPadding;

  /// {@macro ShadSidebarGroupLabel.textStyle}
  final TextStyle? groupLabelStyle;

  /// {@macro ShadSidebarGroupLabel.padding}
  final EdgeInsetsGeometry? groupLabelPadding;

  // -- Item --

  /// {@macro ShadSidebarItem.height}
  final double? itemHeight;

  /// {@macro ShadSidebarItem.padding}
  final EdgeInsetsGeometry? itemPadding;

  /// {@macro ShadSidebarItem.borderRadius}
  final BorderRadiusGeometry? itemBorderRadius;

  /// {@macro ShadSidebarItem.hoverColor}
  final Color? itemHoverColor;

  /// {@macro ShadSidebarItem.activeColor}
  final Color? itemActiveColor;

  /// {@macro ShadSidebarItem.textStyle}
  final TextStyle? itemTextStyle;

  /// {@macro ShadSidebarItem.activeTextStyle}
  final TextStyle? itemActiveTextStyle;

  /// {@macro ShadSidebarItem.iconSize}
  final double? itemIconSize;

  /// {@macro ShadSidebarItem.iconColor}
  final Color? itemIconColor;

  /// {@macro ShadSidebarItem.activeIconColor}
  final Color? itemActiveIconColor;

  /// {@macro ShadSidebarItem.spacing}
  final double? itemSpacing;

  // -- Sub-items (children of collapsible items) --

  /// {@macro ShadSidebarItem.subItemsMargin}
  final EdgeInsetsGeometry? subItemsMargin;

  /// {@macro ShadSidebarItem.subItemsPadding}
  final EdgeInsetsGeometry? subItemsPadding;

  /// {@macro ShadSidebarItem.subItemsBorderColor}
  final Color? subItemsBorderColor;

  /// {@macro ShadSidebarItem.subItemsBorderWidth}
  final double? subItemsBorderWidth;

  /// Height of a sub-item, used by `ShadSidebarItem` when it is nested
  /// inside another item. Defaults to 32.
  final double? subItemHeight;

  /// Padding inside a sub-item, used by `ShadSidebarItem` when it is
  /// nested inside another item.
  final EdgeInsetsGeometry? subItemPadding;

  /// Border radius of a sub-item, used by `ShadSidebarItem` when it is
  /// nested inside another item.
  final BorderRadiusGeometry? subItemBorderRadius;

  /// Text style for sub-items, used by `ShadSidebarItem` when it is
  /// nested inside another item.
  final TextStyle? subItemTextStyle;

  /// Text style for active sub-items, used by `ShadSidebarItem` when it is
  /// nested inside another item.
  final TextStyle? subItemActiveTextStyle;

  /// {@macro ShadSidebarItem.subItemsSpacing}
  final double? subItemsSpacing;

  // -- Separator --

  /// {@macro ShadSidebarSeparator.margin}
  final EdgeInsetsGeometry? separatorMargin;

  /// {@macro ShadSidebarSeparator.color}
  final Color? separatorColor;

  /// {@macro ShadSidebarSeparator.thickness}
  final double? separatorThickness;

  // -- Trigger --

  /// {@macro ShadSidebarTrigger.size}
  final double? triggerSize;

  /// {@macro ShadSidebarTrigger.padding}
  final EdgeInsetsGeometry? triggerPadding;

  // -- Floating variant --

  /// {@macro ShadSidebar.floatingMargin}
  final EdgeInsetsGeometry? floatingMargin;

  /// {@macro ShadSidebar.floatingBorderRadius}
  final BorderRadiusGeometry? floatingBorderRadius;

  /// {@macro ShadSidebar.floatingShadow}
  final List<BoxShadow>? floatingShadows;
}
