import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
// import 'package:flutter_portal/flutter_portal.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

class ShadcnTooltip extends StatefulWidget {
  const ShadcnTooltip({
    super.key,
    required this.child,
    required this.tooltip,
    this.focusNode,
    this.waitDuration,
    this.showDuration,
    this.offset,
    this.effects,
    this.shadows,
    this.alignment,
    this.childAlignment,
    this.padding,
    this.decoration,
  });

  /// The widget displayed as a tooltip.
  final Widget tooltip;

  /// The child widget that will show the [tooltip] when hovered or focused.
  final Widget child;

  /// The focus node of the child, the [tooltip] will be shown when focused.
  final FocusNode? focusNode;

  /// {@template tooltip.waitDuration}
  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to null (tooltips are shown immediately upon hover).
  /// {@endtemplate}
  final Duration? waitDuration;

  /// {@template tooltip.showDuration}
  /// The length of time that the tooltip will be shown after a mouse pointer
  /// exits the widget.
  ///
  /// Defaults to null.
  /// {@endtemplate}
  final Duration? showDuration;

  /// {@template tooltip.offset}
  /// The tooltip offset from the child, defaults to [Offset.zero].
  /// {@endtemplate}
  final Offset? offset;

  /// {@template tooltip.effects}
  /// The animation effects applied to the [tooltip]. Defaults to
  /// [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template tooltip.shadows}
  /// The shadows applied to the [tooltip], defaults to [ShadcnShadows.md].
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template tooltip.alignment}
  /// The alignment of the [tooltip], defaults to [Alignment.topCenter].
  /// {@endtemplate}
  final Alignment? alignment;

  /// {@template tooltip.childAlignment}
  /// The alignment of the [child], defaults to [Alignment.bottomCenter].
  /// {@endtemplate}
  final Alignment? childAlignment;

  /// {@template tooltip.padding}
  /// The padding of the [tooltip], defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template tooltip.decoration}
  /// The decoration of the [tooltip].
  /// {@endtemplate}
  final BoxDecoration? decoration;

  @override
  State<ShadcnTooltip> createState() => _ShadcnTooltipState();
}

class _ShadcnTooltipState extends State<ShadcnTooltip> {
  bool hovered = false;
  bool visible = false;

  bool get hasFocus => widget.focusNode?.hasFocus ?? false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(onFocusChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(ShadcnTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(onFocusChange);
      widget.focusNode?.addListener(onFocusChange);
    }
  }

  Future<void> onFocusChange() async {
    setState(() => visible = hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadcnTheme.of(context);

    final effectiveEffects = widget.effects ?? theme.tooltipTheme.effects ?? [];
    final effectivePadding = widget.padding ?? theme.tooltipTheme.padding;
    final effectiveShadows = widget.shadows ?? theme.tooltipTheme.shadows;
    final effectiveDecoration =
        widget.decoration ?? theme.tooltipTheme.decoration;
    final effectiveAlignment =
        widget.alignment ?? theme.tooltipTheme.alignment ?? Alignment.topCenter;
    final effectiveChildAlignment = widget.childAlignment ??
        theme.tooltipTheme.childAlignment ??
        Alignment.bottomCenter;
    final effectiveOffset =
        widget.offset ?? theme.tooltipTheme.offset ?? Offset.zero;

    Widget tooltip = Container(
      padding: effectivePadding,
      decoration: effectiveDecoration?.copyWith(boxShadow: effectiveShadows),
      child: DefaultTextStyle(
        style: TextStyle(
          color: theme.colorScheme.popoverForeground,
        ),
        textAlign: TextAlign.center,
        child: widget.tooltip,
      ),
    );

    if (effectiveEffects.isNotEmpty) {
      tooltip = Animate(
        effects: effectiveEffects,
        child: tooltip,
      );
    }

    return MouseRegion(
      onEnter: (_) async {
        hovered = true;
        if (widget.waitDuration != null) {
          await Future<void>.delayed(widget.waitDuration!);
        }
        if (hovered) {
          setState(() => visible = true);
        }
      },
      onExit: (_) async {
        hovered = false;
        if (widget.showDuration != null) {
          await Future<void>.delayed(widget.showDuration!);
        }
        if (!hovered && !hasFocus) {
          setState(() => visible = false);
        }
      },
      child: Portal(
        visible: visible,
        anchor: Anchor(
          childAlignment: effectiveAlignment,
          overlayAlignment: effectiveChildAlignment,
          offset: effectiveOffset,
        ),
        overlay: tooltip,
        child: widget.child,
      ),
    );
  }
}
