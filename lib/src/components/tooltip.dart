import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

class ShadTooltip extends StatefulWidget {
  const ShadTooltip({
    super.key,
    required this.child,
    required this.builder,
    this.focusNode,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.shadows,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
  });

  /// The widget displayed as a tooltip.
  final WidgetBuilder builder;

  /// The child widget that will show the tooltip when hovered or focused.
  final Widget child;

  /// The focus node of the child, the tooltip will be shown when focused.
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

  /// {@template tooltip.effects}
  /// The animation effects applied to the tooltip. Defaults to
  /// [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template tooltip.shadows}
  /// The shadows applied to the tooltip, defaults to [ShadShadows.md].
  /// {@endtemplate}
  final List<BoxShadow>? shadows;

  /// {@template tooltip.padding}
  /// The padding of the tooltip, defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template tooltip.decoration}
  /// The decoration of the tooltip.
  /// {@endtemplate}
  final BoxDecoration? decoration;

  /// {@template tooltip.anchor}
  /// The position of the [ShadTooltip], defaults to
  /// `ShadAnchorAutoPosition(preferBelow: false, verticalOffset: 24)`.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template tooltip.hoverStrategies}
  /// The hover strategies to use for the tooltip on devices with touchscreens.
  /// {@endtemplate}
  final ShadHoverStrategies? hoverStrategies;

  @override
  State<ShadTooltip> createState() => _ShadTooltipState();
}

class _ShadTooltipState extends State<ShadTooltip> {
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
  void didUpdateWidget(ShadTooltip oldWidget) {
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
    final theme = ShadTheme.of(context);

    final effectiveEffects = widget.effects ?? theme.tooltipTheme.effects ?? [];
    final effectivePadding = widget.padding ?? theme.tooltipTheme.padding;
    final effectiveShadows = widget.shadows ?? theme.tooltipTheme.shadows;
    final effectiveDecoration =
        widget.decoration ?? theme.tooltipTheme.decoration;
    final effectiveAnchor = widget.anchor ??
        theme.tooltipTheme.anchor ??
        const ShadAnchorAuto(
          preferBelow: false,
          verticalOffset: 24,
        );

    final effectiveHoverStrategies = widget.hoverStrategies ??
        theme.tooltipTheme.hoverStrategies ??
        theme.hoverStrategies;

    return ShadGestureDetector(
      hoverStrategies: effectiveHoverStrategies,
      hovered: (value) async {
        if (hoverd == value) return;
        // TODO: i'm a todo
        hovered = value;
        if (value) {
          if (widget.waitDuration != null) {
            await Future<void>.delayed(widget.waitDuration!);
          }
          if (hovered) {
            setState(() => visible = true);
          }
        } else {
          if (widget.showDuration != null) {
            await Future<void>.delayed(widget.showDuration!);
          }
          if (!hovered && !hasFocus) {
            setState(() => visible = false);
          }
        }
      },
      child: ShadPortal(
        visible: visible,
        anchor: effectiveAnchor,
        portalBuilder: (context) {
          Widget tooltip = Container(
            padding: effectivePadding,
            decoration:
                effectiveDecoration?.copyWith(boxShadow: effectiveShadows),
            child: DefaultTextStyle(
              style: theme.textTheme.muted
                  .copyWith(color: theme.colorScheme.popoverForeground),
              textAlign: TextAlign.center,
              child: widget.builder(context),
            ),
          );

          if (effectiveEffects.isNotEmpty) {
            tooltip = Animate(
              effects: effectiveEffects,
              child: tooltip,
            );
          }
          return tooltip;
        },
        child: widget.child,
      ),
    );
  }
}
