import 'package:flutter/widgets.dart';

/// Interface for navigation items in the sidebar.
///
/// Represents a single navigation item that can be displayed in a [ShadSidebar].
/// Can contain nested items for collapsible groups.
class ShadSidebarNavItem {
  /// Creates a navigation item for the sidebar.
  ///
  /// The [title] is required and will be displayed as the item's label.
  /// [url] can be used for navigation routing.
  /// [icon] is an optional widget displayed next to the title.
  /// [isActive] indicates if this item is currently selected.
  /// [items] can contain nested navigation items for collapsible sections.
  /// [onTap] is called when the item is tapped.
  const ShadSidebarNavItem({
    required this.title,
    this.url,
    this.icon,
    this.isActive = false,
    this.items,
    this.onTap,
  });

  /// The display title of the navigation item.
  final String title;

  /// Optional URL for navigation routing.
  final String? url;

  /// Optional icon widget displayed next to the title.
  final Widget? icon;

  /// Whether this item is currently active/selected.
  final bool isActive;

  /// Optional nested navigation items for collapsible sections.
  final List<ShadSidebarNavItem>? items;

  /// Callback when the item is tapped.
  final VoidCallback? onTap;
}
