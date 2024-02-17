import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/assets.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/image.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

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

class ShadToasterState extends State<ShadToaster> {
  ShadToast? _visibleToast;
  Timer? _timer;

  void show(ShadToast toast) {
    print('showToast');
    setState(() => _visibleToast = toast);
    _timer?.cancel();
    final effectiveDuration = toast.duration ?? 4.seconds;
    _timer = Timer(effectiveDuration, hide);
  }

  void hide() {
    _timer?.cancel();
    setState(() => _visibleToast = null);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadToasterScope(
      shadMessengerState: this,
      child: Stack(
        children: [
          widget.child,
          if (_visibleToast != null)
            Align(
              alignment: _visibleToast!.alignment ?? Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: _visibleToast!.offset?.dx ?? 16,
                  vertical: _visibleToast!.offset?.dy ?? 16,
                ),
                child: _visibleToast,
              ),
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

class ShadToast extends StatelessWidget {
  const ShadToast({
    super.key,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.alignment,
    this.offset,
    this.duration,
    this.textDirection,
  });

  final Widget? title;
  final Widget? description;
  final Widget? action;
  final Widget? closeIcon;
  final Alignment? alignment;
  final Offset? offset;
  final Duration? duration;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final effectiveCloseIcon = closeIcon ??
        ShadButton.ghost(
          icon: const ShadImage.square(size: 16, ShadAssets.x),
          width: 20,
          height: 20,
          padding: EdgeInsets.zero,
          foregroundColor: theme.colorScheme.foreground.withOpacity(.5),
          applyIconColorFilter: true,
          hoverForegroundColor: theme.colorScheme.foreground,
          pressedForegroundColor: theme.colorScheme.foreground,
          onPressed: () {
            ShadToaster.of(context).hide();
          },
        );
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.border,
        ),
        borderRadius: theme.radius,
        boxShadow: ShadShadows.lg,
        color: theme.colorScheme.background,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              textDirection: textDirection,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: theme.textTheme.muted.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.foreground,
                        ),
                        child: title!,
                      ),
                    if (description != null)
                      DefaultTextStyle(
                        style: theme.textTheme.muted.copyWith(
                          color: theme.colorScheme.foreground.withOpacity(.9),
                        ),
                        child: description!,
                      ),
                  ],
                ),
                if (action != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: action,
                  ),
              ],
            ),
          ),
          Positioned(top: 8, right: 8, child: effectiveCloseIcon),
        ],
      ),
    );
  }
}
