import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/popover.dart';
import 'package:shadcn_ui/src/raw_components/portal.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';

/// Controls the visibility of a [ShadTooltip].
typedef ShadTooltipController = ShadPopoverController;

/// {@template ShadTooltip}
/// A widget that displays a tooltip on hover or focus, styled to match the
/// Shadcn UI design system.
///
/// Provides customizable delay, duration, animation effects, and styling.
/// {@endtemplate}
class ShadTooltip extends StatefulWidget {
  /// {@macro ShadTooltip}
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
    this.duration,
    this.reverseDuration,
  });

  /// {@template ShadTooltip.builder}
  /// The builder function that creates the tooltip content widget.
  ///
  /// Called with the [BuildContext] to build the tooltip's content.
  /// {@endtemplate}
  final WidgetBuilder builder;

  /// {@template ShadTooltip.child}
  /// The child widget that triggers the tooltip when hovered or focused.
  ///
  /// This is the widget that the tooltip is attached to.
  /// {@endtemplate}
  final Widget child;

  /// {@template ShadTooltip.focusNode}
  /// The focus node of the child widget.
  ///
  /// When the child gains focus, the tooltip will be shown.
  /// {@endtemplate}
  final FocusNode? focusNode;

  /// {@template ShadTooltip.waitDuration}
  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to null (tooltips are shown immediately upon hover).
  /// {@endtemplate}
  final Duration? waitDuration;

  /// {@template ShadTooltip.showDuration}
  /// The length of time that the tooltip will be shown after a mouse pointer
  /// exits the widget.
  ///
  /// Defaults to null.
  /// {@endtemplate}
  final Duration? showDuration;

  /// {@template ShadTooltip.effects}
  /// The animation effects applied to the tooltip.
  ///
  /// Defaults to [FadeEffect(), ScaleEffect(begin: Offset(.95, .95), end:
  /// Offset(1, 1)),
  /// MoveEffect(begin: Offset(0, 2), end: Offset(0, 0))].
  /// {@endtemplate}
  final List<Effect<dynamic>>? effects;

  /// {@template ShadTooltip.padding}
  /// The padding of the tooltip content.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadTooltip.decoration}
  /// The decoration of the tooltip.
  ///
  /// Defines the visual appearance of the tooltip's container.
  /// {@endtemplate}
  final ShadDecoration? decoration;

  /// {@template ShadTooltip.anchor}
  /// The anchor position of the tooltip relative to its child.
  ///
  /// Defaults to
  /// ```dart
  /// const ShadAnchorAuto(
  ///   offset: Offset(0, -4),
  ///   followerAnchor: Alignment.topCenter,
  ///   targetAnchor: Alignment.topCenter,
  /// );
  /// ```
  /// {@endtemplate}
  final ShadAnchorBase? anchor;

  /// {@template ShadTooltip.hoverStrategies}
  /// The hover strategies to use for the tooltip on devices with touchscreens.
  ///
  /// Configures how hover interactions are interpreted, especially on touch
  /// devices.
  /// {@endtemplate}
  final ShadHoverStrategies? hoverStrategies;

  /// {@template ShadTooltip.controller}
  /// The controller that manages the visibility of the [ShadTooltip].
  ///
  /// Allows programmatic control over showing and hiding the tooltip. If null,
  /// a default [ShadTooltipController] is created internally.
  /// {@endtemplate}
  final ShadTooltipController? controller;

  /// {@template ShadTooltip.longPressDuration}
  /// The duration for a long press to be recognized, triggering the tooltip on
  /// touch devices.
  ///
  /// Specifies how long a press must be to trigger the tooltip on touch-based
  /// interactions.
  /// {@endtemplate}
  final Duration? longPressDuration;

  /// {@template ShadTooltip.duration}
  /// The duration of the tooltip's entrance animation.
  ///
  /// Defaults to [Animate.defaultDuration].
  /// {@endtemplate}
  final Duration? duration;

  /// {@template ShadTooltip.reverseDuration}
  /// The duration of the tooltip's exit animation.
  ///
  /// Defaults to [Duration.zero].
  /// {@endtemplate}
  final Duration? reverseDuration;

  @override
  State<ShadTooltip> createState() => _ShadTooltipState();
}

class _ShadTooltipState extends State<ShadTooltip>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  ShadTooltipController? _controller;
  bool hovered = false;
  bool get hasFocus => widget.focusNode?.hasFocus ?? false;

  ShadTooltipController get controller => widget.controller ?? _controller!;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Animate.defaultDuration,
      reverseDuration: Duration.zero,
    );
    if (widget.controller == null) _controller = ShadTooltipController();
    widget.focusNode?.addListener(onFocusChange);
  }

  @override
  void dispose() {
    animationController.dispose();
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

  void onFocusChange() {
    hasFocus ? controller.show() : controller.hide();
  }

  Future<void> onHoverChange(bool value) async {
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
        await animationController.reverse();
        controller.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveEffects = widget.effects ?? theme.tooltipTheme.effects ?? [];
    final effectivePadding = widget.padding ?? theme.tooltipTheme.padding;
    final effectiveDecoration =
        (theme.tooltipTheme.decoration ?? const ShadDecoration()).merge(
          widget.decoration,
        );

    final effectiveAnchor =
        widget.anchor ??
        theme.tooltipTheme.anchor ??
        const ShadAnchorAuto(
          offset: Offset(0, -4),
          followerAnchor: Alignment.topCenter,
          targetAnchor: Alignment.topCenter,
        );

    final hoverStrategies =
        widget.hoverStrategies ??
        theme.tooltipTheme.hoverStrategies ??
        theme.hoverStrategies;

    final effectiveLongPressDuration =
        widget.longPressDuration ?? theme.tooltipTheme.longPressDuration;

    final effectiveHoverStrategies = hoverStrategies.copyWith(
      onHoverChange: (value) {
        hoverStrategies.onHoverChange?.call(value);
        onHoverChange(value);
      },
      longPressDuration: effectiveLongPressDuration,
    );

    final effectiveDuration = widget.duration ?? theme.tooltipTheme.duration;
    final effectiveReverseDuration =
        widget.reverseDuration ?? theme.tooltipTheme.reverseDuration;

    // Update the animation controller with the new durations.
    animationController.duration = effectiveDuration;
    animationController.reverseDuration = effectiveReverseDuration;

    return ListenableBuilder(
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
                  style: theme.textTheme.muted.copyWith(
                    color: theme.colorScheme.popoverForeground,
                  ),
                  child: widget.builder(context),
                ),
              ),
            );

            if (effectiveEffects.isNotEmpty) {
              tooltip = ShadAnimate(
                controller: animationController,
                effects: effectiveEffects,
                child: tooltip,
              );
            }
            return ShadMouseArea(groupId: 'tooltip', child: tooltip);
          },
          child: ShadMouseArea(
            groupId: 'tooltip',
            child: ShadTheme(
              data: theme.copyWith(hoverStrategies: effectiveHoverStrategies),
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
