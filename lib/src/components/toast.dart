import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/position.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

const kDefaultToastDuration = Duration(seconds: 5);

class ShadToaster extends StatefulWidget {
  const ShadToaster({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShadToaster> createState() => ShadToasterState();

  static ShadToasterState of(BuildContext context) {
    return maybeOf(context)!;
  }

  static ShadToasterState? maybeOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<ShadToasterScope>();
    return scope?.shadMessengerState;
  }
}

class ShadToasterState extends State<ShadToaster>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this);
  final _visibleToast = ValueNotifier<ShadToast?>(null);
  final _shown = ValueNotifier(false);
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _shown.dispose();
    _visibleToast.dispose();
    super.dispose();
  }

  void show(ShadToast toast) {
    _timer?.cancel();
    _shown.value = true;
    _visibleToast.value = toast;
    _controller.forward(from: 0);
    final effectiveDuration = toast.duration ?? kDefaultToastDuration;
    _timer = Timer(effectiveDuration, hide);
  }

  Future<void> hide({bool animate = true}) async {
    _timer?.cancel();
    _shown.value = false;
    if (animate) await _controller.forward(from: 0);
    _visibleToast.value = null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadToasterScope(
      shadMessengerState: this,
      child: Stack(
        children: [
          widget.child,
          ValueListenableBuilder(
            valueListenable: _shown,
            builder: (context, visible, child) {
              return ValueListenableBuilder(
                valueListenable: _visibleToast,
                builder: (context, toast, child) {
                  final effectiveToastTheme = switch (toast?.variant) {
                    ShadToastVariant.primary || null => theme.primaryToastTheme,
                    ShadToastVariant.destructive => theme.destructiveToastTheme,
                  };
                  final effectiveAlignment = toast?.alignment ??
                      effectiveToastTheme.alignment ??
                      Alignment.bottomRight;
                  // ignore: omit_local_variable_types
                  final List<Effect<dynamic>> defaultAnimateIn =
                      switch (effectiveAlignment) {
                    Alignment.bottomRight ||
                    Alignment.bottomLeft ||
                    Alignment.bottomCenter =>
                      [
                        const SlideEffect(
                          begin: Offset(0, 1),
                          end: Offset.zero,
                        ),
                      ],
                    Alignment.topRight ||
                    Alignment.topLeft ||
                    Alignment.topCenter =>
                      [
                        const SlideEffect(
                          begin: Offset(0, -1),
                          end: Offset.zero,
                        ),
                      ],
                    Alignment.centerRight ||
                    Alignment.topRight ||
                    Alignment.bottomRight =>
                      [
                        const SlideEffect(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ),
                      ],
                    Alignment.centerLeft ||
                    Alignment.topLeft ||
                    Alignment.bottomLeft =>
                      [
                        const SlideEffect(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ),
                      ],
                    Alignment.center || Alignment() => [
                        const FadeEffect(),
                        const ScaleEffect(
                          begin: Offset(.95, .95),
                          end: Offset(1, 1),
                        ),
                      ],
                  };

                  // ignore: omit_local_variable_types
                  final List<Effect<dynamic>> defaultAnimateOut =
                      switch (effectiveAlignment) {
                    Alignment.bottomRight ||
                    Alignment.topRight ||
                    Alignment.centerRight =>
                      const [
                        SlideEffect(
                          begin: Offset.zero,
                          end: Offset(1, 0),
                        ),
                      ],
                    Alignment.topLeft ||
                    Alignment.centerLeft ||
                    Alignment.bottomLeft =>
                      const [
                        SlideEffect(
                          begin: Offset.zero,
                          end: Offset(-1, 0),
                        ),
                      ],
                    Alignment.topCenter => [
                        const SlideEffect(
                          begin: Offset.zero,
                          end: Offset(0, -1),
                        ),
                      ],
                    Alignment.bottomCenter => [
                        const SlideEffect(
                          begin: Offset.zero,
                          end: Offset(0, 1),
                        ),
                      ],
                    Alignment.center || Alignment() => [
                        const FadeEffect(begin: 1, end: 0),
                        const ScaleEffect(
                          begin: Offset(1, 1),
                          end: Offset(.95, .95),
                        ),
                      ],
                  };

                  final effectiveAnimateIn = toast?.animateIn ??
                      effectiveToastTheme.animateIn ??
                      defaultAnimateIn;
                  final effectiveAnimateOut = toast?.animateOut ??
                      effectiveToastTheme.animateOut ??
                      defaultAnimateOut;

                  final defaultOffset = switch (effectiveAlignment) {
                    Alignment.topCenter ||
                    Alignment.topLeft ||
                    Alignment.topRight =>
                      Offset(16, MediaQuery.paddingOf(context).top + 16),
                    Alignment.bottomCenter ||
                    Alignment.bottomLeft ||
                    Alignment.bottomRight =>
                      Offset(16, MediaQuery.paddingOf(context).bottom + 16),
                    _ => const Offset(16, 16),
                  };

                  final effectiveOffset = toast?.offset ??
                      effectiveToastTheme.offset ??
                      defaultOffset;

                  return Animate(
                    controller: _controller,
                    effects: visible ? effectiveAnimateIn : effectiveAnimateOut,
                    child: Align(
                      alignment: effectiveAlignment,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: effectiveOffset.dx,
                          vertical: effectiveOffset.dy,
                        ),
                        child: toast,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ShadToasterScope extends InheritedWidget {
  const ShadToasterScope({
    super.key,
    required super.child,
    required this.shadMessengerState,
  });
  final ShadToasterState shadMessengerState;

  @override
  bool updateShouldNotify(ShadToasterScope oldWidget) =>
      shadMessengerState != oldWidget.shadMessengerState;
}

enum ShadToastVariant {
  primary,
  destructive,
}

class ShadToast extends StatefulWidget {
  const ShadToast({
    super.key,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconSrc,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  }) : variant = ShadToastVariant.primary;

  const ShadToast.destructive({
    super.key,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconSrc,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  }) : variant = ShadToastVariant.destructive;

  const ShadToast.raw({
    super.key,
    required this.variant,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconSrc,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  });

  final Widget? title;
  final Widget? description;
  final Widget? action;
  final Widget? closeIcon;
  final ShadImageSrc? closeIconSrc;
  final Alignment? alignment;
  final Offset? offset;
  final Duration? duration;
  final List<Effect<dynamic>>? animateIn;
  final List<Effect<dynamic>>? animateOut;
  final TextDirection? textDirection;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? showCloseIconOnlyWhenHovered;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? actionPadding;
  final Border? border;
  final BorderRadius? radius;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final ShadPosition? closeIconPosition;
  final ShadToastVariant variant;
  final BoxConstraints? constraints;

  @override
  State<ShadToast> createState() => _ShadToastState();
}

class _ShadToastState extends State<ShadToast> {
  final hovered = ValueNotifier(false);

  @override
  void dispose() {
    hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveToastTheme = switch (widget.variant) {
      ShadToastVariant.primary => theme.primaryToastTheme,
      ShadToastVariant.destructive => theme.destructiveToastTheme,
    };
    final effectiveForegroundColor = switch (widget.variant) {
      ShadToastVariant.primary => theme.colorScheme.foreground,
      ShadToastVariant.destructive => theme.colorScheme.destructiveForeground,
    };

    final effectiveCloseIcon = widget.closeIcon ??
        ShadButton.ghost(
          icon: ShadImage.square(
            size: 16,
            widget.closeIconSrc ??
                effectiveToastTheme.closeIconSrc ??
                LucideIcons.x,
          ),
          width: 20,
          height: 20,
          padding: EdgeInsets.zero,
          foregroundColor: effectiveForegroundColor.withOpacity(.5),
          hoverBackgroundColor: Colors.transparent,
          hoverForegroundColor: effectiveForegroundColor,
          pressedForegroundColor: effectiveForegroundColor,
          onPressed: () => ShadToaster.of(context).hide(),
        );
    final effectiveTitleStyle = widget.titleStyle ??
        effectiveToastTheme.titleStyle ??
        theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
          color: effectiveForegroundColor,
        );
    final effectiveDescriptionStyle = widget.descriptionStyle ??
        effectiveToastTheme.descriptionStyle ??
        theme.textTheme.muted.copyWith(
          color: effectiveForegroundColor.withOpacity(.9),
        );
    final effectiveActionPadding = widget.actionPadding ??
        effectiveToastTheme.actionPadding ??
        const EdgeInsets.only(left: 16);
    final effectiveBorder = widget.border ??
        effectiveToastTheme.border ??
        Border.all(color: theme.colorScheme.border);
    final effectiveBorderRadius =
        widget.radius ?? effectiveToastTheme.radius ?? theme.radius;
    final effectiveShadows =
        widget.shadows ?? effectiveToastTheme.shadows ?? ShadShadows.lg;
    final effectiveBackgroundColor = widget.backgroundColor ??
        effectiveToastTheme.backgroundColor ??
        theme.colorScheme.background;
    final effectivePadding = widget.padding ??
        effectiveToastTheme.padding ??
        const EdgeInsets.fromLTRB(24, 24, 32, 24);
    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        effectiveToastTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveCloseIconPosition = widget.closeIconPosition ??
        effectiveToastTheme.closeIconPosition ??
        const ShadPosition(top: 8, right: 8);
    final effectiveShowCloseIconOnlyWhenHovered =
        widget.showCloseIconOnlyWhenHovered ??
            effectiveToastTheme.showCloseIconOnlyWhenHovered ??
            true;

    return MouseRegion(
      onEnter: (_) => hovered.value = true,
      onExit: (_) => hovered.value = false,
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth:
                  breakpoint >= theme.breakpoints.md ? 0 : double.infinity,
              maxWidth:
                  breakpoint >= theme.breakpoints.md ? 420 : double.infinity,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: effectiveBorder,
                borderRadius: effectiveBorderRadius,
                boxShadow: effectiveShadows,
                color: effectiveBackgroundColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: effectivePadding,
                    child: Row(
                      textDirection: widget.textDirection,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: effectiveCrossAxisAlignment,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.title != null)
                                DefaultTextStyle(
                                  style: effectiveTitleStyle,
                                  child: widget.title!,
                                ),
                              if (widget.description != null)
                                DefaultTextStyle(
                                  style: effectiveDescriptionStyle,
                                  child: widget.description!,
                                ),
                            ],
                          ),
                        ),
                        if (widget.action != null)
                          Padding(
                            padding: effectiveActionPadding,
                            child: widget.action,
                          ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: hovered,
                    builder: (context, hovered, child) {
                      if (!effectiveShowCloseIconOnlyWhenHovered) {
                        return child!;
                      }
                      return Visibility.maintain(
                        visible: hovered,
                        child: child!,
                      );
                    },
                    child: effectiveCloseIcon,
                  ).positionedWith(effectiveCloseIconPosition),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
