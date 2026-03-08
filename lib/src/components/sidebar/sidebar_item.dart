import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/sidebar/sidebar_scope.dart';
import 'package:shadcn_ui/src/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/border.dart';

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
  });

  final ShadSidebarItemVariant variant;
  final Widget? icon;
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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final sidebarTheme = theme.sidebarTheme;
    final colorScheme = theme.colorScheme;
    final scope = ShadSidebarScope.of(context);
    final depth = _ShadSidebarItemDepth.of(context);
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

    final effectiveIconSize =
        widget.iconSize ?? sidebarTheme.itemIconSize ?? 16.0;

    // -- Build icon --

    Widget? iconWidget;
    if (widget.icon != null) {
      iconWidget = IconTheme(
        data: IconThemeData(size: effectiveIconSize, color: effectiveFgColor),
        child: widget.icon!,
      );
    }

    // -- Build trailing --

    var trailing = widget.trailing;
    if (trailing == null && _isCollapsible) {
      trailing = RotationTransition(
        turns: Tween<double>(begin: 0, end: 0.25).animate(_expansionAnimation!),
        child: _DefaultChevron(
          size: effectiveIconSize,
          color: effectiveFgColor,
        ),
      );
    }

    // -- Shared button styling --

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
              leading: iconWidget,
              onPressed: _handleTap,
              width: effectiveHeight,
              height: effectiveHeight,
              padding: EdgeInsets.zero,
              backgroundColor: widget.selected ? effectiveActiveColor : null,
              hoverBackgroundColor: effectiveHoverColor,
              foregroundColor: effectiveFgColor,
              hoverForegroundColor: sidebarAccentFg,
              decoration: buttonDecoration,
            );

            if (widget.tooltip != null) {
              button = ShadTooltip(
                builder: (context) => Text(widget.tooltip!),
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
            effectiveActiveColor: effectiveActiveColor,
            effectiveHoverColor: effectiveHoverColor,
            effectiveFgColor: effectiveFgColor,
            sidebarAccentFg: sidebarAccentFg,
            buttonDecoration: buttonDecoration,
            sidebarBorder: sidebarBorder,
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
      effectiveActiveColor: effectiveActiveColor,
      effectiveHoverColor: effectiveHoverColor,
      effectiveFgColor: effectiveFgColor,
      sidebarAccentFg: sidebarAccentFg,
      buttonDecoration: buttonDecoration,
      sidebarBorder: sidebarBorder,
      depth: depth,
    );
  }

  // ---- Full button with optional children ---------------------------------

  Widget _buildButton({
    required Widget? iconWidget,
    required Widget? trailing,
    required double effectiveHeight,
    required EdgeInsetsGeometry effectivePadding,
    required Color effectiveActiveColor,
    required Color effectiveHoverColor,
    required Color effectiveFgColor,
    required Color sidebarAccentFg,
    required ShadDecoration buttonDecoration,
    required Color sidebarBorder,
    required int depth,
    Animation<double>? labelAnimation,
  }) {
    // Optionally fade label + trailing during icon-collapse animation
    var label = widget.child;
    var trailingWidget = trailing;

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
      onPressed: _handleTap,
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
      expands: true,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: label,
      ),
    );

    if (!_hasChildren) return button;

    // Sub-items
    Widget subItems = _ShadSidebarItemDepth(
      depth: depth + 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsetsDirectional.only(start: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(color: sidebarBorder),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 4,
          children: widget.children ?? const [],
        ),
      ),
    );

    if (_isCollapsible) {
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
