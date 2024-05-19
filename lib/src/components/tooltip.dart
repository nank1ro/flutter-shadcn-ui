import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';

/// Controls the visibility of a [ShadTooltip].
typedef ShadTooltipController = ShadPopoverController;

class ShadTooltip extends StatefulWidget {
  const ShadTooltip({
    super.key,
    required this.child,
    required this.builder,
    this.focusNode,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
    this.controller,
    this.longPressDuration,
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

  /// {@template tooltip.padding}
  /// The padding of the tooltip, defaults to
  /// `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsets? padding;

  /// {@template tooltip.decoration}
  /// The decoration of the tooltip.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template tooltip.anchor}
  /// The position of the [ShadTooltip], defaults to
  /// `ShadAnchorAutoPosition(preferBelow: false, verticalOffset: 24)`.
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template tooltip.hoverStrategies}
  /// The hover strategies to use for the tooltip on devices with touchscreens.
  /// {@endtemplate}
  final ShadHoverStrategies? hoverStrategies;

  /// The controller that controls the visibility of the [ShadTooltip].
  final ShadTooltipController? controller;

  final Duration? longPressDuration;

  @override
  State<ShadTooltip> createState() => _ShadTooltipState();
}

class _ShadTooltipState extends State<ShadTooltip> {
  ShadTooltipController? _controller;
  bool hovered = false;
  bool get hasFocus => widget.focusNode?.hasFocus ?? false;

  ShadTooltipController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) _controller = ShadTooltipController();
    widget.focusNode?.addListener(onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(onFocusChange);
    _controller?.dispose();
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

  void onFocusChange() => hasFocus ? controller.show() : controller.hide();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveEffects = widget.effects ?? theme.tooltipTheme.effects ?? [];
    final effectivePadding = widget.padding ?? theme.tooltipTheme.padding;
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

    final effectiveLongPressDuration =
        widget.longPressDuration ?? theme.tooltipTheme.longPressDuration;

    return ShadGestureDetector(
      longPressDuration: effectiveLongPressDuration,
      hoverStrategies: effectiveHoverStrategies,
      onHoverChange: (value) async {
        if (hovered == value) return;
        hovered = value;
        if (value) {
          if (widget.waitDuration != null) {
            await Future<void>.delayed(widget.waitDuration!);
          }
          if (hovered) {
            controller.show();
          }
        } else {
          if (widget.showDuration != null) {
            await Future<void>.delayed(widget.showDuration!);
          }
          if (!hovered && !hasFocus) {
            controller.hide();
          }
        }
      },
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, child) {
          return ShadPortal(
            visible: controller.isOpen,
            anchor: effectiveAnchor,
            portalBuilder: (context) {
              Widget tooltip = ShadDecorator(
                decoration: effectiveDecoration,
                child: Padding(
                  padding: effectivePadding ?? EdgeInsets.zero,
                  child: DefaultTextStyle(
                    style: theme.textTheme.muted
                        .copyWith(color: theme.colorScheme.popoverForeground),
                    textAlign: TextAlign.center,
                    child: widget.builder(context),
                  ),
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
          );
        },
      ),
    );
  }
}
