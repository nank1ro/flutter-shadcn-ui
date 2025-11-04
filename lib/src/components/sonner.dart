import 'dart:async';
import 'dart:math' as math;

import 'package:boxy/boxy.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/sonner.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/animate.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

///
/// Allows descendants to access the toaster state via [ShadSonner.of] or
/// [ShadSonner.maybeOf] for showing and hiding toasts.
class ShadSonnerScope extends InheritedWidget {
  /// Creates a scope widget that holds the [ShadSonnerState] and child.
  const ShadSonnerScope({
    super.key,
    required super.child,
    required this.shadMessengerState,
  });

  /// The [ShadSonnerState] instance managing toast display.
  final ShadSonnerState shadMessengerState;

  @override
  bool updateShouldNotify(ShadSonnerScope oldWidget) =>
      shadMessengerState != oldWidget.shadMessengerState;
}

/// A widget that manages and displays toasts within the widget tree.
///
/// The [ShadSonner] widget acts as a provider for toast notifications,
/// displaying them as overlays on top of its child widget. It uses an
/// [InheritedWidget] to allow descendants to access its state and show toasts
/// via [ShadSonner.of].
class ShadSonner extends StatefulWidget {
  /// Creates a toaster widget that wraps the provided child.
  const ShadSonner({
    super.key,
    required this.child,
    this.visibleToastsAmount,
    this.alignment,
    this.padding,
    this.expandedGap,
    this.collapsedGap,
    this.scaleFactor,
    this.animationDuration,
    this.animationCurve,
  });

  /// The widget below the toaster in the tree, over which toasts are displayed.
  /// Typically the main app content.
  final Widget child;

  /// {@template ShadSonner.visible_toasts_amount}
  /// The maximum number of toasts that can be displayed at once.
  ///
  /// Defaults to 3 if not provided.
  /// {@endtemplate}
  final int? visibleToastsAmount;

  /// {@template ShadSonner.alignment}
  /// The alignment of the toasts within the widget.
  ///
  /// Defaults to [Alignment.bottomRight] if not provided.
  /// {@endtemplate}
  final AlignmentGeometry? alignment;

  /// {@template ShadSonner.padding}
  /// The padding around the toasts.
  ///
  /// Defaults to [EdgeInsets.all(16)] if not provided.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ShadSonner.expandedGap}
  /// The gap between toasts in the expanded state.
  ///
  /// Defaults to 8.0 if not provided.
  /// {@endtemplate}
  final double? expandedGap;

  /// {@template ShadSonner.collapsedGap}
  /// The gap between toasts in the collapsed state.
  ///
  /// Defaults to 16.0 if not provided.
  /// {@endtemplate}
  final double? collapsedGap;

  /// {@template ShadSonner.scaleFactor}
  /// The scale factor for the toasts when they are collapsed.
  /// The scale factor is applied to the width and height of the toasts.
  /// The most recent toast will have no scale factor.
  /// The second toast will be scaled to `0.95` if the `scaleFactor` is `0.05`
  /// (1 - 0.05).
  /// The third toast will be scaled to `0.90` if the `scaleFactor` is `0.05`
  /// (1 - 0.05 * 2).
  ///
  /// Defaults to 0.05 if not provided.
  /// {@endtemplate}
  final double? scaleFactor;

  /// {@template ShadSonner.animationDuration}
  /// The duration of the animation when showing and hiding toasts.
  ///
  /// Defaults to 300 milliseconds if not provided.
  /// {@endtemplate}
  final Duration? animationDuration;

  /// {@template ShadSonner.animationCurve}
  /// The curve used for the animation when showing and hiding toasts.
  ///
  /// Defaults to [Cubic(0.215, 0.61, 0.355, 1)] if not provided.
  /// {@endtemplate}
  final Curve? animationCurve;

  @override
  State<ShadSonner> createState() => ShadSonnerState();

  /// Retrieves the [ShadSonnerState] from the nearest [ShadSonner] ancestor.
  ///
  /// Throws a [FlutterError] if no [ShadSonner] is found in the widget tree.
  static ShadSonnerState of(BuildContext context) {
    final provider = maybeOf(context);
    if (provider == null) {
      throw FlutterError(
        '''Could not find ShadSonner InheritedWidget in the ancestor widget tree.''',
      );
    }
    return provider;
  }

  /// Attempts to retrieve the [ShadSonnerState] from the nearest [ShadSonner]
  /// ancestor.
  ///
  /// Returns null if no [ShadSonner] is found, allowing optional access.
  static ShadSonnerState? maybeOf(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ShadSonnerScope>();
    return scope?.shadMessengerState;
  }
}

class ToastInfo {
  ToastInfo({
    required this.id,
    required this.toast,
    required this.controller,
    this.visible = true,
    this.temporarelyHide = false,
  });

  final Object id;
  final ShadToast toast;
  final AnimationController controller;
  bool visible;
  bool temporarelyHide;
  Timer? timer;
}

class ShadSonnerState extends State<ShadSonner> with TickerProviderStateMixin {
  ShadSonnerTheme get sonnerTheme =>
      ShadTheme.of(context, listen: false).sonnerTheme;

  int get visibleToastsAmount =>
      widget.visibleToastsAmount ?? sonnerTheme.visibleToastsAmount ?? 3;

  final _temporarelyHiddenToasts = <ToastInfo>[];
  final _toasts = <ToastInfo>[];

  Duration get animationDuration =>
      widget.animationDuration ??
      sonnerTheme.animationDuration ??
      const Duration(milliseconds: 300);

  Curve get animationCurve =>
      widget.animationCurve ??
      sonnerTheme.animationCurve ??
      const Cubic(0.215, 0.61, 0.355, 1);

  late final animationController = AnimationController(
    vsync: this,
    duration: animationDuration,
  );
  late final animation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(curve: animationCurve, parent: animationController),
  );

  final hovered = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    hovered.addListener(() {
      if (hovered.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    for (final toast in _toasts) {
      toast.timer?.cancel();
      toast.timer = null;
      toast.controller.dispose();
    }
    hovered.dispose();
    super.dispose();
  }

  /// Shows the provided [ShadToast] and returns an identifier for the toast.

  /// The identifier will match the provided [ShadToast.id] if it is not null,
  /// otherwise it will be a [UniqueKey].
  Object? show(
    ShadToast toast, {
    // Whether to append the toast to the end of the list or insert it at the
    // beginning.
    bool append = true,
  }) {
    final controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    final effectiveId = toast.id ?? UniqueKey();
    final toastInfo = ToastInfo(
      id: effectiveId,
      toast: toast,
      controller: controller,
    );

    final newToastsLength = _toasts.length + 1;
    if (newToastsLength > visibleToastsAmount) {
      hideTemporarely(_toasts.first.id);
    }
    setState(() {
      append ? _toasts.add(toastInfo) : _toasts.insert(0, toastInfo);
    });

    controller.forward();

    final effectiveDuration = toast.duration ?? kDefaultToastDuration;
    toastInfo.timer = Timer(effectiveDuration, () {
      hide(effectiveId);
    });
    return effectiveId;
  }

  /// Hides the toast with the provided [id]entifier.
  Future<void> hide(Object? id) async {
    final toastInfo = _toasts.firstWhereOrNull((toast) => toast.id == id);
    if (toastInfo == null) return;
    setState(() {
      toastInfo.visible = false;
    });
    toastInfo.timer?.cancel();
    toastInfo.timer = null;

    await toastInfo.controller.reverse();
    toastInfo.controller.dispose();
    setState(() {
      _toasts.remove(toastInfo);
      if (_temporarelyHiddenToasts.isNotEmpty &&
          _toasts.length < visibleToastsAmount) {
        final hiddenToast = _temporarelyHiddenToasts.removeLast();
        show(hiddenToast.toast, append: false);
      }
    });
  }

  /// Temporarily hides the toast with the provided [id]entifier.
  ///
  /// The hidden toast will be shown again when there is space for it.
  Future<void> hideTemporarely(Object? id) async {
    final toastInfo = _toasts.firstWhereOrNull((toast) => toast.id == id);
    if (toastInfo == null) return;

    toastInfo.controller.reset();
    await toastInfo.controller.forward();
    setState(() {
      toastInfo.temporarelyHide = true;
      _toasts.remove(toastInfo);
      _temporarelyHiddenToasts.add(toastInfo);
    });
  }

  void onEnter(PointerEnterEvent event) {
    if (hovered.value) return;
    hovered.value = true;
    for (final toast in _toasts) {
      toast.timer?.cancel();
    }
  }

  void onExit(PointerExitEvent event) {
    if (!hovered.value) return;
    hovered.value = false;
    for (final toast in _toasts) {
      final effectiveDuration = toast.toast.duration ?? kDefaultToastDuration;
      toast.timer = Timer(effectiveDuration, () {
        hide(toast.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveAlignment =
        widget.alignment ??
        theme.sonnerTheme.alignment ??
        Alignment.bottomRight;

    final effectivePadding =
        widget.padding ?? theme.sonnerTheme.padding ?? const EdgeInsets.all(16);

    final effectiveExpandedGap =
        widget.expandedGap ?? theme.sonnerTheme.expandedGap ?? 8.0;

    final effectiveCollapsedGap =
        widget.collapsedGap ?? theme.sonnerTheme.collapsedGap ?? 16.0;

    final effectiveScaleFactor =
        widget.scaleFactor ?? theme.sonnerTheme.scaleFactor ?? 0.05;

    return ShadSonnerScope(
      shadMessengerState: this,
      child: ShadTheme(
        data: theme.copyWith(
          primaryToastTheme: theme.primaryToastTheme.copyWith(
            closeIcon: const SizedBox.shrink(),
            padding: const EdgeInsets.all(16),
            titleStyle: theme.primaryToastTheme.titleStyle?.copyWith(
              fontSize: 13,
            ),
            descriptionStyle: theme.primaryToastTheme.descriptionStyle
                ?.copyWith(
                  fontSize: 13,
                ),
          ),
          destructiveToastTheme: theme.destructiveToastTheme.copyWith(
            closeIcon: const SizedBox.shrink(),
            padding: const EdgeInsets.all(16),
            titleStyle: theme.destructiveToastTheme.titleStyle?.copyWith(
              fontSize: 13,
            ),
            descriptionStyle: theme.destructiveToastTheme.descriptionStyle
                ?.copyWith(
                  fontSize: 13,
                ),
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: hovered,
          builder: (context, isHovered, child) {
            return Stack(
              alignment: effectiveAlignment,
              children: [
                widget.child,
                ShadResponsiveBuilder(
                  builder: (context, breakpoint) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: breakpoint >= theme.breakpoints.md
                            ? 0
                            : double.infinity,
                        maxWidth: breakpoint >= theme.breakpoints.md
                            ? 420
                            : double.infinity,
                      ),
                      child: ShadMouseArea(
                        onEnter: onEnter,
                        onExit: onExit,
                        child: Padding(
                          padding: effectivePadding,
                          // This ColoredBox keeps the hover working even for
                          // the empty spaces
                          child: ColoredBox(
                            color: const Color(0x00000000),
                            child: CustomBoxy(
                              delegate: SonnerBoxy(
                                animation: animation,
                                collapsedGap: effectiveCollapsedGap,
                                expandedGap: effectiveExpandedGap,
                              ),
                              children: _toasts.mapIndexed((index, toastInfo) {
                                final x =
                                    effectiveScaleFactor *
                                    (_toasts.length - 1 - index);
                                final scaleX = 1.0 - x;
                                final toast = toastInfo.toast;

                                final effectiveToastTheme =
                                    switch (toast.variant) {
                                      ShadToastVariant.primary =>
                                        theme.primaryToastTheme,
                                      ShadToastVariant.destructive =>
                                        theme.destructiveToastTheme,
                                    };

                                final effectiveToastAlignment =
                                    toast.alignment ??
                                    effectiveToastTheme.alignment ??
                                    Alignment.bottomRight;
                                // ignore: omit_local_variable_types
                                final List<Effect<dynamic>> defaultAnimateIn =
                                    switch (effectiveToastAlignment) {
                                      Alignment.bottomRight ||
                                      Alignment.bottomLeft ||
                                      Alignment.bottomCenter => [
                                        const FadeEffect(),
                                        const SlideEffect(
                                          begin: Offset(0, 1),
                                          end: Offset.zero,
                                        ),
                                      ],
                                      Alignment.topRight ||
                                      Alignment.topLeft ||
                                      Alignment.topCenter => [
                                        const FadeEffect(),
                                        const SlideEffect(
                                          begin: Offset(0, -1),
                                          end: Offset.zero,
                                        ),
                                      ],
                                      Alignment.centerRight ||
                                      Alignment.topRight ||
                                      Alignment.bottomRight => [
                                        const FadeEffect(),
                                        const SlideEffect(
                                          begin: Offset(1, 0),
                                          end: Offset.zero,
                                        ),
                                      ],
                                      Alignment.centerLeft ||
                                      Alignment.topLeft ||
                                      Alignment.bottomLeft => [
                                        const FadeEffect(),
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
                                    switch (effectiveToastAlignment) {
                                      Alignment.bottomRight ||
                                      Alignment.topRight ||
                                      Alignment.centerRight => const [
                                        SlideEffect(
                                          begin: Offset.zero,
                                          end: Offset(0, -0.10),
                                        ),
                                        FadeEffect(
                                          begin: 1,
                                          end: 0,
                                        ),
                                      ],
                                      Alignment.topLeft ||
                                      Alignment.centerLeft ||
                                      Alignment.bottomLeft => const [
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

                                final effectiveAnimateIn =
                                    toast.animateIn ??
                                    effectiveToastTheme.animateIn ??
                                    defaultAnimateIn;
                                final effectiveAnimateOut =
                                    toast.animateOut ??
                                    effectiveToastTheme.animateOut ??
                                    defaultAnimateOut;

                                return ShadAnimate(
                                  autoPlay: false,
                                  controller: animationController,
                                  effects: [
                                    ScaleEffect(
                                      begin: Offset(scaleX, scaleX),
                                      end: const Offset(1, 1),
                                    ),
                                  ],
                                  child: ShadAnimate(
                                    autoPlay: false,
                                    controller: toastInfo.controller,
                                    effects: toastInfo.temporarelyHide
                                        ? effectiveAnimateOut
                                        : effectiveAnimateIn,
                                    child: toast,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Renders the layout of the toasts, stacking them when animation is at 0, and
/// arranging them like in a column when animation is at 1.
///
/// The [collapsedGap] is the gap between toasts when they are stacked, and the
/// [expandedGap] is the gap between toasts when they expanded.
class SonnerBoxy extends BoxyDelegate {
  SonnerBoxy({
    required this.animation,
    this.collapsedGap = 16,
    this.expandedGap = 8,
  }) : super(relayout: animation);

  final Animation<double> animation;
  // Gap between toasts in expanded state
  final double expandedGap;
  // Gap between toasts in collapsed state
  final double collapsedGap;

  @override
  Size layout() {
    if (children.isEmpty) return Size.zero;

    // Step 1: Calculate the intrinsic sizes of all children
    final widths = <double>[];
    final heights = <double>[];
    for (final child in children) {
      final width = child.render.getMaxIntrinsicWidth(double.infinity);
      widths.add(width);
      final height = child.render.getMaxIntrinsicHeight(width);
      heights.add(height);
      child.layout(constraints);
    }

    // Step 2: Determine the max width of the layout
    final maxWidth = math.max(
      widths.reduce(math.max),
      constraints.maxWidth,
    );

    final totalHeightExpanded =
        heights.fold<double>(0, (a, b) => a + b) +
        expandedGap * (heights.length - 1);
    // Calculate collapsed height (when all toasts are stacked)
    final totalHeightCollapsed =
        heights.last + (heights.length - 1) * collapsedGap;

    // Interpolate between collapsed and expanded height based on animation
    final currentHeight =
        totalHeightCollapsed +
        (totalHeightExpanded - totalHeightCollapsed) * animation.value;

    // Step 3: Position the children based on the animation value
    final numChildren = children.length;

    for (final (i, child) in children.indexed) {
      double targetY;

      if (i == numChildren - 1) {
        targetY = currentHeight - heights.last;
      } else {
        final expandedY =
            heights.sublist(0, i).fold<double>(0, (a, b) => a + b) +
            expandedGap * i;
        final collapsedY =
            currentHeight - heights.last - (numChildren - 1 - i) * collapsedGap;
        targetY = collapsedY + (expandedY - collapsedY) * animation.value;
      }
      targetY = math.max(0, targetY);
      child.position(Offset(0, targetY));
    }

    // Step 4: Return the total size of the layout
    return Size(maxWidth, currentHeight);
  }
}
