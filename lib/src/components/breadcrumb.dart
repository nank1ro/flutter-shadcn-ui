import 'package:flutter/widgets.dart';
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

  /// How the children should be placed along the wraps main axis.
  final WrapAlignment? mainAxisAlignment;

  /// How the children should be placed along the wraps cross axis.
  final WrapCrossAlignment? crossAxisAlignment;

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

    final effectiveSeparator =
        separator ??
        breadcrumbTheme.separator ??
        const ShadBreadcrumbSeparator();

    final effectiveMainAxisAlignment = mainAxisAlignment ??
        breadcrumbTheme.mainAxisAlignment ??
        WrapAlignment.start;

    final effectiveCrossAxisAlignment = crossAxisAlignment ??
        breadcrumbTheme.crossAxisAlignment ??
        WrapCrossAlignment.center;

    return Wrap(
      alignment: effectiveMainAxisAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      runSpacing: spacing,
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
    this.isLastItem = false,
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Make the last item in the breadcrumb a little heavier, defaults to false
  /// [default weight is FontWeight.normal, if true it is FontWeight.w500]
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return DefaultTextStyle(
      style: ShadTheme.of(context).textTheme.small.copyWith(
        color: theme.colorScheme.foreground,
        fontWeight: isLastItem ? FontWeight.w500 : FontWeight.normal,
      ),
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
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final hoverColor = isHovered
        ? widget.hoverColor ?? theme.colorScheme.foreground
        : widget.color ?? theme.colorScheme.mutedForeground;

    return ShadButton.raw(
      variant: ShadButtonVariant.link,
      onHoverChange: (isHovered) => setState(() => this.isHovered = isHovered),
      padding: EdgeInsets.zero,
      // Use zero dimensions to allow button to size to content via minWidth/minHeight constraints
      height: 0,
      width: 0,
      onPressed: widget.onPressed,
      child: DefaultTextStyle(
        style: theme.textTheme.small.copyWith(
          color: hoverColor,
        ),
        child: widget.child,
      ),
    );
  }
}

/// {@template ShadBreadcrumbSeparator}
/// A separator widget used between breadcrumb items.
///
/// This widget provides a visual separator between breadcrumb items.
/// By default, it displays a chevron right icon.
/// {@endtemplate}
class ShadBreadcrumbSeparator extends StatelessWidget {
  /// {@macro ShadBreadcrumbSeparator}
  const ShadBreadcrumbSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Icon(
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
    this.size = 14,
  });

  /// The size of the ellipsis, defaults to 14.
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Icon(
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
  final controller = ShadPopoverController();

  @override
  void dispose() {
    controller.dispose();
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
      controller: controller,
      padding: EdgeInsets.all(breadcrumbTheme.spacing ?? 4.0),
      popover: (context) => IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.children,
        ),
      ),
      child: ShadBreadcrumbLink(
        onPressed: controller.toggle,
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
    final theme = ShadTheme.of(context);

    return ShadButton.raw(
      variant: ShadButtonVariant.ghost,
      height: 0,
      width: 0,
      padding: padding,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: theme.textTheme.small,
        child: child,
      ),
    );
  }
}
