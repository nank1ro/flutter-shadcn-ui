import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
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
    this.spacing,
  });

  /// The list of breadcrumb items to display.
  final List<Widget> children;

  /// Custom separator widget between breadcrumb items.
  /// If null, uses the default chevron right icon.
  final Widget? separator;

  /// {@template ShadBreadcrumb.wrapAlignment}
  /// How the children should be placed along the wraps main axis.
  /// {@endtemplate}
  final WrapAlignment? mainAxisAlignment;

  /// {@template ShadBreadcrumb.wrapCrossAxisAlignment}
  /// How the children should be placed along the wraps cross axis.
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  /// The text direction to use for the breadcrumb.
  final TextDirection? textDirection;

  /// The vertical direction to use for the breadcrumb.
  final VerticalDirection? verticalDirection;

  /// The text baseline to use for the breadcrumb.
  final TextBaseline? textBaseline;

  /// default separator spacing, defaults to 10.0
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final breadcrumbTheme = theme.breadcrumbTheme;

    final effectiveSeparator =
        separator ??
        breadcrumbTheme.separator ??
        const ShadBreadcrumbSeparator();

    final effectiveMainAxisAlignment =
        mainAxisAlignment ??
        breadcrumbTheme.mainAxisAlignment ??
        WrapAlignment.start;

    final effectiveCrossAxisAlignment =
        crossAxisAlignment ??
        breadcrumbTheme.crossAxisAlignment ??
        WrapCrossAlignment.center;

    final effectiveSpacing = spacing ?? breadcrumbTheme.spacing ?? 10.0;

    return Wrap(
      alignment: effectiveMainAxisAlignment,
      crossAxisAlignment: effectiveCrossAxisAlignment,
      runSpacing: effectiveSpacing,
      textDirection: textDirection,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      children: List.generate(
        children.length,
        (int index) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            children[index],
            if (index < children.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: effectiveSpacing),
                child: effectiveSeparator,
              ),
          ],
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
    this.textStyle,
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Make the last item in the breadcrumb a little heavier, defaults to false
  /// [default weight is FontWeight.normal, if true it is FontWeight.w500]
  final bool isLastItem;

  /// {@template ShadBreadcrumb.itemTextStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveTextStyle =
        textStyle ??
        theme.breadcrumbTheme.itemTextStyle ??
        theme.textTheme.small.copyWith(
          color: theme.colorScheme.foreground,
        );

    return DefaultTextStyle(
      style: effectiveTextStyle.copyWith(
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
    this.normalColor,
    this.hoverColor,
    this.textStyle,
  });

  /// The widget to display as the link content.
  final Widget child;

  /// Called when the breadcrumb link is tapped.
  final VoidCallback? onPressed;

  /// {@template ShadBreadcrumb.linkNormalTextColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalColor;

  /// {@template ShadBreadcrumb.linkHoverTextColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverColor;

  /// {@template ShadBreadcrumb.linkTextStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  @override
  State<ShadBreadcrumbLink> createState() => _ShadBreadcrumbLinkState();
}

class _ShadBreadcrumbLinkState extends State<ShadBreadcrumbLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveNormalColor =
        widget.normalColor ??
        theme.breadcrumbTheme.linkNormalTextColor ??
        theme.colorScheme.mutedForeground;
    final effectiveHoverColor =
        widget.hoverColor ??
        theme.breadcrumbTheme.linkHoverTextColor ??
        theme.colorScheme.foreground;

    final textColor = isHovered ? effectiveHoverColor : effectiveNormalColor;

    final effectiveTextStyle =
        widget.textStyle ??
        theme.breadcrumbTheme.linkTextStyle ??
        theme.textTheme.small.copyWith(
          color: theme.colorScheme.foreground,
        );

    return ShadButton.raw(
      variant: ShadButtonVariant.link,
      onHoverChange: (isHovered) => setState(() => this.isHovered = isHovered),
      padding: EdgeInsets.zero,
      // Use zero dimensions to allow button to size to content via minWidth/minHeight constraints
      height: 0,
      width: 0,
      onPressed: widget.onPressed,
      child: DefaultTextStyle(
        style: effectiveTextStyle.copyWith(
          color: textColor,
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
    this.separatorSize,
  });

  /// {@template ShadBreadcrumb.separatorSize}
  /// The size of the separator.
  /// defaults value is 14.0
  /// {@endtemplate}
  final double? separatorSize;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSeparatorSize =
        separatorSize ?? theme.breadcrumbTheme.separatorSize ?? 14.0;

    return Icon(
      LucideIcons.chevronRight,
      size: effectiveSeparatorSize,
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
    this.size,
  });

  /// {@template ShadBreadcrumb.ellipsisSize}
  /// The size of the ellipsis indicator.
  /// defaults value is 14.0
  /// {@endtemplate}
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSize = size ?? theme.breadcrumbTheme.ellipsisSize ?? 14.0;

    return Icon(
      LucideIcons.ellipsis,
      size: effectiveSize,
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
    this.dropdownMenuBackgroundColor,
    this.dropdownMenuPadding,
  });

  /// The widget that triggers the dropdown.
  final Widget child;

  /// The list of dropdown menu items to display.
  final List<ShadBreadcrumbDropMenuItem> children;

  /// {@template ShadBreadcrumb.dropdownMenuBackgroundColor}
  /// The color for dropdown menu. defaults to
  /// [ShadTheme.of(context).colorScheme.popover]
  /// {@endtemplate}
  final Color? dropdownMenuBackgroundColor;

  /// {@template ShadBreadcrumb.dropdownMenuPadding}
  /// The padding value for dropdown menu. defaults to
  /// [EdgeInsets.all(4)]
  /// {@endtemplate}
  final EdgeInsets? dropdownMenuPadding;

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
    final effectiveDropdownMenuBackgroundColor =
        widget.dropdownMenuBackgroundColor ??
        ShadTheme.of(context).breadcrumbTheme.dropdownMenuBackgroundColor ??
        theme.colorScheme.popover;
    final effectiveDropdownMenuPadding =
        widget.dropdownMenuPadding ??
        ShadTheme.of(context).breadcrumbTheme.dropdownMenuPadding ??
        const EdgeInsets.all(4);

    return ShadPopover(
      // not sure how to calculate the x offset here but i think it won't change
      anchor: const ShadAnchorAuto(offset: Offset(20, 4)),
      decoration: ShadDecoration(
        color: effectiveDropdownMenuBackgroundColor,
      ),
      controller: controller,
      padding: effectiveDropdownMenuPadding,
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
            const SizedBox(width: 4),
            Icon(
              LucideIcons.chevronDown,
              size: theme.breadcrumbTheme.separatorSize ?? 14,
              color: theme.colorScheme.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }
}

/// {@template ShadBreadcrumb.DropMenuItem}
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
    this.dropDownTextStyle,
    this.dropdownItemPadding,
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Called when the Widget is tapped.
  final VoidCallback? onPressed;

  /// {@template ShadBreadcrumb.dropdownTextStyle}
  /// The text style for dropdown menu items.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? dropDownTextStyle;

  /// {@template ShadBreadcrumb.dropdownItemPadding}
  /// The padding value for dropdown menu items.
  /// defaults to [EdgeInsets.symmetric(horizontal: 8, vertical: 6)]
  /// {@endtemplate}
  final EdgeInsets? dropdownItemPadding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveDropDownTextStyle =
        dropDownTextStyle ??
        theme.breadcrumbTheme.dropdownTextStyle ??
        theme.textTheme.small.copyWith(
          color: theme.colorScheme.foreground,
        );
    final effectiveDropdownItemPadding =
        dropdownItemPadding ??
        theme.breadcrumbTheme.dropdownItemPadding ??
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6);

    return ShadButton.raw(
      variant: ShadButtonVariant.ghost,
      height: 0,
      width: 0,
      padding: effectiveDropdownItemPadding,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: effectiveDropDownTextStyle,
        child: child,
      ),
    );
  }
}
