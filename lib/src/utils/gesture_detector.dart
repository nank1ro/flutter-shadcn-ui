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
  onForcePressStart,
  onForcePressEnd,
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
    this.behavior,
    this.onHoverChange,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.supportedDevices,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.forceStartPressure = 0.4,
    this.forcePeakPressure = 0.85,
    this.excludeFromSemantics = false,
  });

  final ShadHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final MouseCursor cursor;
  final Widget child;
  final VoidCallback? onTap;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final VoidCallback? onSecondaryTap;
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;
  final VoidCallback? onSecondaryTapCancel;
  final VoidCallback? onLongPress;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressMoveUpdateDetails>? onLongPressMoveUpdate;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final VoidCallback? onDoubleTapCancel;
  final Duration? longPressDuration;

  /// The kind of devices that are allowed to be recognized.
  ///
  /// If set to null, events from all device types will be recognized. Defaults
  /// to null.
  final Set<PointerDeviceKind>? supportedDevices;

  /// The pointer is in contact with the screen and has pressed with sufficient
  /// force to initiate a force press. The amount of force is at least
  /// [ForcePressGestureRecognizer.startPressure].
  ///
  /// This callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressStartCallback? onForcePressStart;

  /// The pointer is in contact with the screen and has pressed with the maximum
  /// force. The amount of force is at least
  /// [ForcePressGestureRecognizer.peakPressure].
  ///
  /// This callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// A pointer is in contact with the screen, has previously passed the
  /// [ForcePressGestureRecognizer.startPressure] and is either moving on the
  /// plane of the screen, pressing the screen with varying forces or both
  /// simultaneously.
  ///
  /// This callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// The pointer tracked by [onForcePressStart] is no longer in contact with
  /// the screen.
  ///
  /// This callback will only be fired on devices with pressure
  /// detecting screens.
  final GestureForcePressEndCallback? onForcePressEnd;

  final double forceStartPressure;
  final double forcePeakPressure;
  final HitTestBehavior? behavior;

  /// Whether to exclude these gestures from the semantics tree. For
  /// example, the long-press gesture for showing a tooltip is
  /// excluded because the tooltip itself is included in the semantics
  /// tree directly and so having a gesture to show it would result in
  /// duplication of information.
  final bool excludeFromSemantics;

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
    final gestures = <Type, GestureRecognizerFactory>{};
    final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);

    void setHover(ShadHoverStrategy strategy) {
      // If the device supports mouse, we don't need to use any hover strategy.
      if (supportsMouse) return;

      if (effectiveHoverStrategies.hover.contains(strategy)) {
        onHoverChange?.call(true);
      } else if (effectiveHoverStrategies.unhover.contains(strategy)) {
        onHoverChange?.call(false);
      }
    }

    void effectiveOnTapDown(TapDownDetails d) {
      setHover(ShadHoverStrategy.onTapDown);
      onTapDown?.call(d);
    }

    void effectiveOnSecondaryTapDown(TapDownDetails d) {
      onSecondaryTapDown?.call(d);
    }

    void effectiveOnSecondaryTapUp(TapUpDetails d) {
      onSecondaryTapUp?.call(d);
    }

    void effectiveOnSecondaryTapCancel() {
      onSecondaryTapCancel?.call();
    }

    void effectiveOnSecondaryTap() {
      onSecondaryTap?.call();
    }

    void effectiveOnTapUp(TapUpDetails d) {
      setHover(ShadHoverStrategy.onTapUp);
      onTapUp?.call(d);
    }

    void effectiveOnTapCancel() {
      setHover(ShadHoverStrategy.onTapCancel);
      onTapCancel?.call();
    }

    void effectiveOnDoubleTapDown(TapDownDetails d) {
      setHover(ShadHoverStrategy.onDoubleTapDown);
      onDoubleTapDown?.call(d);
    }

    void effectiveOnDoubleTapCancel() {
      setHover(ShadHoverStrategy.onDoubleTapCancel);
      onDoubleTapCancel?.call();
    }

    void effectiveOnLongPressStart(LongPressStartDetails d) {
      setHover(ShadHoverStrategy.onLongPressStart);
      onLongPressStart?.call(d);
    }

    void effectiveOnLongPressCancel() {
      setHover(ShadHoverStrategy.onLongPressCancel);
      onLongPressCancel?.call();
    }

    void effectiveOnLongPressUp() {
      setHover(ShadHoverStrategy.onLongPressUp);
      onLongPressUp?.call();
    }

    void effectiveOnLongPressDown(LongPressDownDetails d) {
      setHover(ShadHoverStrategy.onLongPressDown);
      onLongPressDown?.call(d);
    }

    void effectiveOnLongPressEnd(LongPressEndDetails d) {
      setHover(ShadHoverStrategy.onLongPressEnd);
      onLongPressEnd?.call(d);
    }

    gestures[TapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
      () => TapGestureRecognizer(
        debugOwner: this,
        supportedDevices: supportedDevices,
      ),
      (TapGestureRecognizer instance) {
        instance
          ..onTapDown = effectiveOnTapDown
          ..onTapUp = effectiveOnTapUp
          ..onTap = onTap
          ..onTapCancel = effectiveOnTapCancel
          ..onSecondaryTapDown = effectiveOnSecondaryTapDown
          ..onSecondaryTapUp = effectiveOnSecondaryTapUp
          ..onSecondaryTap = effectiveOnSecondaryTap
          ..onSecondaryTapCancel = effectiveOnSecondaryTapCancel
          ..gestureSettings = gestureSettings
          ..supportedDevices = supportedDevices;
      },
    );

    if (onDoubleTap != null ||
        onDoubleTapDown != null ||
        onDoubleTapCancel != null) {
      gestures[DoubleTapGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
        () => DoubleTapGestureRecognizer(
          debugOwner: this,
          supportedDevices: supportedDevices,
        ),
        (DoubleTapGestureRecognizer instance) {
          instance
            ..onDoubleTapDown = effectiveOnDoubleTapDown
            ..onDoubleTap = onDoubleTap
            ..onDoubleTapCancel = effectiveOnDoubleTapCancel
            ..gestureSettings = gestureSettings
            ..supportedDevices = supportedDevices;
        },
      );
    }

    if (onLongPressDown != null ||
        onLongPressCancel != null ||
        onLongPress != null ||
        onLongPressStart != null ||
        onLongPressMoveUpdate != null ||
        onLongPressUp != null ||
        onLongPressEnd != null) {
      gestures[LongPressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
        () => LongPressGestureRecognizer(
          duration: longPressDuration ?? kLongPressTimeout,
          debugOwner: this,
          supportedDevices: supportedDevices,
        ),
        (LongPressGestureRecognizer instance) {
          instance
            ..onLongPressDown = effectiveOnLongPressDown
            ..onLongPressCancel = effectiveOnLongPressCancel
            ..onLongPress = onLongPress
            ..onLongPressStart = effectiveOnLongPressStart
            ..onLongPressMoveUpdate = onLongPressMoveUpdate
            ..onLongPressUp = effectiveOnLongPressUp
            ..onLongPressEnd = effectiveOnLongPressEnd
            ..gestureSettings = gestureSettings
            ..supportedDevices = supportedDevices;
        },
      );
    }

    if (onForcePressStart != null ||
        onForcePressPeak != null ||
        onForcePressUpdate != null ||
        onForcePressEnd != null) {
      gestures[ForcePressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<ForcePressGestureRecognizer>(
        () => ForcePressGestureRecognizer(
          debugOwner: this,
          supportedDevices: supportedDevices,
          startPressure: forceStartPressure,
          peakPressure: forcePeakPressure,
        ),
        (ForcePressGestureRecognizer instance) {
          instance
            ..onStart = onForcePressStart
            ..onPeak = onForcePressPeak
            ..onUpdate = onForcePressUpdate
            ..onEnd = onForcePressEnd
            ..gestureSettings = gestureSettings
            ..supportedDevices = supportedDevices;
        },
      );
    }

    return MouseRegion(
      cursor: cursor,
      onEnter: (_) {
        onHoverChange?.call(true);
      },
      onExit: (_) {
        onHoverChange?.call(false);
      },
      child: RawGestureDetector(
        gestures: gestures,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        child: child,
      ),
    );
  }
}
