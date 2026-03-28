import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/scope.dart';
import 'package:shadcn_ui/src/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

// ---------------------------------------------------------------------------
// Depth tracking
// ---------------------------------------------------------------------------

class ShadSidebarItemDepth extends InheritedWidget {
  const ShadSidebarItemDepth({
    super.key,
    required this.depth,
    required super.child,
  });

  final int depth;

  static int of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ShadSidebarItemDepth>()
            ?.depth ??
        0;
  }

  @override
  bool updateShouldNotify(ShadSidebarItemDepth oldWidget) {
    return depth != oldWidget.depth;
  }
}

// ---------------------------------------------------------------------------
// Variant
// ---------------------------------------------------------------------------

enum ShadSidebarItemVariant {
  standard,
  collapsible,
}

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

class ShadSidebarItem extends StatefulWidget {
  /// Standard item. If [children] is provided, they are always visible
  /// (not collapsible) with start-border indentation.
  const ShadSidebarItem({
    super.key,
    this.icon,
    this.child,
    this.trailing,
    this.onPressed,
    this.selected = false,
    this.tooltip,
    this.children,
    this.height,
    this.padding,
    this.borderRadius,
    this.hoverColor,
    this.activeColor,
    this.textStyle,
    this.activeTextStyle,
    this.iconSize,
    this.iconColor,
    this.activeIconColor,
    this.spacing,
    this.subItemsMargin,
    this.subItemsPadding,
    this.subItemsBorderColor,
    this.subItemsBorderWidth,
    this.subItemsSpacing,
  }) : variant = ShadSidebarItemVariant.standard,
       initiallyExpanded = false,
       onExpansionChanged = null;

  /// Collapsible item — [children] are shown/hidden with animation.
  const ShadSidebarItem.collapsible({
    super.key,
    this.icon,
    this.child,
    this.trailing,
    this.onPressed,
    this.selected = false,
    this.tooltip,
    required List<Widget> this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.height,
    this.padding,
    this.borderRadius,
    this.hoverColor,
    this.activeColor,
    this.textStyle,
    this.activeTextStyle,
    this.iconSize,
    this.iconColor,
    this.activeIconColor,
    this.spacing,
    this.subItemsMargin,
    this.subItemsPadding,
    this.subItemsBorderColor,
    this.subItemsBorderWidth,
    this.subItemsSpacing,
  }) : variant = ShadSidebarItemVariant.collapsible;

  const ShadSidebarItem.raw({
    super.key,
    required this.variant,
    this.icon,
    this.child,
    this.trailing,
    this.onPressed,
    this.selected = false,
    this.tooltip,
    this.children,
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.height,
    this.padding,
    this.borderRadius,
    this.hoverColor,
    this.activeColor,
    this.textStyle,
    this.activeTextStyle,
    this.iconSize,
    this.iconColor,
    this.activeIconColor,
    this.spacing,
    this.subItemsMargin,
    this.subItemsPadding,
    this.subItemsBorderColor,
    this.subItemsBorderWidth,
    this.subItemsSpacing,
  });

  final ShadSidebarItemVariant variant;
  final Widget? icon;
  final Widget? child;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool selected;
  final Widget? tooltip;
  final List<Widget>? children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;

  /// {@template ShadSidebarItem.height}
  /// The height of the item.
  ///
  /// Defaults to `ShadSidebarTheme.subItemHeight` if the item is a sub-item,
  /// otherwise it defaults to `ShadSidebarTheme.itemHeight`.
  /// {@endtemplate}
  final double? height;

  /// {@template ShadSidebarItem.padding}
  /// The padding of the item.
  ///
  /// Defaults to `ShadSidebarTheme.subItemPadding` if the item is a sub-item,
  /// otherwise it defaults to `ShadSidebarTheme.itemPadding`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadSidebarItem.borderRadius}
  /// The border radius of the item.
  ///
  /// Defaults to `ShadSidebarTheme.subItemBorderRadius` if the item is a sub-item,
  /// otherwise it defaults to `ShadSidebarTheme.itemBorderRadius`.
  /// {@endtemplate}
  final BorderRadiusGeometry? borderRadius;

  /// {@template ShadSidebarItem.hoverColor}
  /// The hover color of the item.
  /// {@endtemplate}
  final Color? hoverColor;

  /// {@template ShadSidebarItem.activeColor}
  /// The active color of the item.
  /// {@endtemplate}
  final Color? activeColor;

  /// {@template ShadSidebarItem.textStyle}
  /// The text style of the item.
  ///
  /// Merges with `ShadSidebarTheme.subItemTextStyle` or
  /// `ShadSidebarTheme.itemTextStyle` based on whether the item is a sub-item.
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ShadSidebarItem.activeTextStyle}
  /// The active text style of the item.
  ///
  /// Merges with `ShadSidebarTheme.subItemActiveTextStyle` or
  /// `ShadSidebarTheme.itemActiveTextStyle` based on whether the item is a sub-item.
  /// {@endtemplate}
  final TextStyle? activeTextStyle;

  /// {@template ShadSidebarItem.iconSize}
  /// The icon size of the item.
  /// {@endtemplate}
  final double? iconSize;

  /// {@template ShadSidebarItem.iconColor}
  /// The icon color of the item.
  /// {@endtemplate}
  final Color? iconColor;

  /// {@template ShadSidebarItem.activeIconColor}
  /// The active icon color of the item.
  /// {@endtemplate}
  final Color? activeIconColor;

  /// {@template ShadSidebarItem.spacing}
  /// The spacing between the leading, title and trailing widgets.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ShadSidebarItem.subItemsMargin}
  /// The margin of the sub-items.
  /// {@endtemplate}
  final EdgeInsetsGeometry? subItemsMargin;

  /// {@template ShadSidebarItem.subItemsPadding}
  /// The padding of the sub-items.
  /// {@endtemplate}
  final EdgeInsetsGeometry? subItemsPadding;

  /// {@template ShadSidebarItem.subItemsBorderColor}
  /// The border color of the sub-items.
  /// {@endtemplate}
  final Color? subItemsBorderColor;

  /// {@template ShadSidebarItem.subItemsBorderWidth}
  /// The border width of the sub-items.
  /// {@endtemplate}
  final double? subItemsBorderWidth;

  /// {@template ShadSidebarItem.subItemsSpacing}
  /// The spacing between the sub-items.
  /// {@endtemplate}
  final double? subItemsSpacing;

  @override
  State<ShadSidebarItem> createState() => _ShadSidebarItemState();
}

class _ShadSidebarItemState extends State<ShadSidebarItem>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  AnimationController? expansionController;
  CurvedAnimation? expansionAnimation;

  bool get isCollapsible =>
      widget.variant == ShadSidebarItemVariant.collapsible;

  bool get hasChildren =>
      widget.children != null && widget.children!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    initExpansion();
  }

  @override
  void didUpdateWidget(ShadSidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    final wasCollapsible =
        oldWidget.variant == ShadSidebarItemVariant.collapsible;
    if (isCollapsible && !wasCollapsible) {
      initExpansion();
    } else if (!isCollapsible && wasCollapsible) {
      disposeExpansion();
    }
  }

  @override
  void dispose() {
    disposeExpansion();
    super.dispose();
  }

  void initExpansion() {
    if (!isCollapsible) return;
    isExpanded = widget.initiallyExpanded;
    expansionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: isExpanded ? 1.0 : 0.0,
    );
    expansionAnimation = CurvedAnimation(
      parent: expansionController!,
      curve: Curves.easeInOut,
    );
  }

  void disposeExpansion() {
    expansionAnimation?.dispose();
    expansionAnimation = null;
    expansionController?.dispose();
    expansionController = null;
    isExpanded = false;
  }

  void toggleExpansion() {
    setState(() => isExpanded = !isExpanded);
    if (isExpanded) {
      expansionController!.forward();
    } else {
      expansionController!.reverse();
    }
    widget.onExpansionChanged?.call(isExpanded);
  }

  void handleTap() {
    final scope = ShadSidebarScope.maybeOf(context);

    if (scope != null &&
        scope.collapsibleMode == ShadSidebarCollapsibleMode.icon &&
        scope.animation.status == AnimationStatus.dismissed &&
        isCollapsible) {
      scope.controller.open();
      if (!isExpanded) toggleExpansion();
      return;
    }

    if (isCollapsible) {
      toggleExpansion();
    }
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;
    final scope = ShadSidebarScope.of(context);
    final depth = ShadSidebarItemDepth.of(context);
    final isSubItem = depth > 0;

    // -- Resolve sidebar colors --

    final sidebarFg = colorScheme.sidebarForeground ?? colorScheme.foreground;
    final sidebarAccent = colorScheme.sidebarAccent ?? colorScheme.accent;
    final sidebarAccentFg =
        colorScheme.sidebarAccentForeground ?? colorScheme.accentForeground;
    final sidebarBorder = colorScheme.sidebarBorder ?? colorScheme.border;

    // -- Resolve effective values --

    final effectiveHeight =
        widget.height ??
        (isSubItem
            ? sidebarTheme.subItemHeight ?? 32.0
            : sidebarTheme.itemHeight ?? 36.0);

    final effectivePadding =
        widget.padding ??
        (isSubItem
            ? sidebarTheme.subItemPadding ??
                  const EdgeInsets.symmetric(horizontal: 8)
            : sidebarTheme.itemPadding ??
                  const EdgeInsets.symmetric(horizontal: 8));

    final effectiveBorderRadius =
        widget.borderRadius ??
        (isSubItem
            ? sidebarTheme.subItemBorderRadius ?? BorderRadius.circular(8)
            : sidebarTheme.itemBorderRadius ?? BorderRadius.circular(8));

    final effectiveHoverColor =
        widget.hoverColor ?? sidebarTheme.itemHoverColor ?? sidebarAccent;

    final effectiveActiveColor =
        widget.activeColor ?? sidebarTheme.itemActiveColor ?? sidebarAccent;

    final effectiveFgColor = widget.selected
        ? (widget.activeIconColor ??
              sidebarTheme.itemActiveIconColor ??
              sidebarAccentFg)
        : (widget.iconColor ?? sidebarTheme.itemIconColor ?? sidebarFg);

    final defaultTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: widget.selected ? FontWeight.w600 : null,
      color: widget.selected ? sidebarAccentFg : sidebarFg,
    );

    final effectiveTextStyle = theme.textTheme.p
        .merge(defaultTextStyle)
        .merge(
          isSubItem
              ? (widget.selected
                    ? sidebarTheme.subItemActiveTextStyle
                    : sidebarTheme.subItemTextStyle)
              : (widget.selected
                    ? sidebarTheme.itemActiveTextStyle
                    : sidebarTheme.itemTextStyle),
        )
        .merge(widget.selected ? widget.activeTextStyle : widget.textStyle);

    final effectiveIconSize =
        widget.iconSize ?? sidebarTheme.itemIconSize ?? 16.0;

    final effectiveSpacing = widget.spacing ?? sidebarTheme.itemSpacing ?? 8.0;

    // -- Sub-items theming --

    final effectiveSubItemsMargin =
        widget.subItemsMargin ??
        sidebarTheme.subItemsMargin ??
        const EdgeInsets.symmetric(horizontal: 14);

    final effectiveSubItemsPadding =
        widget.subItemsPadding ??
        sidebarTheme.subItemsPadding ??
        const EdgeInsetsDirectional.only(start: 10, top: 2, bottom: 2);

    final effectiveSubItemsBorderColor =
        widget.subItemsBorderColor ??
        sidebarTheme.subItemsBorderColor ??
        sidebarBorder;

    final effectiveSubItemsBorderWidth =
        widget.subItemsBorderWidth ?? sidebarTheme.subItemsBorderWidth ?? 1.0;

    final effectiveSubItemsSpacing =
        widget.subItemsSpacing ?? sidebarTheme.subItemsSpacing ?? 4.0;

    // -- Build icon --

    Widget? iconWidget;
    if (widget.icon != null) {
      iconWidget = IconTheme(
        data: IconThemeData(size: effectiveIconSize, color: effectiveFgColor),
        child: widget.icon!,
      );
    }

    // -- Build trailing --

    final chevronTurns = Directionality.of(context) == TextDirection.rtl
        ? Tween<double>(begin: 0, end: -0.25)
        : Tween<double>(begin: 0, end: 0.25);
    var trailing = widget.trailing;
    if (trailing == null && isCollapsible) {
      trailing = RotationTransition(
        turns: chevronTurns.animate(expansionAnimation!),
        child: _DefaultChevron(
          size: effectiveIconSize,
          color: effectiveFgColor,
        ),
      );
    }

    // -- Shared button decoration --

    final buttonDecoration = ShadDecoration(
      border: ShadBorder.all(
        radius: effectiveBorderRadius,
      ),
    );

    // -- Icon-collapsed mode --

    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.icon) {
      return AnimatedBuilder(
        animation: scope.animation,
        builder: (context, _) {
          // Fully collapsed → icon-only button with tooltip
          if (scope.animation.status == AnimationStatus.dismissed) {
            Widget button = ShadButton.ghost(
              onPressed: handleTap,
              width: effectiveHeight,
              height: effectiveHeight,
              padding: EdgeInsets.zero,
              backgroundColor: widget.selected ? effectiveActiveColor : null,
              hoverBackgroundColor: effectiveHoverColor,
              foregroundColor: effectiveFgColor,
              hoverForegroundColor: sidebarAccentFg,
              decoration: buttonDecoration,
              leading: iconWidget,
            );

            if (widget.tooltip != null) {
              button = ShadTooltip(
                builder: (context) => widget.tooltip!,
                child: button,
              );
            }

            return button;
          }

          // Animating → full row with fading label/trailing
          return _SidebarItemButtonWithChildren(
            onPressed: handleTap,
            selected: widget.selected,
            isCollapsible: isCollapsible,
            expansionAnimation: expansionAnimation,
            labelAnimation:
                scope.collapsibleMode == ShadSidebarCollapsibleMode.icon
                ? scope.animation
                : null,

            iconWidget: iconWidget,
            trailing: trailing,
            height: effectiveHeight,
            padding: effectivePadding,
            textStyle: effectiveTextStyle,
            spacing: effectiveSpacing,

            activeColor: effectiveActiveColor,
            hoverColor: effectiveHoverColor,
            fgColor: effectiveFgColor,
            hoverFgColor: sidebarAccentFg,
            decoration: buttonDecoration,

            itemChild: widget.child,
            depth: depth,

            subItemsMargin: effectiveSubItemsMargin,
            subItemsPadding: effectiveSubItemsPadding,
            subItemsBorderColor: effectiveSubItemsBorderColor,
            subItemsBorderWidth: effectiveSubItemsBorderWidth,
            subItemsSpacing: effectiveSubItemsSpacing,
            children: widget.children,
          );
        },
      );
    }

    // -- Normal mode --

    return _SidebarItemButtonWithChildren(
      onPressed: handleTap,
      selected: widget.selected,
      isCollapsible: isCollapsible,
      expansionAnimation: expansionAnimation,

      iconWidget: iconWidget,
      trailing: trailing,
      height: effectiveHeight,
      padding: effectivePadding,
      textStyle: effectiveTextStyle,
      spacing: effectiveSpacing,

      activeColor: effectiveActiveColor,
      hoverColor: effectiveHoverColor,
      fgColor: effectiveFgColor,
      hoverFgColor: sidebarAccentFg,
      decoration: buttonDecoration,

      itemChild: widget.child,
      depth: depth,

      subItemsMargin: effectiveSubItemsMargin,
      subItemsPadding: effectiveSubItemsPadding,
      subItemsBorderColor: effectiveSubItemsBorderColor,
      subItemsBorderWidth: effectiveSubItemsBorderWidth,
      subItemsSpacing: effectiveSubItemsSpacing,
      children: widget.children,
    );
  }
}

class _SidebarItemButtonWithChildren extends StatelessWidget {
  const _SidebarItemButtonWithChildren({
    required this.onPressed,
    required this.selected,
    required this.isCollapsible,
    required this.iconWidget,
    required this.trailing,
    required this.height,
    required this.padding,
    required this.textStyle,
    required this.spacing,
    required this.activeColor,
    required this.hoverColor,
    required this.fgColor,
    required this.hoverFgColor,
    required this.decoration,
    required this.itemChild,
    required this.children,
    required this.depth,
    required this.subItemsMargin,
    required this.subItemsPadding,
    required this.subItemsBorderColor,
    required this.subItemsBorderWidth,
    required this.subItemsSpacing,
    this.expansionAnimation,
    this.labelAnimation,
  }) : assert(!isCollapsible || expansionAnimation != null);

  final VoidCallback onPressed;
  final bool selected;

  final bool isCollapsible;
  final Animation<double>? expansionAnimation;
  final Animation<double>? labelAnimation;

  final Widget? iconWidget;
  final Widget? trailing;

  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final double spacing;

  final Color activeColor;
  final Color hoverColor;
  final Color fgColor;
  final Color hoverFgColor;

  final ShadDecoration decoration;

  final Widget? itemChild;
  final List<Widget>? children;
  final int depth;

  final EdgeInsetsGeometry subItemsMargin;
  final EdgeInsetsGeometry subItemsPadding;
  final Color subItemsBorderColor;
  final double subItemsBorderWidth;
  final double subItemsSpacing;

  bool get _hasChildren => children != null && children!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    // --- Label ---
    Widget? label;
    if (itemChild != null) {
      label = DefaultTextStyle(
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          child: itemChild,
        ),
      );
    }

    // --- Trailing ---
    var trailingWidget = trailing;

    // Fade label and trailing during icon-collapse animation
    if (labelAnimation != null) {
      if (label != null) {
        label = FadeTransition(opacity: labelAnimation!, child: label);
      }
      if (trailingWidget != null) {
        trailingWidget = FadeTransition(
          opacity: labelAnimation!,
          child: trailingWidget,
        );
      }
    }

    // --- Button ---
    final Widget button = ShadButton.ghost(
      onPressed: onPressed,
      width: double.infinity,
      height: height,
      padding: padding,
      backgroundColor: selected ? activeColor : null,
      hoverBackgroundColor: hoverColor,
      foregroundColor: fgColor,
      hoverForegroundColor: hoverFgColor,
      decoration: decoration,
      leading: iconWidget,
      trailing: trailingWidget,
      gap: spacing,
      expands: true,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: label,
      ),
    );

    if (!_hasChildren) return button;

    // --- Sub-items container ---
    Widget subItems = ShadSidebarItemDepth(
      depth: depth + 1,
      child: Container(
        margin: subItemsMargin,
        padding: subItemsPadding,
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: subItemsBorderColor,
              width: subItemsBorderWidth,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: subItemsSpacing,
          children: children ?? const [],
        ),
      ),
    );

    // Collapsible: size transition driven by expansion animation
    if (isCollapsible) {
      subItems = SizeTransition(
        sizeFactor: expansionAnimation!,
        axisAlignment: -1,
        child: subItems,
      );
    }
    // Standard items in icon-collapse mode: collapse/fade with sidebar animation
    else if (labelAnimation != null) {
      subItems = SizeTransition(
        sizeFactor: labelAnimation!,
        axisAlignment: -1,
        child: FadeTransition(
          opacity: labelAnimation!,
          child: subItems,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        button,
        subItems,
      ],
    );
  }
}
// ---------------------------------------------------------------------------
// Default chevron
// ---------------------------------------------------------------------------

class _DefaultChevron extends StatelessWidget {
  const _DefaultChevron({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Icon(
        Directionality.of(context) == TextDirection.ltr
            ? LucideIcons.chevronRight
            : LucideIcons.chevronLeft,
        color: color,
        size: size,
      ),
    );
  }
}
