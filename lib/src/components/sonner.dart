import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/components/toast.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/mouse_area.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';

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
  static const double _toastSpacing = 8.0;
  static const Duration _animationDuration = Duration(milliseconds: 300);

  final hovered = ValueNotifier(false);

  @override
  void dispose() {
    for (final toast in _toasts) {
      toast.timer?.cancel();
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
    toastInfo.timer = Timer(effectiveDuration, () => hide(effectiveId));
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
      setState(() => _toasts.remove(toastInfo));
      toastInfo.controller.dispose();
    }
  }

  void onEnter(PointerEnterEvent event) {
    hovered.value = true;
  }

  void onExit(PointerExitEvent event) {
    hovered.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final toasts = _toasts.map((toastInfo) => toastInfo.toast).toList(
          growable: false,
        );

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
            final hoveredToasts = Padding(
              padding: const EdgeInsets.all(16),
              child: ShadMouseArea(
                groupId: 'sonner',
                onEnter: onEnter,
                onExit: onExit,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: toasts
                        .separatedBy(const SizedBox(height: _toastSpacing)),
                  ),
                ),
              ),
            );

            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                widget.child,
                if (isHovered)
                  hoveredToasts
                else
                  for (final (i, toast) in toasts.indexed)
                    Positioned(
                      bottom: (toasts.length - i) * _toastSpacing + 16,
                      right: 16,
                      child: ShadMouseArea(
                        groupId: 'sonner',
                        onEnter: onEnter,
                        onExit: onExit,
                        child: toast,
                      ),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
