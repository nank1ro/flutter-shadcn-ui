import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';
import 'package:shadcn_ui/src/utils/position.dart';

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
                  final effectiveAnimateIn = toast?.animateIn ??
                      theme.toastTheme.animateIn ??
                      [
                        SlideEffect(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                          duration: 300.milliseconds,
                        ),
                      ];
                  final effectiveAnimateOut = toast?.animateOut ??
                      theme.toastTheme.animateOut ??
                      [
                        SlideEffect(
                          begin: Offset.zero,
                          end: const Offset(1, 0),
                          duration: 300.milliseconds,
                        ),
                      ];
                  final effectiveOffset = toast?.offset ??
                      theme.toastTheme.offset ??
                      const Offset(16, 16);
                  final effectiveAlignment = toast?.alignment ??
                      theme.toastTheme.alignment ??
                      Alignment.bottomRight;
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
  });

  final Widget? title;
  final Widget? description;
  final Widget? action;
  final Widget? closeIcon;
  final String? closeIconSrc;
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
    final effectiveCloseIcon = widget.closeIcon ??
        ShadButton.ghost(
          icon: ShadImage.square(
            size: 16,
            widget.closeIconSrc ??
                theme.toastTheme.closeIconSrc ??
                ShadAssets.x,
          ),
          width: 20,
          height: 20,
          padding: EdgeInsets.zero,
          foregroundColor: theme.colorScheme.foreground.withOpacity(.5),
          hoverForegroundColor: theme.colorScheme.foreground,
          pressedForegroundColor: theme.colorScheme.foreground,
          onPressed: () => ShadToaster.of(context).hide(),
        );
    final effectiveTitleStyle = widget.titleStyle ??
        theme.toastTheme.titleStyle ??
        theme.textTheme.muted.copyWith(
          fontWeight: FontWeight.w500,
          color: theme.colorScheme.foreground,
        );
    final effectiveDescriptionStyle = widget.descriptionStyle ??
        theme.toastTheme.descriptionStyle ??
        theme.textTheme.muted.copyWith(
          color: theme.colorScheme.foreground.withOpacity(.9),
        );
    final effectiveActionPadding = widget.actionPadding ??
        theme.toastTheme.actionPadding ??
        const EdgeInsets.only(left: 16, right: 8);
    final effectiveBorder = widget.border ??
        theme.toastTheme.border ??
        Border.all(color: theme.colorScheme.border);
    final effectiveBorderRadius =
        widget.radius ?? theme.toastTheme.radius ?? theme.radius;
    final effectiveShadows =
        widget.shadows ?? theme.toastTheme.shadows ?? ShadShadows.lg;
    final effectiveBackgroundColor = widget.backgroundColor ??
        theme.toastTheme.backgroundColor ??
        theme.colorScheme.background;
    final effectivePadding =
        widget.padding ?? theme.toastTheme.padding ?? const EdgeInsets.all(24);
    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        theme.toastTheme.crossAxisAlignment ??
        CrossAxisAlignment.center;
    final effectiveCloseIconPosition = widget.closeIconPosition ??
        theme.toastTheme.closeIconPosition ??
        const ShadPosition(top: 8, right: 8);
    final effectiveShowCloseIconOnlyWhenHovered =
        widget.showCloseIconOnlyWhenHovered ??
            theme.toastTheme.showCloseIconOnlyWhenHovered ??
            true;

    return MouseRegion(
      onEnter: (_) => hovered.value = true,
      onExit: (_) => hovered.value = false,
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
                mainAxisSize: MainAxisSize.min,
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
            Positioned(
              top: effectiveCloseIconPosition.top,
              right: effectiveCloseIconPosition.right,
              bottom: effectiveCloseIconPosition.bottom,
              left: effectiveCloseIconPosition.left,
              child: ValueListenableBuilder(
                valueListenable: hovered,
                builder: (context, hovered, child) {
                  if (!effectiveShowCloseIconOnlyWhenHovered) return child!;
                  return Visibility.maintain(
                    visible: hovered,
                    child: child!,
                  );
                },
                child: effectiveCloseIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
