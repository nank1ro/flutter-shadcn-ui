import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:motor/motor.dart';
import 'package:shadcn_ui/src/components/toast.dart';
import 'package:shadcn_ui/src/theme/components/sonner.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';
import 'package:shadcn_ui/src/utils/responsive.dart';

/// Allows descendants to access the toaster state via [ShadSonnerNew.of] or
/// [ShadSonnerNew.maybeOf] for showing and hiding toasts.
class ShadSonnerNewScope extends InheritedWidget {
  /// Creates a scope widget that holds the [ShadSonnerNewState] and child.
  const ShadSonnerNewScope({
    super.key,
    required super.child,
    required this.shadMessengerState,
  });

  /// The [ShadSonnerNewState] instance managing toast display.
  final ShadSonnerNewState shadMessengerState;

  @override
  bool updateShouldNotify(ShadSonnerNewScope oldWidget) =>
      shadMessengerState != oldWidget.shadMessengerState;
}

/// A widget that manages and displays toasts using physics-based animations.
///
/// This is a new implementation of ShadSonner that uses the `motor` package
/// for spring-based, interruptible animations inspired by the original
/// Sonner library by Emil Kowalski.
///
/// Key features:
/// - Interruptible spring animations that smoothly retarget mid-flight
/// - Stacking with depth (scale and translate transforms)
/// - Height normalization in collapsed mode
/// - Hover expansion to show all toasts
/// - Swipe-to-dismiss with momentum-based velocity detection
class ShadSonnerNew extends StatefulWidget {
  /// Creates a toaster widget that wraps the provided child.
  const ShadSonnerNew({
    super.key,
    required this.child,
    this.visibleToastsAmount,
    this.alignment,
    this.padding,
    this.expandedGap,
    this.collapsedGap,
    this.scaleFactor,
    this.entryMotion,
    this.exitMotion,
    this.stackMotion,
    this.hoverMotion,
    this.swipeThreshold,
    this.swipeVelocityThreshold,
    this.enableSwipeToDismiss,
  });

  /// The widget below the toaster in the tree, over which toasts are displayed.
  /// Typically the main app content.
  final Widget child;

  /// {@macro ShadSonner.visible_toasts_amount}
  final int? visibleToastsAmount;

  /// {@macro ShadSonner.alignment}
  final AlignmentGeometry? alignment;

  /// {@macro ShadSonner.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro ShadSonner.expandedGap}
  final double? expandedGap;

  /// {@macro ShadSonner.collapsedGap}
  final double? collapsedGap;

  /// {@macro ShadSonner.scaleFactor}
  final double? scaleFactor;

  /// The spring motion used for toast entry animations.
  /// Defaults to [Motion.snappySpring].
  final Motion? entryMotion;

  /// The spring motion used for toast exit animations.
  /// Defaults to [Motion.snappySpring].
  final Motion? exitMotion;

  /// The spring motion used for stack rearrangement.
  /// Defaults to [Motion.snappySpring].
  final Motion? stackMotion;

  /// The spring motion used for hover expansion.
  /// Defaults to [Motion.bouncySpring].
  final Motion? hoverMotion;

  /// The distance in pixels a toast must be swiped to dismiss.
  /// Defaults to 100.0.
  final double? swipeThreshold;

  /// The velocity threshold for a quick swipe to dismiss.
  /// Defaults to 0.11 (matching original Sonner).
  final double? swipeVelocityThreshold;

  /// Whether swipe-to-dismiss is enabled.
  /// Defaults to true.
  final bool? enableSwipeToDismiss;

  @override
  State<ShadSonnerNew> createState() => ShadSonnerNewState();

  /// Retrieves the [ShadSonnerNewState] from the nearest [ShadSonnerNew]
  /// ancestor.
  ///
  /// Throws a [FlutterError] if no [ShadSonnerNew] is found in the widget tree.
  static ShadSonnerNewState of(BuildContext context) {
    final provider = maybeOf(context);
    if (provider == null) {
      throw FlutterError(
        '''Could not find ShadSonnerNew InheritedWidget in the ancestor widget tree.''',
      );
    }
    return provider;
  }

  /// Attempts to retrieve the [ShadSonnerNewState] from the nearest
  /// [ShadSonnerNew] ancestor.
  ///
  /// Returns null if no [ShadSonnerNew] is found, allowing optional access.
  static ShadSonnerNewState? maybeOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<ShadSonnerNewScope>();
    return scope?.shadMessengerState;
  }
}

/// Information about a toast being displayed, including animation state.
class ToastInfoNew {
  ToastInfoNew({
    required this.id,
    required this.toast,
    this.visible = true,
    this.mounted = false,
    this.temporarilyHidden = false,
    this.isExiting = false,
  });

  final Object id;
  final ShadToast toast;

  /// Whether the toast is currently visible (not being dismissed).
  bool visible;

  /// Whether the toast has been mounted (triggers entry animation).
  bool mounted;

  /// Whether the toast is temporarily hidden due to stack overflow.
  bool temporarilyHidden;

  /// Whether the toast is in the process of exiting.
  bool isExiting;

  /// Timer for auto-dismiss.
  Timer? timer;

  /// Current swipe offset during drag gesture.
  double swipeOffset = 0;

  /// Start time of swipe gesture for velocity calculation.
  DateTime? swipeStartTime;
}

class ShadSonnerNewState extends State<ShadSonnerNew>
    with WidgetsBindingObserver {
  ShadSonnerTheme get sonnerTheme =>
      ShadTheme.of(context, listen: false).sonnerTheme;

  int get visibleToastsAmount =>
      widget.visibleToastsAmount ?? sonnerTheme.visibleToastsAmount ?? 3;

  final _temporarilyHiddenToasts = <ToastInfoNew>[];
  final _toasts = <ToastInfoNew>[];

  Motion get entryMotion => widget.entryMotion ?? const Motion.snappySpring();
  Motion get exitMotion => widget.exitMotion ?? const Motion.snappySpring();
  Motion get stackMotion => widget.stackMotion ?? const Motion.snappySpring();
  Motion get hoverMotion => widget.hoverMotion ?? const Motion.bouncySpring();

  double get swipeThreshold => widget.swipeThreshold ?? 100.0;
  double get swipeVelocityThreshold => widget.swipeVelocityThreshold ?? 0.11;
  bool get enableSwipeToDismiss => widget.enableSwipeToDismiss ?? true;

  final hovered = ValueNotifier(false);

  bool _isAppVisible = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (final toast in _toasts) {
      toast.timer?.cancel();
      toast.timer = null;
    }
    hovered.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final wasVisible = _isAppVisible;
    _isAppVisible = state == AppLifecycleState.resumed;

    if (!wasVisible && _isAppVisible) {
      // App became visible, restart timers
      for (final toast in _toasts) {
        if (toast.timer == null && toast.visible && !toast.isExiting) {
          final effectiveDuration =
              toast.toast.duration ?? kDefaultToastDuration;
          toast.timer = Timer(effectiveDuration, () => hide(toast.id));
        }
      }
    } else if (wasVisible && !_isAppVisible) {
      // App became hidden, pause timers
      for (final toast in _toasts) {
        toast.timer?.cancel();
        toast.timer = null;
      }
    }
  }

  /// Shows the provided [ShadToast] and returns an identifier for the toast.
  ///
  /// The identifier will match the provided [ShadToast.id] if it is not null,
  /// otherwise it will be a [UniqueKey].
  Object? show(
    ShadToast toast, {
    bool append = true,
  }) {
    final effectiveId = toast.id ?? UniqueKey();
    final toastInfo = ToastInfoNew(
      id: effectiveId,
      toast: toast,
    );

    final newToastsLength = _toasts.length + 1;
    if (newToastsLength > visibleToastsAmount) {
      hideTemporarily(_toasts.first.id);
    }

    setState(() {
      append ? _toasts.add(toastInfo) : _toasts.insert(0, toastInfo);
    });

    // Trigger mount after frame to start entry animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          toastInfo.mounted = true;
        });
      }
    });

    // Only start timer if not currently hovered
    if (!hovered.value) {
      final effectiveDuration = toast.duration ?? kDefaultToastDuration;
      toastInfo.timer = Timer(effectiveDuration, () {
        hide(effectiveId);
      });
    }

    return effectiveId;
  }

  /// Hides the toast with the provided [id]entifier.
  Future<void> hide(Object? id) async {
    // Check visible toasts first
    var toastInfo = _toasts.firstWhereOrNull((toast) => toast.id == id);

    // Also check temporarily hidden toasts (timer may fire while hidden)
    if (toastInfo == null) {
      toastInfo = _temporarilyHiddenToasts.firstWhereOrNull(
        (toast) => toast.id == id,
      );
      if (toastInfo != null) {
        // Remove from hidden queue - don't animate, just remove
        toastInfo.timer?.cancel();
        toastInfo.timer = null;
        setState(() {
          _temporarilyHiddenToasts.remove(toastInfo);
        });
        return;
      }
    }

    if (toastInfo == null || toastInfo.isExiting) return;

    toastInfo.timer?.cancel();
    toastInfo.timer = null;

    setState(() {
      toastInfo!.visible = false;
      toastInfo.isExiting = true;
    });

    // Wait for exit animation to complete
    // Spring animations typically settle in ~300-500ms
    await Future<void>.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;

    setState(() {
      _toasts.remove(toastInfo);
      if (_temporarilyHiddenToasts.isNotEmpty &&
          _toasts.length < visibleToastsAmount) {
        final hiddenToast = _temporarilyHiddenToasts.removeLast();
        show(hiddenToast.toast, append: false);
      }
    });
  }

  /// Temporarily hides the toast with the provided [id]entifier.
  ///
  /// The hidden toast will be shown again when there is space for it.
  /// Note: Timer keeps running while hidden (matching original Sonner behavior)
  /// so the toast's total lifetime is preserved.
  Future<void> hideTemporarily(Object? id) async {
    final toastInfo = _toasts.firstWhereOrNull((toast) => toast.id == id);
    if (toastInfo == null) return;

    setState(() {
      toastInfo.temporarilyHidden = true;
      _toasts.remove(toastInfo);
      _temporarilyHiddenToasts.add(toastInfo);
    });
  }

  void onEnter(PointerEnterEvent event) {
    if (hovered.value) return;
    hovered.value = true;
    for (final toast in _toasts) {
      toast.timer?.cancel();
      toast.timer = null;
    }
  }

  void onExit(PointerExitEvent event) {
    if (!hovered.value) return;
    hovered.value = false;
    // Restart timers for all visible toasts (matching original Sonner)
    for (final toast in _toasts) {
      final effectiveDuration = toast.toast.duration ?? kDefaultToastDuration;
      toast.timer = Timer(effectiveDuration, () {
        hide(toast.id);
      });
    }
  }

  /// Programmatically sets the expanded (hovered) state.
  /// Useful for testing and automation.
  void setExpanded(bool expanded) {
    if (expanded) {
      if (hovered.value) return;
      hovered.value = true;
      // Pause all timers while expanded
      for (final toast in _toasts) {
        toast.timer?.cancel();
        toast.timer = null;
      }
    } else {
      if (!hovered.value) return;
      hovered.value = false;
      // Restart timers
      for (final toast in _toasts) {
        final effectiveDuration = toast.toast.duration ?? kDefaultToastDuration;
        toast.timer = Timer(effectiveDuration, () {
          hide(toast.id);
        });
      }
    }
  }

  /// Handles swipe gesture start.
  void _onSwipeStart(ToastInfoNew toastInfo) {
    toastInfo.swipeStartTime = DateTime.now();
    toastInfo.timer?.cancel();
    toastInfo.timer = null;
  }

  /// Handles swipe gesture update.
  void _onSwipeUpdate(ToastInfoNew toastInfo, double delta, bool isTopAligned) {
    setState(() {
      final newOffset = toastInfo.swipeOffset + delta;

      // Apply friction for swipes in the "wrong" direction
      if (isTopAligned) {
        // Top-aligned toasts should swipe up (negative)
        if (newOffset > 0) {
          // Swiping down - apply friction
          toastInfo.swipeOffset = math.log(1 + newOffset.abs()) * 10;
        } else {
          toastInfo.swipeOffset = newOffset;
        }
      } else {
        // Bottom-aligned toasts should swipe down (positive)
        if (newOffset < 0) {
          // Swiping up - apply friction
          toastInfo.swipeOffset = -math.log(1 + newOffset.abs()) * 10;
        } else {
          toastInfo.swipeOffset = newOffset;
        }
      }
    });
  }

  /// Handles swipe gesture end.
  void _onSwipeEnd(ToastInfoNew toastInfo, bool isTopAligned) {
    final swipeAmount = toastInfo.swipeOffset.abs();
    final timeTaken = DateTime.now()
        .difference(toastInfo.swipeStartTime ?? DateTime.now())
        .inMilliseconds;
    final velocity = timeTaken > 0 ? swipeAmount / timeTaken : 0.0;

    // Check if swipe should dismiss
    final shouldDismiss =
        swipeAmount >= swipeThreshold || velocity > swipeVelocityThreshold;

    // Check if swipe was in correct direction
    final correctDirection = isTopAligned
        ? toastInfo.swipeOffset <
              0 // Swiping up for top-aligned
        : toastInfo.swipeOffset > 0; // Swiping down for bottom-aligned

    if (shouldDismiss && correctDirection) {
      hide(toastInfo.id);
    } else {
      // Reset swipe offset with animation
      setState(() {
        toastInfo.swipeOffset = 0.0;
      });
      // Restart timer
      if (toastInfo.visible && !toastInfo.isExiting) {
        final effectiveDuration =
            toastInfo.toast.duration ?? kDefaultToastDuration;
        toastInfo.timer = Timer(effectiveDuration, () {
          hide(toastInfo.id);
        });
      }
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

    // Determine if alignment is top-based
    final isTopAligned =
        effectiveAlignment == Alignment.topLeft ||
        effectiveAlignment == Alignment.topCenter ||
        effectiveAlignment == Alignment.topRight;

    return ShadSonnerNewScope(
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
                          child: ColoredBox(
                            color: const Color(0x00000000),
                            child: _SonnerStack(
                              toasts: _toasts,
                              isExpanded: isHovered,
                              collapsedGap: effectiveCollapsedGap,
                              expandedGap: effectiveExpandedGap,
                              scaleFactor: effectiveScaleFactor,
                              hoverMotion: hoverMotion,
                              entryMotion: entryMotion,
                              exitMotion: exitMotion,
                              stackMotion: stackMotion,
                              isTopAligned: isTopAligned,
                              enableSwipeToDismiss: enableSwipeToDismiss,
                              onSwipeStart: _onSwipeStart,
                              onSwipeUpdate: (toastInfo, delta) =>
                                  _onSwipeUpdate(
                                    toastInfo,
                                    delta,
                                    isTopAligned,
                                  ),
                              onSwipeEnd: (toastInfo) =>
                                  _onSwipeEnd(toastInfo, isTopAligned),
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

/// A stack that animates toast positions using Motor springs.
class _SonnerStack extends StatelessWidget {
  const _SonnerStack({
    required this.toasts,
    required this.isExpanded,
    required this.collapsedGap,
    required this.expandedGap,
    required this.scaleFactor,
    required this.hoverMotion,
    required this.entryMotion,
    required this.exitMotion,
    required this.stackMotion,
    required this.isTopAligned,
    required this.enableSwipeToDismiss,
    required this.onSwipeStart,
    required this.onSwipeUpdate,
    required this.onSwipeEnd,
  });

  final List<ToastInfoNew> toasts;
  final bool isExpanded;
  final double collapsedGap;
  final double expandedGap;
  final double scaleFactor;
  final Motion hoverMotion;
  final Motion entryMotion;
  final Motion exitMotion;
  final Motion stackMotion;
  final bool isTopAligned;
  final bool enableSwipeToDismiss;
  final void Function(ToastInfoNew) onSwipeStart;
  final void Function(ToastInfoNew, double) onSwipeUpdate;
  final void Function(ToastInfoNew) onSwipeEnd;

  @override
  Widget build(BuildContext context) {
    if (toasts.isEmpty) return const SizedBox.shrink();

    return _MeasuredToastStack(
      toasts: toasts,
      isExpanded: isExpanded,
      collapsedGap: collapsedGap,
      expandedGap: expandedGap,
      scaleFactor: scaleFactor,
      hoverMotion: hoverMotion,
      entryMotion: entryMotion,
      exitMotion: exitMotion,
      stackMotion: stackMotion,
      isTopAligned: isTopAligned,
      enableSwipeToDismiss: enableSwipeToDismiss,
      onSwipeStart: onSwipeStart,
      onSwipeUpdate: onSwipeUpdate,
      onSwipeEnd: onSwipeEnd,
    );
  }
}

/// A stack that measures toast heights and animates positions.
class _MeasuredToastStack extends StatefulWidget {
  const _MeasuredToastStack({
    required this.toasts,
    required this.isExpanded,
    required this.collapsedGap,
    required this.expandedGap,
    required this.scaleFactor,
    required this.hoverMotion,
    required this.entryMotion,
    required this.exitMotion,
    required this.stackMotion,
    required this.isTopAligned,
    required this.enableSwipeToDismiss,
    required this.onSwipeStart,
    required this.onSwipeUpdate,
    required this.onSwipeEnd,
  });

  final List<ToastInfoNew> toasts;
  final bool isExpanded;
  final double collapsedGap;
  final double expandedGap;
  final double scaleFactor;
  final Motion hoverMotion;
  final Motion entryMotion;
  final Motion exitMotion;
  final Motion stackMotion;
  final bool isTopAligned;
  final bool enableSwipeToDismiss;
  final void Function(ToastInfoNew) onSwipeStart;
  final void Function(ToastInfoNew, double) onSwipeUpdate;
  final void Function(ToastInfoNew) onSwipeEnd;

  @override
  State<_MeasuredToastStack> createState() => _MeasuredToastStackState();
}

class _MeasuredToastStackState extends State<_MeasuredToastStack> {
  // Cache measured heights by toast ID
  final Map<Object, double> _measuredHeights = {};

  // Default height for toasts that haven't been measured yet
  static const double _defaultHeight = 72.0;

  double _getHeight(Object id) => _measuredHeights[id] ?? _defaultHeight;

  void _onHeightMeasured(Object id, double height) {
    if (_measuredHeights[id] != height) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _measuredHeights[id] = height;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.toasts.isEmpty) return const SizedBox.shrink();

    final numToasts = widget.toasts.length;

    final frontToastId = widget.toasts.last.id;
    final frontToastHeight = _getHeight(frontToastId);

    final collapsedHeight =
        frontToastHeight + (numToasts - 1) * widget.collapsedGap;

    var expandedHeight = 0.0;
    for (final toast in widget.toasts) {
      expandedHeight += _getHeight(toast.id);
    }
    expandedHeight += (numToasts - 1) * widget.expandedGap;

    return SingleMotionBuilder(
      motion: widget.hoverMotion,
      value: widget.isExpanded ? expandedHeight : collapsedHeight,
      builder: (context, containerHeight, _) {
        return SizedBox(
          height: containerHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: widget.toasts.mapIndexed((index, toastInfo) {
              final positionedIndex = numToasts - 1 - index;
              final isFrontToast = index == numToasts - 1;

              final toastHeight = _getHeight(toastInfo.id);

              double expandedY;
              double collapsedY;

              if (isFrontToast) {
                // Front toast always at bottom (y=0)
                expandedY = 0;
                collapsedY = 0;
              } else {
                // Calculate expanded Y: sum of heights of toasts AFTER this one
                // (those closer to front/bottom)
                expandedY = 0;
                for (var i = index + 1; i < numToasts; i++) {
                  expandedY +=
                      _getHeight(widget.toasts[i].id) + widget.expandedGap;
                }
                // Collapsed Y: just gaps stacking up
                collapsedY = (numToasts - 1 - index) * widget.collapsedGap;
              }

              const expandedScale = 1.0;
              final collapsedScale =
                  1.0 - (positionedIndex * widget.scaleFactor);

              final normalizedHeight = isFrontToast
                  ? toastHeight
                  : (widget.isExpanded ? toastHeight : frontToastHeight);

              return _PositionedToast(
                key: ValueKey(toastInfo.id),
                toastInfo: toastInfo,
                targetY: widget.isExpanded ? expandedY : collapsedY,
                targetScale: widget.isExpanded ? expandedScale : collapsedScale,
                normalizedHeight: normalizedHeight,
                isFrontToast: isFrontToast,
                hoverMotion: widget.hoverMotion,
                entryMotion: widget.entryMotion,
                exitMotion: widget.exitMotion,
                stackMotion: widget.stackMotion,
                isTopAligned: widget.isTopAligned,
                enableSwipeToDismiss: widget.enableSwipeToDismiss,
                onSwipeStart: () => widget.onSwipeStart(toastInfo),
                onSwipeUpdate: (delta) =>
                    widget.onSwipeUpdate(toastInfo, delta),
                onSwipeEnd: () => widget.onSwipeEnd(toastInfo),
                onHeightMeasured: (height) =>
                    _onHeightMeasured(toastInfo.id, height),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

/// A positioned toast that animates its Y position and scale using Motor.
/// Optimized to use fewer nested MotionBuilders for better performance.
class _PositionedToast extends StatelessWidget {
  const _PositionedToast({
    super.key,
    required this.toastInfo,
    required this.targetY,
    required this.targetScale,
    required this.normalizedHeight,
    required this.isFrontToast,
    required this.hoverMotion,
    required this.entryMotion,
    required this.exitMotion,
    required this.stackMotion,
    required this.isTopAligned,
    required this.enableSwipeToDismiss,
    required this.onSwipeStart,
    required this.onSwipeUpdate,
    required this.onSwipeEnd,
    required this.onHeightMeasured,
  });

  final ToastInfoNew toastInfo;
  final double targetY;
  final double targetScale;
  final double normalizedHeight;
  final bool isFrontToast;
  final Motion hoverMotion;
  final Motion entryMotion;
  final Motion exitMotion;
  final Motion stackMotion;
  final bool isTopAligned;
  final bool enableSwipeToDismiss;
  final VoidCallback onSwipeStart;
  final void Function(double delta) onSwipeUpdate;
  final VoidCallback onSwipeEnd;
  final void Function(double height) onHeightMeasured;

  @override
  Widget build(BuildContext context) {
    final targetOpacity = toastInfo.visible && toastInfo.mounted ? 1.0 : 0.0;

    final entrySlideOffset = !toastInfo.mounted
        ? (isTopAligned ? -1.0 : 1.0)
        : 0.0;
    final exitSlideOffset = !toastInfo.visible
        ? (isTopAligned ? -0.5 : 0.5)
        : 0.0;
    final targetSlideOffset = entrySlideOffset + exitSlideOffset;

    final toast = toastInfo.toast;

    return MotionBuilder<Rect>(
      motion: hoverMotion,
      value: Rect.fromLTRB(targetY, targetScale, normalizedHeight, 0),
      converter: MotionConverter.rect,
      builder: (context, animatedRect, _) {
        final animatedY = animatedRect.left;
        final animatedScale = animatedRect.top;
        final animatedHeight = animatedRect.right;

        return MotionBuilder<Offset>(
          motion: toastInfo.mounted ? exitMotion : entryMotion,
          value: Offset(targetOpacity, targetSlideOffset),
          converter: MotionConverter.offset,
          builder: (context, animatedOpacitySlide, _) {
            final opacity = animatedOpacitySlide.dx;
            final slideOffset = animatedOpacitySlide.dy;

            return SingleMotionBuilder(
              motion: stackMotion,
              value: toastInfo.swipeOffset,
              builder: (context, swipeOffset, _) {
                Widget child = ClipRect(
                  child: SizedBox(
                    height: animatedHeight,
                    child: OverflowBox(
                      alignment: isFrontToast
                          ? AlignmentDirectional.topStart
                          : (isTopAligned
                                ? AlignmentDirectional.bottomStart
                                : AlignmentDirectional.topStart),
                      maxHeight: double.infinity,
                      child: _HeightMeasurer(
                        onHeightMeasured: onHeightMeasured,
                        child: toast,
                      ),
                    ),
                  ),
                );

                child = FractionalTranslation(
                  translation: Offset(0, slideOffset),
                  child: Opacity(
                    opacity: opacity.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: animatedScale,
                      alignment: isTopAligned
                          ? Alignment.topCenter
                          : Alignment.bottomCenter,
                      child: child,
                    ),
                  ),
                );

                if (enableSwipeToDismiss) {
                  child = GestureDetector(
                    onVerticalDragStart: (_) => onSwipeStart(),
                    onVerticalDragUpdate: (details) =>
                        onSwipeUpdate(details.delta.dy),
                    onVerticalDragEnd: (_) => onSwipeEnd(),
                    child: child,
                  );
                }

                return Positioned(
                  top: isTopAligned ? animatedY + swipeOffset : null,
                  bottom: isTopAligned ? null : animatedY - swipeOffset,
                  left: 0,
                  right: 0,
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }
}

/// A widget that measures its child's height after layout (once).
class _HeightMeasurer extends StatefulWidget {
  const _HeightMeasurer({
    required this.child,
    required this.onHeightMeasured,
  });

  final Widget child;
  final void Function(double height) onHeightMeasured;

  @override
  State<_HeightMeasurer> createState() => _HeightMeasurerState();
}

class _HeightMeasurerState extends State<_HeightMeasurer> {
  bool _hasMeasured = false;

  @override
  void initState() {
    super.initState();
    _scheduleMeasurement();
  }

  void _scheduleMeasurement() {
    if (_hasMeasured) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _hasMeasured) return;
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null && renderBox.hasSize) {
        _hasMeasured = true;
        widget.onHeightMeasured(renderBox.size.height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
