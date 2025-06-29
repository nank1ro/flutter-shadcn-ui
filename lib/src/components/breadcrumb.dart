import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

/// {@template ShadBreadcrumb}
/// A breadcrumb navigation component that displays the current page location
/// within a navigational hierarchy.
///
/// Breadcrumbs provide users with a clear understanding of their current
/// location and allow them to navigate back to parent pages in the hierarchy.
/// {@endtemplate}
class ShadBreadcrumb extends StatelessWidget {
  /// {@macro ShadBreadcrumb}
  const ShadBreadcrumb({
    super.key,
    required this.children,
    this.separator,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  /// The list of breadcrumb items to display.
  final List<Widget> children;

  /// Custom separator widget between breadcrumb items.
  /// If null, uses the default chevron right icon.
  final Widget? separator;

  /// How the children should be placed along the main axis.
  final MainAxisAlignment? mainAxisAlignment;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment? crossAxisAlignment;

  /// The text direction to use for the breadcrumb.
  final TextDirection? textDirection;

  /// The vertical direction to use for the breadcrumb.
  final VerticalDirection? verticalDirection;

  /// The text baseline to use for the breadcrumb.
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    final effectiveSeparator = separator ??
        breadcrumbTheme.separator ??
        Icon(
          LucideIcons.chevronRight,
          size: 16,
          color: theme.colorScheme.mutedForeground,
        );

    final effectiveMainAxisAlignment =
        mainAxisAlignment ?? breadcrumbTheme.mainAxisAlignment ?? MainAxisAlignment.start;

    final effectiveCrossAxisAlignment =
        crossAxisAlignment ?? breadcrumbTheme.crossAxisAlignment ?? CrossAxisAlignment.center;

    final separatedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      separatedChildren.add(children[i]);
      if (i < children.length - 1) {
        separatedChildren.add(effectiveSeparator);
      }
    }

    return Row(
      mainAxisAlignment: effectiveMainAxisAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      textDirection: textDirection,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      children: separatedChildren,
    );
  }
}

/// {@template ShadBreadcrumbItem}
/// A single item in a breadcrumb navigation.
///
/// This widget represents one level in the breadcrumb hierarchy and can
/// contain text, links, or other interactive elements.
/// {@endtemplate}
class ShadBreadcrumbItem extends StatelessWidget {
  /// {@macro ShadBreadcrumbItem}
  const ShadBreadcrumbItem({
    super.key,
    required this.child,
    this.isCurrentPage = false,
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Whether this item represents the current page.
  /// Current page items are typically not clickable and have different styling.
  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    return DefaultTextStyle(
      style: isCurrentPage
          ? (breadcrumbTheme.currentPageTextStyle ??
              theme.textTheme.small.copyWith(
                color: theme.colorScheme.foreground,
                fontWeight: FontWeight.normal,
              ))
          : (breadcrumbTheme.itemTextStyle ??
              theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              )),
      child: child,
    );
  }
}

/// {@template ShadBreadcrumbLink}
/// A clickable breadcrumb item that navigates when tapped.
///
/// This widget wraps content in a clickable area and applies appropriate
/// hover and focus styling for interactive breadcrumb items.
/// {@endtemplate}
class ShadBreadcrumbLink extends StatefulWidget {
  /// {@macro ShadBreadcrumbLink}
  const ShadBreadcrumbLink({
    super.key,
    required this.child,
    this.onPressed,
    this.cursor,
  });

  /// The widget to display as the link content.
  final Widget child;

  /// Called when the breadcrumb link is tapped.
  final VoidCallback? onPressed;

  /// The cursor to display when hovering over the link.
  final MouseCursor? cursor;

  @override
  State<ShadBreadcrumbLink> createState() => _ShadBreadcrumbLinkState();
}

class _ShadBreadcrumbLinkState extends State<ShadBreadcrumbLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    final effectiveCursor = widget.cursor ??
        (widget.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic);

    return MouseRegion(
      cursor: effectiveCursor,
      onEnter: widget.onPressed != null ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.onPressed != null ? (_) => setState(() => _isHovered = false) : null,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: DefaultTextStyle(
          style: (breadcrumbTheme.linkTextStyle ??
                  theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ))
              .copyWith(
            color: _isHovered && widget.onPressed != null
                ? (breadcrumbTheme.linkHoverTextStyle?.color ?? theme.colorScheme.foreground)
                : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// {@template ShadBreadcrumbPage}
/// A breadcrumb item representing the current page.
///
/// This widget is used for the final item in the breadcrumb navigation
/// to indicate the current page. It's typically not clickable and has
/// distinct styling from other breadcrumb items.
/// {@endtemplate}
class ShadBreadcrumbPage extends StatelessWidget {
  /// {@macro ShadBreadcrumbPage}
  const ShadBreadcrumbPage({
    super.key,
    required this.child,
  });

  /// The widget to display as the current page content.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbItem(
      isCurrentPage: true,
      child: child,
    );
  }
}

/// {@template ShadBreadcrumbSeparator}
/// A separator widget used between breadcrumb items.
///
/// This widget provides a visual separator between breadcrumb items.
/// By default, it displays a chevron right icon, but can be customized
/// with any widget.
/// {@endtemplate}
class ShadBreadcrumbSeparator extends StatelessWidget {
  /// {@macro ShadBreadcrumbSeparator}
  const ShadBreadcrumbSeparator({
    super.key,
    this.child,
  });

  /// The widget to display as the separator.
  /// If null, uses the default chevron right icon.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    return child ??
        breadcrumbTheme.separator ??
        Icon(
          LucideIcons.chevronRight,
          size: 16,
          color: theme.colorScheme.mutedForeground,
        );
  }
}

/// {@template ShadBreadcrumbEllipsis}
/// An ellipsis indicator for breadcrumb navigation.
///
/// This widget is used to indicate that there are more breadcrumb items
/// that are not currently visible, typically in a collapsed state.
/// It's often used with dropdown menus to show hidden breadcrumb levels.
/// {@endtemplate}
class ShadBreadcrumbEllipsis extends StatelessWidget {
  /// {@macro ShadBreadcrumbEllipsis}
  const ShadBreadcrumbEllipsis({
    super.key,
    this.child,
  });

  /// The widget to display as the ellipsis.
  /// If null, uses the default more horizontal icon.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    return SizedBox(
      width: 36,
      height: 36,
      child: Center(
        child: child ??
            breadcrumbTheme.ellipsis ??
            Icon(
              LucideIcons.ellipsis,
              size: 16,
              color: theme.colorScheme.mutedForeground,
            ),
      ),
    );
  }
}
