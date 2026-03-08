import 'package:flutter/widgets.dart';

import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/components/sidebar.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

// ---------------------------------------------------------------------------
// Depth tracking
// ---------------------------------------------------------------------------

class _ShadSidebarItemDepth extends InheritedWidget {
  const _ShadSidebarItemDepth({
    required this.depth,
    required super.child,
  });

  final int depth;

  static int of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<_ShadSidebarItemDepth>()
            ?.depth ??
        0;
  }

  @override
  bool updateShouldNotify(_ShadSidebarItemDepth oldWidget) {
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
    this.leading,
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
  }) : variant = ShadSidebarItemVariant.standard,
       initiallyExpanded = false,
       onExpansionChanged = null;

  /// Collapsible item — [children] are shown/hidden with animation.
  const ShadSidebarItem.collapsible({
    super.key,
    this.leading,
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
  }) : variant = ShadSidebarItemVariant.collapsible;

  const ShadSidebarItem.raw({
    super.key,
    required this.variant,
    this.leading,
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
  });

  final ShadSidebarItemVariant variant;
  final Widget? leading;
  final Widget? child;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool selected;
  final String? tooltip;
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

  @override
  State<ShadSidebarItem> createState() => _ShadSidebarItemState();
}

class _ShadSidebarItemState extends State<ShadSidebarItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isExpanded = false;

  AnimationController? _expansionController;
  CurvedAnimation? _expansionAnimation;

  bool get _isCollapsible =>
      widget.variant == ShadSidebarItemVariant.collapsible;

  bool get _hasChildren =>
      widget.children != null && widget.children!.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _initExpansion();
  }

  @override
  void didUpdateWidget(ShadSidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    final wasCollapsible =
        oldWidget.variant == ShadSidebarItemVariant.collapsible;
    if (_isCollapsible && !wasCollapsible) {
      _initExpansion();
    } else if (!_isCollapsible && wasCollapsible) {
      _disposeExpansion();
    }
  }

  @override
  void dispose() {
    _disposeExpansion();
    super.dispose();
  }

  void _initExpansion() {
    if (!_isCollapsible) return;
    _isExpanded = widget.initiallyExpanded;
    _expansionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: _isExpanded ? 1.0 : 0.0,
    );
    _expansionAnimation = CurvedAnimation(
      parent: _expansionController!,
      curve: Curves.easeInOut,
    );
  }

  void _disposeExpansion() {
    _expansionAnimation?.dispose();
    _expansionAnimation = null;
    _expansionController?.dispose();
    _expansionController = null;
    _isExpanded = false;
  }

  void _toggleExpansion() {
    setState(() => _isExpanded = !_isExpanded);
    if (_isExpanded) {
      _expansionController!.forward();
    } else {
      _expansionController!.reverse();
    }
    widget.onExpansionChanged?.call(_isExpanded);
  }

  void _handleTap() {
    final scope = ShadSidebarScope.maybeOf(context);

    if (scope != null &&
        scope.collapsibleMode == ShadSidebarCollapsibleMode.icon &&
        scope.animation.status == AnimationStatus.dismissed &&
        _isCollapsible) {
      scope.controller.open();
      if (!_isExpanded) _toggleExpansion();
      return;
    }

    if (_isCollapsible) {
      _toggleExpansion();
    }
    widget.onPressed?.call();
  }

  /// Resolves colors using the sidebar color scheme fields with
  /// generic fallback: widget param → theme → sidebarColor → genericColor
  _SidebarColors _resolveColors(
    ShadThemeData theme,
    ShadSidebarTheme sidebarTheme,
  ) {
    final colorScheme = theme.colorScheme;

    final sidebarFg = colorScheme.sidebarForeground ?? colorScheme.foreground;
    final sidebarAccent = colorScheme.sidebarAccent ?? colorScheme.accent;
    final sidebarAccentFg =
        colorScheme.sidebarAccentForeground ?? colorScheme.accentForeground;
    final sidebarPrimary = colorScheme.sidebarPrimary ?? colorScheme.primary;
    final sidebarPrimaryFg =
        colorScheme.sidebarPrimaryForeground ?? colorScheme.primaryForeground;
    final sidebarBorder = colorScheme.sidebarBorder ?? colorScheme.border;
    final sidebarRing = colorScheme.sidebarRing ?? colorScheme.ring;

    return _SidebarColors(
      foreground: sidebarFg,
      accent: sidebarAccent,
      accentForeground: sidebarAccentFg,
      primary: sidebarPrimary,
      primaryForeground: sidebarPrimaryFg,
      border: sidebarBorder,
      ring: sidebarRing,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final scope = ShadSidebarScope.of(context);
    final depth = _ShadSidebarItemDepth.of(context);
    final isSubItem = depth > 0;
    final colors = _resolveColors(theme, sidebarTheme);

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
            ? sidebarTheme.subItemBorderRadius ?? BorderRadius.circular(6)
            : sidebarTheme.itemBorderRadius ?? BorderRadius.circular(6));
    final effectiveHoverColor =
        widget.hoverColor ?? sidebarTheme.itemHoverColor ?? colors.accent;

    // Active → sidebar primary
    final effectiveActiveColor =
        widget.activeColor ?? sidebarTheme.itemActiveColor ?? colors.accent;

    // Text color: active → primary foreground, normal → sidebar foreground
    final effectiveTextStyle = widget.selected
        ? (widget.activeTextStyle ??
              (isSubItem
                  ? sidebarTheme.subItemActiveTextStyle
                  : sidebarTheme.itemActiveTextStyle) ??
              TextStyle(
                fontSize: isSubItem ? 13 : 14,
                fontWeight: FontWeight.w600,
                color: colors.accentForeground,
              ))
        : (widget.textStyle ??
              (isSubItem
                  ? sidebarTheme.subItemTextStyle
                  : sidebarTheme.itemTextStyle) ??
              TextStyle(
                fontSize: isSubItem ? 13 : 14,
                color: colors.foreground,
              ));

    final effectiveIconSize =
        widget.iconSize ?? sidebarTheme.itemIconSize ?? 16.0;

    // Icon color: active → primary foreground, normal → sidebar foreground
    final effectiveIconColor = widget.selected
        ? (widget.activeIconColor ??
              sidebarTheme.itemActiveIconColor ??
              colors.accentForeground)
        : (widget.iconColor ?? sidebarTheme.itemIconColor ?? colors.foreground);

    final effectiveSpacing = widget.spacing ?? sidebarTheme.itemSpacing ?? 8.0;

    final effectiveSubItemsBorderColor =
        sidebarTheme.subItemsBorderColor ?? colors.border;

    Color? backgroundColor;
    if (widget.selected) {
      backgroundColor = effectiveActiveColor;
    } else if (_isHovered) {
      backgroundColor = effectiveHoverColor;
    }

    // -- Icon-collapsed mode --

    if (scope.collapsibleMode == ShadSidebarCollapsibleMode.icon) {
      return AnimatedBuilder(
        animation: scope.animation,
        builder: (context, _) {
          if (scope.animation.status == AnimationStatus.dismissed) {
            return _buildIconCollapsed(
              effectiveHeight: effectiveHeight,
              effectiveBorderRadius: effectiveBorderRadius,
              effectiveIconSize: effectiveIconSize,
              effectiveIconColor: effectiveIconColor,
              backgroundColor: backgroundColor,
            );
          }

          return _buildExpandedLayout(
            scope: scope,
            depth: depth,
            effectiveHeight: effectiveHeight,
            effectivePadding: effectivePadding,
            effectiveBorderRadius: effectiveBorderRadius,
            effectiveTextStyle: effectiveTextStyle,
            effectiveIconSize: effectiveIconSize,
            effectiveIconColor: effectiveIconColor,
            effectiveSpacing: effectiveSpacing,
            backgroundColor: backgroundColor,
            subItemsBorderColor: effectiveSubItemsBorderColor,
            labelAnimation: scope.animation,
          );
        },
      );
    }

    return _buildExpandedLayout(
      scope: scope,
      depth: depth,
      effectiveHeight: effectiveHeight,
      effectivePadding: effectivePadding,
      effectiveBorderRadius: effectiveBorderRadius,
      effectiveTextStyle: effectiveTextStyle,
      effectiveIconSize: effectiveIconSize,
      effectiveIconColor: effectiveIconColor,
      effectiveSpacing: effectiveSpacing,
      backgroundColor: backgroundColor,
      subItemsBorderColor: effectiveSubItemsBorderColor,
    );
  }

  // ---- Icon-collapsed layout ----------------------------------------------

  Widget _buildIconCollapsed({
    required double effectiveHeight,
    required BorderRadiusGeometry effectiveBorderRadius,
    required double effectiveIconSize,
    required Color effectiveIconColor,
    required Color? backgroundColor,
  }) {
    final icon = _buildLeadingIcon(
      iconSize: effectiveIconSize,
      iconColor: effectiveIconColor,
    );

    Widget result = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleTap,
        child: Semantics(
          button: true,
          label: widget.tooltip,
          selected: widget.selected,
          child: Container(
            height: effectiveHeight,
            width: effectiveHeight,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: effectiveBorderRadius,
            ),
            alignment: Alignment.center,
            child: icon ?? const SizedBox.shrink(),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      result = ShadTooltip(
        builder: (context) => Text(widget.tooltip!),
        child: result,
      );
    }

    return result;
  }

  // ---- Expanded layout ----------------------------------------------------

  Widget _buildExpandedLayout({
    required ShadSidebarScope scope,
    required int depth,
    required double effectiveHeight,
    required EdgeInsetsGeometry effectivePadding,
    required BorderRadiusGeometry effectiveBorderRadius,
    required TextStyle effectiveTextStyle,
    required double effectiveIconSize,
    required Color effectiveIconColor,
    required double effectiveSpacing,
    required Color? backgroundColor,
    required Color subItemsBorderColor,
    Animation<double>? labelAnimation,
  }) {
    final itemRow = _buildItemRow(
      effectiveHeight: effectiveHeight,
      effectivePadding: effectivePadding,
      effectiveBorderRadius: effectiveBorderRadius,
      effectiveTextStyle: effectiveTextStyle,
      effectiveIconSize: effectiveIconSize,
      effectiveIconColor: effectiveIconColor,
      effectiveSpacing: effectiveSpacing,
      backgroundColor: backgroundColor,
      labelAnimation: labelAnimation,
    );

    if (!_hasChildren) return itemRow;

    // Build sub-items container with start border
    var subItems = _buildSubItemsContainer(
      depth: depth,
      borderColor: subItemsBorderColor,
    );

    if (_isCollapsible) {
      // Animated expand/collapse
      subItems = SizeTransition(
        sizeFactor: _expansionAnimation!,
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
        itemRow,
        subItems,
      ],
    );
  }

  // ---- Item row -----------------------------------------------------------

  Widget _buildItemRow({
    required double effectiveHeight,
    required EdgeInsetsGeometry effectivePadding,
    required BorderRadiusGeometry effectiveBorderRadius,
    required TextStyle effectiveTextStyle,
    required double effectiveIconSize,
    required Color effectiveIconColor,
    required double effectiveSpacing,
    required Color? backgroundColor,
    Animation<double>? labelAnimation,
  }) {
    final icon = _buildLeadingIcon(
      iconSize: effectiveIconSize,
      iconColor: effectiveIconColor,
    );

    var trailing = _buildTrailing(
      iconSize: effectiveIconSize,
      iconColor: effectiveIconColor,
    );

    Widget? label;
    if (widget.child != null) {
      label = DefaultTextStyle(
        style: effectiveTextStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        child: widget.child!,
      );
    }

    // Fade label and trailing during icon-collapse animation
    if (labelAnimation != null) {
      if (label != null) {
        label = FadeTransition(opacity: labelAnimation, child: label);
      }
      if (trailing != null) {
        trailing = FadeTransition(opacity: labelAnimation, child: trailing);
      }
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleTap,
        child: Semantics(
          button: true,
          label: widget.tooltip,
          selected: widget.selected,
          child: ClipRRect(
            borderRadius: effectiveBorderRadius,
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: effectiveHeight,
              padding: effectivePadding,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: effectiveBorderRadius,
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    icon,
                    SizedBox(width: effectiveSpacing),
                  ],
                  if (label != null) Expanded(child: label),
                  if (trailing != null) ...[
                    SizedBox(width: effectiveSpacing),
                    trailing,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ---- Sub-items container ------------------------------------------------

  Widget _buildSubItemsContainer({
    required int depth,
    required Color borderColor,
  }) {
    return _ShadSidebarItemDepth(
      depth: depth + 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsetsDirectional.only(start: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(color: borderColor),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.children ?? const [],
        ),
      ),
    );
  }

  // ---- Leading icon -------------------------------------------------------

  Widget? _buildLeadingIcon({
    required double iconSize,
    required Color iconColor,
  }) {
    if (widget.leading == null) return null;
    return IconTheme(
      data: IconThemeData(size: iconSize, color: iconColor),
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: widget.leading,
      ),
    );
  }

  // ---- Trailing -----------------------------------------------------------

  Widget? _buildTrailing({
    required double iconSize,
    required Color iconColor,
  }) {
    if (widget.trailing != null) return widget.trailing;
    if (!_isCollapsible) return null;

    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 0.25).animate(_expansionAnimation!),
      child: _DefaultChevron(size: iconSize, color: iconColor),
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
      child: CustomPaint(painter: _ChevronPainter(color: color)),
    );
  }
}

class _ChevronPainter extends CustomPainter {
  _ChevronPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(size.width * 0.35, size.height * 0.25)
      ..lineTo(size.width * 0.65, size.height * 0.5)
      ..lineTo(size.width * 0.35, size.height * 0.75);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ChevronPainter oldDelegate) => oldDelegate.color != color;
}

class _SidebarColors {
  const _SidebarColors({
    required this.foreground,
    required this.accent,
    required this.accentForeground,
    required this.primary,
    required this.primaryForeground,
    required this.border,
    required this.ring,
  });

  final Color foreground;
  final Color accent;
  final Color accentForeground;
  final Color primary;
  final Color primaryForeground;
  final Color border;
  final Color ring;
}
