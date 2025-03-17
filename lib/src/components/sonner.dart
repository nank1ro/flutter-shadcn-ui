import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/toast.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

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
  });

  /// The widget below the toaster in the tree, over which toasts are displayed.
  /// Typically the main app content.
  final Widget child;

  @override
  State<ShadSonner> createState() => ShadSonnerState();

  /// Retrieves the [ShadSonnerState] from the nearest [ShadSonner] ancestor.
  ///
  /// Throws a [FlutterError] if no [ShadSonner] is found in the widget tree.
  static ShadSonnerState of(BuildContext context) {
    final provider = maybeOf(context);
    if (provider == null) {
      throw FlutterError(
        '''Could not find ShadToaster InheritedWidget in the ancestor widget tree.''',
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
  final ShadToast toast;
  final AnimationController controller;
  Timer? timer;

  ToastInfo(this.toast, this.controller);
}

class ShadSonnerState extends State<ShadSonner> with TickerProviderStateMixin {
  final List<ToastInfo> _toasts = [];
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  static const double _toastSpacing = 8.0;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  @override
  void dispose() {
    for (var toast in _toasts) {
      toast.timer?.cancel();
      toast.controller.dispose();
    }
    _isHovered.dispose();
    super.dispose();
  }

  void show(ShadToast toast) {
    final controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    final toastInfo = ToastInfo(toast, controller);
    setState(() => _toasts.add(toastInfo));
    controller.forward();

    final effectiveDuration = toast.duration ?? kDefaultToastDuration;
    toastInfo.timer = Timer(effectiveDuration, () => _removeToast(toastInfo));
  }

  Future<void> _removeToast(ToastInfo toastInfo) async {
    if (!mounted || !_toasts.contains(toastInfo)) return;
    toastInfo.timer?.cancel();
    await toastInfo.controller.reverse();
    if (mounted) {
      setState(() => _toasts.remove(toastInfo));
      toastInfo.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadSonnerScope(
      shadMessengerState: this,
      child: Stack(
        children: [
          widget.child,
          MouseRegion(
            opaque: false,
            onEnter: (_) => _isHovered.value = true,
            onExit: (_) => _isHovered.value = false,
            child: ValueListenableBuilder<bool>(
              valueListenable: _isHovered,
              builder: (context, isHovered, child) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: AnimatedContainer(
                      duration: _animationDuration,
                      curve: Curves.easeInOut,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: _buildToastList(theme, isHovered),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildToastList(ShadThemeData theme, bool isHovered) {
    print('buildToastList');
    return _toasts
        .asMap()
        .entries
        .map((entry) {
          final index = entry.key;
          final toastInfo = entry.value;
          final toast = toastInfo.toast;

          final effectiveToastTheme = switch (toast.variant) {
            ShadToastVariant.primary || null => theme.primaryToastTheme,
            ShadToastVariant.destructive => theme.destructiveToastTheme,
          };

          final animateIn = <Effect<dynamic>>[
            SlideEffect(
              begin: Offset(1, 0),
              end: Offset.zero,
            ),
            FadeEffect(begin: 0, end: 1),
          ];

          final animateOut = <Effect<dynamic>>[
            SlideEffect(
              begin: Offset.zero,
              end: Offset(1, 0),
            ),
            FadeEffect(begin: 1, end: 0),
          ];

          final offsetY = isHovered
              ? index * (64 + _toastSpacing) // Expanded height + spacing
              : index * _toastSpacing; // Stacked minimal spacing

          return Animate(
            controller: toastInfo.controller,
            effects: toastInfo.controller.isAnimating
                ? (toastInfo.controller.status == AnimationStatus.forward
                    ? animateIn
                    : animateOut)
                : [],
            child: Transform.translate(
              offset: Offset(0, -offsetY),
              child: AnimatedPadding(
                duration: _animationDuration,
                curve: Curves.easeInOut,
                padding: EdgeInsets.only(bottom: isHovered ? _toastSpacing : 0),
                child: toast,
              ),
            ),
          );
        })
        .toList()
        .reversed
        .toList();
  }
}

/// An inherited widget that provides access to the [ShadSonnerState].
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
