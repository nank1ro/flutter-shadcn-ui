import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

@immutable
class ShadHoverStrategies {
  const ShadHoverStrategies({
    this.hover = const {},
    this.unhover = const {},
  });

  final Set<ShadHoverStrategy> hover;
  final Set<ShadHoverStrategy> unhover;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadHoverStrategies &&
        setEquals(other.hover, hover) &&
        setEquals(other.unhover, unhover);
  }

  @override
  int get hashCode => hover.hashCode ^ unhover.hashCode;

  ShadHoverStrategies copyWith({
    Set<ShadHoverStrategy>? hover,
    Set<ShadHoverStrategy>? unhover,
  }) {
    return ShadHoverStrategies(
      hover: hover ?? this.hover,
      unhover: unhover ?? this.unhover,
    );
  }
}

enum ShadHoverStrategy {
  onTapDown,
  onTapUp,
  onTapCancel,
  onLongPressStart,
  onLongPressCancel,
  onLongPressUp,
  onLongPressDown,
  onLongPressEnd,
  onDoubleTapDown,
  onDoubleTapCancel,
}

/// A special [GestureDetector] that handles the hovering state of the [child]
/// on devices where the hover is not supported (eg mobile) with the help of
/// [hoverStrategies].
///
/// If the device supports mouse, the [hoverStrategies] will be ignored and
/// [MouseRegion] will be used instead.
class ShadGestureDetector extends StatelessWidget {
  const ShadGestureDetector({
    super.key,
    required this.child,
    this.cursor = MouseCursor.defer,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
  });

  final ShadHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final MouseCursor cursor;
  final Widget child;
  final VoidCallback? onTap;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final VoidCallback? onLongPress;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final VoidCallback? onDoubleTapCancel;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final supportsMouse = switch (Theme.of(context).platform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.fuchsia =>
        false,
      TargetPlatform.windows ||
      TargetPlatform.macOS ||
      TargetPlatform.linux =>
        true,
    };

    final effectiveHoverStrategies = hoverStrategies ?? theme.hoverStrategies;

    void setHover(ShadHoverStrategy strategy) {
      // If the device supports mouse, we don't need to use any hover strategy.
      if (supportsMouse) return;

      if (effectiveHoverStrategies.hover.contains(strategy)) {
        onHoverChange?.call(true);
      } else if (effectiveHoverStrategies.unhover.contains(strategy)) {
        onHoverChange?.call(false);
      }
    }

    return MouseRegion(
      cursor: cursor,
      onEnter: (_) {
        onHoverChange?.call(true);
      },
      onExit: (_) {
        onHoverChange?.call(false);
      },
      child: GestureDetector(
        onTap: onTap,
        onTapDown: (d) {
          setHover(ShadHoverStrategy.onTapDown);
          onTapDown?.call(d);
        },
        onTapUp: (d) {
          setHover(ShadHoverStrategy.onTapUp);
          onTapUp?.call(d);
        },
        onTapCancel: () {
          setHover(ShadHoverStrategy.onTapCancel);
          onTapCancel?.call();
        },
        onLongPress: onLongPress,
        onLongPressStart: (d) {
          setHover(ShadHoverStrategy.onLongPressStart);
          onLongPressStart?.call(d);
        },
        onLongPressCancel: () {
          setHover(ShadHoverStrategy.onLongPressCancel);
          onLongPressCancel?.call();
        },
        onLongPressUp: () {
          setHover(ShadHoverStrategy.onLongPressUp);
          onLongPressUp?.call();
        },
        onLongPressDown: (d) {
          setHover(ShadHoverStrategy.onLongPressDown);
          onLongPressDown?.call(d);
        },
        onLongPressEnd: (d) {
          setHover(ShadHoverStrategy.onLongPressEnd);
          onLongPressEnd?.call(d);
        },
        onDoubleTap: onDoubleTap,
        onDoubleTapDown: (d) {
          setHover(ShadHoverStrategy.onDoubleTapDown);
          onDoubleTapDown?.call(d);
        },
        onDoubleTapCancel: () {
          setHover(ShadHoverStrategy.onDoubleTapCancel);
          onDoubleTapCancel?.call();
        },
        child: child,
      ),
    );
  }
}
