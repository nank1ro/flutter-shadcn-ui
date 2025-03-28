import 'dart:async';
import 'dart:math' as math;

import 'package:boxy/boxy.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    this.visibleToastsAmount,
    required this.child,
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
  });

  final Object id;
  final ShadToast toast;
  final AnimationController controller;
  Timer? timer;
}

class ShadSonnerState extends State<ShadSonner> with TickerProviderStateMixin {
  int get visibleToastsAmount => widget.visibleToastsAmount ?? 3;

  final List<ToastInfo> _toasts = [];
  static const Duration _animationDuration = Duration(milliseconds: 300);

  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final animation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(curve: Curves.ease, parent: animationController),
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
  Object? show(ShadToast toast) {
    final controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    final effectiveId = toast.id ?? UniqueKey();
    final toastInfo = ToastInfo(
      id: effectiveId,
      toast: toast,
      controller: controller,
    );
    setState(() {
      _toasts.add(toastInfo);
      if (_toasts.length > visibleToastsAmount) {
        _toasts.removeAt(0);
      }
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
    if (!mounted) return;
    final containsId = _toasts.any((toast) => toast.id == id);
    if (!containsId) return;
    final toastInfo = _toasts.firstWhere((toast) => toast.id == id);
    toastInfo.timer?.cancel();
    await toastInfo.controller.reverse();
    if (mounted) {
      setState(() {
        _toasts.remove(toastInfo);
      });
      toastInfo.controller.dispose();
    }
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
            descriptionStyle:
                theme.primaryToastTheme.descriptionStyle?.copyWith(
              fontSize: 13,
            ),
          ),
          destructiveToastTheme: theme.destructiveToastTheme.copyWith(
            closeIcon: const SizedBox.shrink(),
            padding: const EdgeInsets.all(16),
            titleStyle: theme.destructiveToastTheme.titleStyle?.copyWith(
              fontSize: 13,
            ),
            descriptionStyle:
                theme.destructiveToastTheme.descriptionStyle?.copyWith(
              fontSize: 13,
            ),
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: hovered,
          builder: (context, isHovered, child) {
            return Stack(
              alignment: Alignment.bottomRight,
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
                        // This ColoredBox keeps the hover working even for the
                        // empty spaces
                        child: ColoredBox(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Placeholder(
                              child: CustomBoxy(
                                delegate: SonnerBoxy(
                                  animation: animationController,
                                ),
                                children:
                                    _toasts.mapIndexed((index, toastInfo) {
                                  // Calculate the intermediate value: 0 for last index, 0.1 for second-to-last, etc.
                                  final x = 0.05 * (_toasts.length - 1 - index);
                                  // Final scaleX is 1.0 minus the intermediate value
                                  final scaleX = 1.0 - x;
                                  return Animate(
                                    autoPlay: false,
                                    controller: animationController,
                                    effects: [
                                      ScaleEffect(
                                        begin: Offset(scaleX, 1),
                                        end: const Offset(1, 1),
                                      ),
                                    ],
                                    child: toastInfo.toast,
                                  );
                                }).toList(),
                              ),
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

class SonnerBoxy extends BoxyDelegate {
  SonnerBoxy({
    required this.animation,
  }) : super(relayout: animation);

  final Animation<double> animation;
  static const double gap = 8; // Gap between toasts in expanded state
  static const double collapseOffset =
      16; // Offset between toasts in collapsed state

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

    // Step 2: Determine the total size of the layout
    final maxWidth = math.max(
      widths.reduce(math.max),
      constraints.maxWidth,
    );

    final totalHeightExpanded =
        heights.fold<double>(0, (a, b) => a + b) + gap * (heights.length - 1);
    // Calculate collapsed height (when all toasts are stacked)
    final totalHeightCollapsed =
        heights.last + (heights.length - 1) * collapseOffset;

    // Interpolate between collapsed and expanded height based on animation
    final currentHeight = totalHeightCollapsed +
        (totalHeightExpanded - totalHeightCollapsed) * animation.value;

    // Step 3: Position the children based on the animation value
    final numChildren = children.length;

    for (final (i, child) in children.indexed) {
      double targetY;

      if (i == numChildren - 1) {
        targetY = currentHeight - heights.last;
      } else {
        final expandedY =
            heights.sublist(0, i).fold<double>(0, (a, b) => a + b) + gap * i;
        final collapsedY = currentHeight -
            heights.last -
            (numChildren - 1 - i) * collapseOffset;
        targetY = collapsedY + (expandedY - collapsedY) * animation.value;
      }
      targetY = math.max(0, targetY);
      child.position(Offset(0, targetY));
    }

    // Step 4: Return the total size of the layout
    return Size(maxWidth, currentHeight);
  }
}
