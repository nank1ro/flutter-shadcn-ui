import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

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
    this.spacing = 10.0,
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

  /// default separator spacing, defaults to 10.0
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    final effectiveSeparator = ShadBreadcrumbSeparator(
      child: separator ?? breadcrumbTheme.separator,
    );

    final effectiveMainAxisAlignment = mainAxisAlignment ??
        breadcrumbTheme.mainAxisAlignment ??
        MainAxisAlignment.start;

    final effectiveCrossAxisAlignment = crossAxisAlignment ??
        breadcrumbTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;

    return Row(
      mainAxisAlignment: effectiveMainAxisAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      textDirection: textDirection,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      children: children.separatedBy(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: effectiveSeparator,
        ),
      ),
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
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
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
    this.color,
    this.hoverColor,
  });

  /// The widget to display as the link content.
  final Widget child;

  /// Called when the breadcrumb link is tapped.
  final VoidCallback? onPressed;

  /// Optional color for the text in normal state
  final Color? color;

  /// Optional color for the text in hover state
  final Color? hoverColor;

  @override
  State<ShadBreadcrumbLink> createState() => _ShadBreadcrumbLinkState();
}

class _ShadBreadcrumbLinkState extends State<ShadBreadcrumbLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final fontStyle =
        Theme.of(context).textTheme.bodyMedium?? theme.textTheme.small;
    final hoverColor = _isHovered
        ? widget.hoverColor ?? theme.colorScheme.foreground
        : widget.color ?? theme.colorScheme.mutedForeground;

    return MouseRegion(
      cursor: widget.onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ShadButton.raw(
        padding: EdgeInsets.zero,
        // Use zero dimensions to allow button to size to content via minWidth/minHeight constraints
        height: 0,
        width: 0,
        variant: ShadButtonVariant.link,
        onPressed: widget.onPressed,
        child: DefaultTextStyle(
          style: fontStyle.copyWith(
            color: hoverColor,
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
    final theme = ShadTheme.of(context);
    final baseStyle =
        Theme.of(context).textTheme.bodyMedium ?? theme.textTheme.small;

    return DefaultTextStyle(
      style: baseStyle.copyWith(
        color: theme.colorScheme.foreground,
        fontWeight: FontWeight.w500,
      ),
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

    return child ??
        Icon(
          LucideIcons.chevronRight,
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
    this.size = 14,
  });

  /// The widget to display as the ellipsis.
  /// If null, uses the default more horizontal icon.
  final Widget? child;

  /// The size of the ellipsis, defaults to 14.
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return child ??
        Icon(
          size: size,
          LucideIcons.ellipsis,
          color: theme.colorScheme.mutedForeground,
        );
  }
}

/// {@template ShadBreadcrumbDropdown}
/// A dropdown breadcrumb item that displays a menu when clicked.
///
/// This widget is used to show collapsed breadcrumb items in a dropdown menu,
/// typically represented by an ellipsis. It follows the shadcn/ui pattern of
/// using a popover to show hidden navigation levels.
/// {@endtemplate}
class ShadBreadcrumbDropdown extends StatefulWidget {
  /// {@macro ShadBreadcrumbDropdown}
  const ShadBreadcrumbDropdown({
    super.key,
    required this.child,
    required this.children,
  });

  /// The widget that triggers the dropdown.
  final Widget child;

  /// The list of dropdown menu items to display.
  final List<ShadBreadcrumbDropMenuItem> children;

  @override
  State<ShadBreadcrumbDropdown> createState() => _ShadBreadcrumbDropdownState();
}

class _ShadBreadcrumbDropdownState extends State<ShadBreadcrumbDropdown> {
  final _controller = ShadPopoverController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    return ShadPopover(
      // not sure how to calculate the x offset here but i think it won't change
      anchor: const ShadAnchorAuto(offset: Offset(20, 4)),
      decoration: ShadDecoration(
        color: theme.colorScheme.popover,
      ),
      controller: _controller,
      padding: EdgeInsets.all(breadcrumbTheme.spacing ?? 4.0),
      popover: (context) => IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.children,
        ),
      ),
      child: ShadBreadcrumbLink(
        onPressed: _controller.toggle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.child,
            SizedBox(width: breadcrumbTheme.spacing ?? 4.0),
            Icon(
              size: 14,
              LucideIcons.chevronDown,
              color: theme.colorScheme.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template ShadBreadcrumbDropMenuItem}
/// A single item in a breadcrumb dropdown.
///
/// This widget represents a child in a dropdown menu and can
/// contain text, links, or other interactive elements.
/// {@endtemplate}
class ShadBreadcrumbDropMenuItem extends StatelessWidget {
  /// {@macro ShadBreadcrumbDropMenuItem}
  const ShadBreadcrumbDropMenuItem({
    super.key,
    required this.child,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Called when the Widget is tapped.
  final VoidCallback? onPressed;

  /// Optional padding value,
  /// defaults to [EdgeInsets.symmetric(horizontal: 8, vertical: 6)]
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final baseStyle =
        Theme.of(context).textTheme.bodyMedium ??
            ShadTheme.of(context).textTheme.small;

    return ShadButton.raw(
      variant: ShadButtonVariant.ghost,
      height: 0,
      width: 0,
      padding: padding,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: onPressed,
      child: DefaultTextStyle(style: baseStyle, child: child),
    );
  }
}
