import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/text_style.dart';

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
    this.spacing,
    this.textStyle,
    this.lastItemTextColor,
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

  /// {@template ShadBreadcrumb.textDirection}
  /// The text direction to use for the breadcrumb.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ShadBreadcrumb.verticalDirection}
  /// The vertical direction to use for the breadcrumb.
  /// {@endtemplate}
  final VerticalDirection? verticalDirection;

  /// {@template ShadBreadcrumb.spacing}
  /// The spacing between breadcrumb items.
  /// Defaults to 10.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadBreadcrumb.itemTextStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadBreadcrumb.lastItemTextColor}
  /// The color for the last breadcrumb items text.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? lastItemTextColor;

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

    final effectiveSpacing = spacing ?? breadcrumbTheme.spacing ?? 10;

    final effectiveTextStyle =
        textStyle ??
        breadcrumbTheme.itemTextStyle ??
        theme.textTheme.small
            .copyWith(fontWeight: FontWeight.normal)
            .fallback(color: theme.colorScheme.mutedForeground);

    final effectiveLastItemColor =
        lastItemTextColor ??
        breadcrumbTheme.lastItemTextColor ??
        theme.colorScheme.foreground;

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
            DefaultTextStyle(
              style: effectiveTextStyle.copyWith(
                color: index == children.length - 1
                    ? effectiveLastItemColor
                    : effectiveTextStyle.color,
              ),
              child: children[index],
            ),
            if (index < children.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: effectiveSpacing),
                child: IconTheme.merge(
                  data: IconThemeData(color: theme.colorScheme.mutedForeground),
                  child: effectiveSeparator,
                ),
              ),
          ],
        ),
      ),
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
    this.onHoverChange,
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

  /// Called when the hover state changes.
  final void Function(bool)? onHoverChange;

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

    final effectiveTextColor = isHovered
        ? effectiveHoverColor
        : effectiveNormalColor;

    final effectiveTextStyle =
        widget.textStyle ??
        theme.breadcrumbTheme.linkTextStyle ??
        theme.textTheme.small
            .copyWith(fontWeight: FontWeight.normal)
            .fallback(color: theme.colorScheme.mutedForeground);

    return ShadButton.raw(
      variant: ShadButtonVariant.link,
      onHoverChange:
          widget.onHoverChange ??
          (isHovered) => setState(() => this.isHovered = isHovered),
      padding: EdgeInsets.zero,
      // Use zero dimensions; ShadButton's minWidth/minHeight constraints
      // allow the button to size to its child content
      height: 0,
      width: 0,
      onPressed: widget.onPressed,
      child: DefaultTextStyle(
        style: effectiveTextStyle.copyWith(
          color: effectiveTextColor,
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
    this.size,
    this.color,
  });

  /// {@template ShadBreadcrumb.separatorSize}
  /// The size of the separator.
  /// defaults value is 14.0
  /// {@endtemplate}
  final double? size;

  /// {@template ShadBreadcrumb.separatorColor}
  /// The color of the separator.
  /// defaults to `ShadColorScheme.mutedForeground`
  /// {@endtemplate}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSeparatorSize =
        size ?? theme.breadcrumbTheme.separatorSize ?? 14.0;
    final effectiveColor =
        color ??
        theme.breadcrumbTheme.separatorColor ??
        theme.colorScheme.mutedForeground;

    return Icon(
      LucideIcons.chevronRight,
      size: effectiveSeparatorSize,
      color: effectiveColor,
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
  /// defaults value is 16.0
  /// {@endtemplate}
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveSize = size ?? theme.breadcrumbTheme.ellipsisSize ?? 16.0;

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
    required this.items,
    this.backgroundColor,
    this.padding,
    this.anchor,
    this.arrowGap,
    this.normalTextColor,
    this.hoverTextColor,
    this.showDropdownArrow,
  });

  /// The widget that triggers the dropdown.
  final Widget child;

  /// The list of dropdown menu items to display.
  final List<ShadBreadcrumbDropMenuItem> items;

  /// {@template ShadBreadcrumb.dropdownMenuBackgroundColor}
  /// The color for dropdown menu. defaults to
  /// [ShadTheme.of(context).colorScheme.popover]
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ShadBreadcrumb.dropdownMenuPadding}
  /// The padding value for dropdown menu. defaults to
  /// [EdgeInsets.all(4)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadBreadcrumb.dropdownMenuAnchor}
  /// The anchor configuration for the dropdown popover.
  /// Defaults to
  /// ```dart
  /// ShadAnchorAuto(
  ///   offset: Offset(0, 4),
  ///   targetAnchor: Alignment.bottomLeft,
  ///   followerAnchor: Alignment.bottomRight,
  /// ),
  /// ```
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadBreadcrumb.dropdownArrowGap}
  /// The gap between the child and dropdown icon.
  /// defaults to 4
  /// {@endtemplate}
  final double? arrowGap;

  /// {@template ShadBreadcrumb.linkNormalTextColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalTextColor;

  /// {@template ShadBreadcrumb.linkHoverTextColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverTextColor;

  /// {@template ShadBreadcrumb.showDropdownArrow}
  /// Whether to show the dropdown arrow icon.
  /// Defaults to true.
  /// {@endtemplate}
  final bool? showDropdownArrow;

  @override
  State<ShadBreadcrumbDropdown> createState() => _ShadBreadcrumbDropdownState();
}

class _ShadBreadcrumbDropdownState extends State<ShadBreadcrumbDropdown> {
  final controller = ShadPopoverController();
  bool isHovered = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveDropdownMenuBackgroundColor =
        widget.backgroundColor ??
        theme.breadcrumbTheme.dropdownMenuBackgroundColor ??
        theme.colorScheme.popover;

    final effectiveDropdownMenuPadding =
        widget.padding ??
        theme.breadcrumbTheme.dropdownMenuPadding ??
        const EdgeInsets.all(4);

    final effectiveAnchor =
        widget.anchor ??
        theme.breadcrumbTheme.dropdownMenuAnchor ??
        const ShadAnchorAuto(
          offset: Offset(0, 4),
          targetAnchor: Alignment.bottomLeft,
          followerAnchor: Alignment.bottomRight,
        );

    final effectiveArrowGap =
        widget.arrowGap ?? theme.breadcrumbTheme.dropdownArrowGap ?? 4;

    final effectiveNormalTextColor =
        widget.normalTextColor ??
        theme.breadcrumbTheme.linkNormalTextColor ??
        theme.colorScheme.mutedForeground;

    final effectiveHoverTextColor =
        widget.hoverTextColor ??
        theme.breadcrumbTheme.linkHoverTextColor ??
        theme.colorScheme.foreground;

    final effectiveTextColor = isHovered || controller.isOpen
        ? effectiveHoverTextColor
        : effectiveNormalTextColor;

    final effectiveShowDropdownArrow =
        widget.showDropdownArrow ??
        theme.breadcrumbTheme.showDropdownArrow ??
        true;

    return ShadPopover(
      anchor: effectiveAnchor,
      decoration: ShadDecoration(
        color: effectiveDropdownMenuBackgroundColor,
      ),
      controller: controller,
      padding: effectiveDropdownMenuPadding,
      popover: (context) => IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.items,
        ),
      ),
      child: ShadBreadcrumbLink(
        normalColor: effectiveTextColor,
        onHoverChange: (isHovered) =>
            setState(() => this.isHovered = isHovered),
        onPressed: controller.toggle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: effectiveArrowGap,
          children: [
            widget.child,
            if (effectiveShowDropdownArrow)
              AnimatedRotation(
                turns: controller.isOpen ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  LucideIcons.chevronDown,
                  size: theme.breadcrumbTheme.separatorSize ?? 14,
                  color: effectiveTextColor,
                ),
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
    this.textStyle,
    this.itemPadding,
  });

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Called when the Widget is tapped.
  final VoidCallback? onPressed;

  /// {@template ShadBreadcrumb.dropdownTextStyle}
  /// The text style for dropdown menu items.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadBreadcrumb.dropdownItemPadding}
  /// The padding value for dropdown menu items.
  /// defaults to [EdgeInsets.symmetric(horizontal: 12, vertical: 10)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? itemPadding;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveTextStyle =
        textStyle ??
        theme.breadcrumbTheme.dropdownTextStyle ??
        theme.textTheme.small.fallback(
          color: theme.colorScheme.foreground,
        );
    final effectiveItemPadding =
        itemPadding ??
        theme.breadcrumbTheme.dropdownItemPadding ??
        const EdgeInsets.symmetric(horizontal: 12, vertical: 10);

    return ShadButton.raw(
      variant: ShadButtonVariant.ghost,
      height: 0,
      width: 0,
      padding: effectiveItemPadding,
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: effectiveTextStyle,
        child: child,
      ),
    );
  }
}
