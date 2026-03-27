import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
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
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? hoverColor;
  final Color? activeColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;
  final double? iconSize;
  final Color? iconColor;
  final Color? activeIconColor;
  final double? spacing;
  final EdgeInsetsGeometry? subItemsMargin;
  final EdgeInsetsGeometry? subItemsPadding;
  final Color? subItemsBorderColor;
  final double? subItemsBorderWidth;
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
          return _buildButton(
            iconWidget: iconWidget,
            trailing: trailing,
            effectiveHeight: effectiveHeight,
            effectivePadding: effectivePadding,
            effectiveTextStyle: effectiveTextStyle,
            effectiveSpacing: effectiveSpacing,
            effectiveActiveColor: effectiveActiveColor,
            effectiveHoverColor: effectiveHoverColor,
            effectiveFgColor: effectiveFgColor,
            sidebarAccentFg: sidebarAccentFg,
            buttonDecoration: buttonDecoration,
            effectiveSubItemsMargin: effectiveSubItemsMargin,
            effectiveSubItemsPadding: effectiveSubItemsPadding,
            effectiveSubItemsBorderColor: effectiveSubItemsBorderColor,
            effectiveSubItemsBorderWidth: effectiveSubItemsBorderWidth,
            effectiveSubItemsSpacing: effectiveSubItemsSpacing,
            depth: depth,
            labelAnimation: scope.animation,
          );
        },
      );
    }

    // -- Normal mode --

    return _buildButton(
      iconWidget: iconWidget,
      trailing: trailing,
      effectiveHeight: effectiveHeight,
      effectivePadding: effectivePadding,
      effectiveTextStyle: effectiveTextStyle,
      effectiveSpacing: effectiveSpacing,
      effectiveActiveColor: effectiveActiveColor,
      effectiveHoverColor: effectiveHoverColor,
      effectiveFgColor: effectiveFgColor,
      sidebarAccentFg: sidebarAccentFg,
      buttonDecoration: buttonDecoration,
      effectiveSubItemsMargin: effectiveSubItemsMargin,
      effectiveSubItemsPadding: effectiveSubItemsPadding,
      effectiveSubItemsBorderColor: effectiveSubItemsBorderColor,
      effectiveSubItemsBorderWidth: effectiveSubItemsBorderWidth,
      effectiveSubItemsSpacing: effectiveSubItemsSpacing,
      depth: depth,
    );
  }

  // ---- Full button with optional children ---------------------------------

  Widget _buildButton({
    required Widget? iconWidget,
    required Widget? trailing,
    required double effectiveHeight,
    required EdgeInsetsGeometry effectivePadding,
    required TextStyle effectiveTextStyle,
    required double effectiveSpacing,
    required Color effectiveActiveColor,
    required Color effectiveHoverColor,
    required Color effectiveFgColor,
    required Color sidebarAccentFg,
    required ShadDecoration buttonDecoration,
    required EdgeInsetsGeometry effectiveSubItemsMargin,
    required EdgeInsetsGeometry effectiveSubItemsPadding,
    required Color effectiveSubItemsBorderColor,
    required double effectiveSubItemsBorderWidth,
    required double effectiveSubItemsSpacing,
    required int depth,
    Animation<double>? labelAnimation,
  }) {
    // Build label with text style applied
    Widget? label;
    if (widget.child != null) {
      label = DefaultTextStyle(
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          child: widget.child,
        ),
      );
    }

    var trailingWidget = trailing;

    // Fade label and trailing during icon-collapse animation
    if (labelAnimation != null) {
      if (label != null) {
        label = FadeTransition(opacity: labelAnimation, child: label);
      }
      if (trailingWidget != null) {
        trailingWidget = FadeTransition(
          opacity: labelAnimation,
          child: trailingWidget,
        );
      }
    }

    final Widget button = ShadButton.ghost(
      onPressed: handleTap,
      width: double.infinity,
      height: effectiveHeight,
      padding: effectivePadding,
      backgroundColor: widget.selected ? effectiveActiveColor : null,
      hoverBackgroundColor: effectiveHoverColor,
      foregroundColor: effectiveFgColor,
      hoverForegroundColor: sidebarAccentFg,
      decoration: buttonDecoration,
      leading: iconWidget,
      trailing: trailingWidget,
      gap: effectiveSpacing,
      expands: true,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: label,
      ),
    );

    if (!hasChildren) return button;

    // -- Sub-items --

    Widget subItems = ShadSidebarItemDepth(
      depth: depth + 1,
      child: Container(
        margin: effectiveSubItemsMargin,
        padding: effectiveSubItemsPadding,
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: effectiveSubItemsBorderColor,
              width: effectiveSubItemsBorderWidth,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: effectiveSubItemsSpacing,
          children: widget.children ?? const [],
        ),
      ),
    );

    if (isCollapsible) {
      subItems = SizeTransition(
        sizeFactor: expansionAnimation!,
        axisAlignment: -1,
        child: subItems,
      );
    } else if (labelAnimation != null) {
      subItems = SizeTransition(
        sizeFactor: labelAnimation,
        axisAlignment: -1,
        child: FadeTransition(
          opacity: labelAnimation,
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
