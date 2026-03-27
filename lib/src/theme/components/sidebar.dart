import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'sidebar.g.theme.dart';

/// Theme data for `ShadSidebar` and related widgets.
@themeGen
@immutable
class ShadSidebarTheme with _$ShadSidebarTheme {
  const ShadSidebarTheme({
    bool canMerge = true, // Sizing
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

  /// Width of the sidebar when expanded. Defaults to 256.
  final double? width;

  /// Width of the sidebar when collapsed in icon mode. Defaults to 48.
  final double? collapsedWidth;

  /// Screen width below which the sidebar switches to mobile (sheet) mode.
  /// Defaults to 768.
  final double? mobileBreakpoint;

  // -- Animation --

  /// Duration of the expand/collapse animation.
  /// Defaults to `Duration(milliseconds: 200)`.
  final Duration? animationDuration;

  /// Curve of the expand/collapse animation.
  /// Defaults to `Curves.linear`.
  final Curve? animationCurve;

  // -- Sidebar container --

  /// Decoration for the sidebar container.
  final ShadDecoration? decoration;

  /// Background color of the sidebar. Convenience shorthand; if [decoration]
  /// is also provided, [decoration] takes precedence.
  final Color? backgroundColor;

  // -- Header --

  /// Padding for the sidebar header slot.
  final EdgeInsetsGeometry? headerPadding;

  final ShadDecoration? headerDecoration;

  // -- Footer --

  final ShadDecoration? footerDecoration;

  /// Padding for the sidebar footer slot.
  final EdgeInsetsGeometry? footerPadding;

  // -- Content --

  /// Padding for the scrollable content area.
  final EdgeInsetsGeometry? contentPadding;

  // -- Group --

  /// Padding around each sidebar group.
  final EdgeInsetsGeometry? groupPadding;

  /// Text style for group labels.
  final TextStyle? groupLabelStyle;

  /// Padding for the group label row.
  final EdgeInsetsGeometry? groupLabelPadding;

  // -- Item --

  /// Height of a sidebar item. Defaults to 36.
  final double? itemHeight;

  /// Padding inside a sidebar item.
  final EdgeInsetsGeometry? itemPadding;

  /// Border radius of a sidebar item.
  final BorderRadiusGeometry? itemBorderRadius;

  /// Background color when a sidebar item is hovered.
  final Color? itemHoverColor;

  /// Background color when a sidebar item is active/selected.
  final Color? itemActiveColor;

  /// Default text style for sidebar items.
  final TextStyle? itemTextStyle;

  /// Text style for active/selected sidebar items.
  final TextStyle? itemActiveTextStyle;

  /// Size of leading icons in sidebar items. Defaults to 16.
  final double? itemIconSize;

  /// Color of leading icons in sidebar items.
  final Color? itemIconColor;

  /// Color of leading icons in active sidebar items.
  final Color? itemActiveIconColor;

  /// Spacing between icon, label, and trailing widget inside an item.
  final double? itemSpacing;

  // -- Sub-items (children of collapsible items) --

  /// Margin around the sub-items container. Defaults to horizontal 14.
  final EdgeInsetsGeometry? subItemsMargin;

  /// Padding inside the sub-items container. Defaults to horizontal 8.
  final EdgeInsetsGeometry? subItemsPadding;

  /// Color of the start border on the sub-items container.
  final Color? subItemsBorderColor;

  /// Width of the start border on the sub-items container. Defaults to 1.
  final double? subItemsBorderWidth;

  /// Height of a sub-item. Defaults to 32.
  final double? subItemHeight;

  /// Padding inside a sub-item.
  final EdgeInsetsGeometry? subItemPadding;

  /// Border radius of a sub-item.
  final BorderRadiusGeometry? subItemBorderRadius;

  /// Text style for sub-items.
  final TextStyle? subItemTextStyle;

  /// Text style for active sub-items.
  final TextStyle? subItemActiveTextStyle;

  /// Gap between sub-items.
  final double? subItemsSpacing;

  // -- Separator --

  /// The space around sidebar separators.
  final EdgeInsetsGeometry? separatorMargin;

  /// Color of sidebar separators.
  final Color? separatorColor;

  /// Thickness of sidebar separators. Defaults to 1.
  final double? separatorThickness;

  // -- Trigger --

  /// Size (width & height) of the sidebar trigger button. Defaults to 36.
  final double? triggerSize;

  /// Padding around the sidebar trigger button.
  final EdgeInsetsGeometry? triggerPadding;

  // -- Floating variant --

  /// Margin around the sidebar when using the floating variant.
  final EdgeInsetsGeometry? floatingMargin;

  /// Border radius of the sidebar when using the floating variant.
  final BorderRadiusGeometry? floatingBorderRadius;

  /// Shadow for the floating variant. Defaults to ShadShadows.sm.
  final List<BoxShadow>? floatingShadows;
}
