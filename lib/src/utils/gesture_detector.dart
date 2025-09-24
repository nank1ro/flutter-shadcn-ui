import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/extensions/tap_details.dart';

@immutable
class ShadHoverStrategies {
  const ShadHoverStrategies({
    this.hover = const {},
    this.unhover = const {},
    this.longPressDuration,
    this.onHoverChange,
  });

  final Set<ShadHoverStrategy> hover;
  final Set<ShadHoverStrategy> unhover;
  final Duration? longPressDuration;
  final ValueChanged<bool>? onHoverChange;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadHoverStrategies &&
        setEquals(other.hover, hover) &&
        setEquals(other.unhover, unhover) &&
        other.longPressDuration == longPressDuration &&
        other.onHoverChange == onHoverChange;
  }

  @override
  int get hashCode {
    return hover.hashCode ^
        unhover.hashCode ^
        longPressDuration.hashCode ^
        onHoverChange.hashCode;
  }

  ShadHoverStrategies copyWith({
    Set<ShadHoverStrategy>? hover,
    Set<ShadHoverStrategy>? unhover,
    Duration? longPressDuration,
    ValueChanged<bool>? onHoverChange,
  }) {
    return ShadHoverStrategies(
      hover: hover ?? this.hover,
      unhover: unhover ?? this.unhover,
      longPressDuration: longPressDuration ?? this.longPressDuration,
      onHoverChange: onHoverChange ?? this.onHoverChange,
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
  onTap,
  onTapOutside,
}

/// A special [GestureDetector] that handles the hovering state of the [child]
/// on devices where the hover is not supported (eg mobile) with the help of
/// [hoverStrategies].
///
/// If the device supports mouse, the [hoverStrategies] will be ignored and
/// [MouseRegion] will be used instead.
class ShadGestureDetector extends StatefulWidget {
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
    this.groupId,
    this.onTapOutside,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.dragStartBehavior = DragStartBehavior.start,
  });

  final ShadHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final MouseCursor cursor;
  final Widget child;
  final VoidCallback? onTap;

  /// Called when the user taps outside the widget.
  final VoidCallback? onTapOutside;
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

  /// A pointer has contacted the screen with a primary button and might begin
  /// to move.
  ///
  /// See also:
  ///
  ///  * [kPrimaryButton], the button this callback responds to.
  final GestureDragDownCallback? onPanDown;

  /// A pointer has contacted the screen with a primary button and has begun to
  /// move.
  ///
  /// See also:
  ///
  ///  * [kPrimaryButton], the button this callback responds to.
  final GestureDragStartCallback? onPanStart;

  /// A pointer that is in contact with the screen with a primary button and
  /// moving has moved again.
  ///
  /// See also:
  ///
  ///  * [kPrimaryButton], the button this callback responds to.
  final GestureDragUpdateCallback? onPanUpdate;

  /// A pointer that was previously in contact with the screen with a primary
  /// button and moving is no longer in contact with the screen and was moving
  /// at a specific velocity when it stopped contacting the screen.
  final GestureDragEndCallback? onPanEnd;

  /// The pointer that previously triggered [onPanDown] did not complete.
  final GestureDragCancelCallback? onPanCancel;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], gesture drag behavior will
  /// begin at the position where the drag gesture won the arena. If set to
  /// [DragStartBehavior.down] it will begin at the position where a down event
  /// is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// Only the [DragGestureRecognizer.onStart] callbacks for the
  /// [VerticalDragGestureRecognizer], [HorizontalDragGestureRecognizer] and
  /// [PanGestureRecognizer] are affected by this setting.
  final DragStartBehavior dragStartBehavior;

  /// {@macro ShadMouseArea.groupId}
  final Object? groupId;

  @override
  State<ShadGestureDetector> createState() => _ShadGestureDetectorState();
}

class _ShadGestureDetectorState extends State<ShadGestureDetector> {
  bool hovered = false;

  // See https://github.com/nank1ro/flutter-shadcn-ui/issues/319
  Offset correctGlobalPosition(BuildContext context, Offset globalPosition) {
    // Get the root navigator's overlay (screen coordinates)
    final rootNavigator = Navigator.maybeOf(context, rootNavigator: true);
    final rootOverlay = rootNavigator?.overlay;
    if (rootOverlay == null) return globalPosition;

    // Get the shell navigator's overlay (nearest Navigator)
    final shellNavigator = Navigator.maybeOf(context);
    final shellOverlay = shellNavigator?.overlay;
    if (shellOverlay == null || shellOverlay == rootOverlay) {
      return globalPosition;
    }

    final shellRenderObject = shellOverlay.context.findRenderObject();
    if (shellRenderObject is! RenderBox) {
      return globalPosition;
    }

    final shellOffset = shellRenderObject.localToGlobal(Offset.zero);
    final correctedPosition = globalPosition - shellOffset;

    return correctedPosition;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final configuration = ScrollConfiguration.of(context);

    final effectiveHoverStrategies =
        widget.hoverStrategies ?? theme.hoverStrategies;
    final gestures = <Type, GestureRecognizerFactory>{};
    final gestureSettings = MediaQuery.maybeGestureSettingsOf(context);

    void setHover(ShadHoverStrategy strategy) {
      final presentInHover = effectiveHoverStrategies.hover.contains(strategy);
      final presentInUnhover =
          effectiveHoverStrategies.unhover.contains(strategy);

      // Toggle the hover state if the strategy is present in both hover and
      // unhover sets.
      if (presentInHover && presentInUnhover) {
        hovered = !hovered;
        widget.onHoverChange?.call(hovered);
        effectiveHoverStrategies.onHoverChange?.call(hovered);
        return;
      }

      if (presentInHover) {
        widget.onHoverChange?.call(true);
        effectiveHoverStrategies.onHoverChange?.call(true);
        hovered = true;
      } else if (presentInUnhover) {
        widget.onHoverChange?.call(false);
        effectiveHoverStrategies.onHoverChange?.call(false);
        hovered = false;
      }
    }

    void effectiveOnTapDown(TapDownDetails d) {
      setHover(ShadHoverStrategy.onTapDown);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onTapDown
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnTap() {
      setHover(ShadHoverStrategy.onTap);
      widget.onTap?.call();
    }

    void effectiveOnTapOutside(PointerDownEvent event) {
      setHover(ShadHoverStrategy.onTapOutside);
      widget.onTapOutside?.call();
    }

    void effectiveOnSecondaryTapDown(TapDownDetails d) {
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onSecondaryTapDown?.call(
        d.copyWith(globalPosition: correctedGlobalPosition),
      );
    }

    void effectiveOnSecondaryTapUp(TapUpDetails d) {
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onSecondaryTapUp
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnSecondaryTapCancel() {
      widget.onSecondaryTapCancel?.call();
    }

    void effectiveOnSecondaryTap() {
      widget.onSecondaryTap?.call();
    }

    void effectiveOnTapUp(TapUpDetails d) {
      setHover(ShadHoverStrategy.onTapUp);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onTapUp?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnTapCancel() {
      setHover(ShadHoverStrategy.onTapCancel);
      widget.onTapCancel?.call();
    }

    void effectiveOnDoubleTapDown(TapDownDetails d) {
      setHover(ShadHoverStrategy.onDoubleTapDown);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onDoubleTapDown
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnDoubleTapCancel() {
      setHover(ShadHoverStrategy.onDoubleTapCancel);
      widget.onDoubleTapCancel?.call();
    }

    void effectiveOnLongPressStart(LongPressStartDetails d) {
      setHover(ShadHoverStrategy.onLongPressStart);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onLongPressStart
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnLongPressCancel() {
      setHover(ShadHoverStrategy.onLongPressCancel);
      widget.onLongPressCancel?.call();
    }

    void effectiveOnLongPressUp() {
      setHover(ShadHoverStrategy.onLongPressUp);
      widget.onLongPressUp?.call();
    }

    void effectiveOnLongPressDown(LongPressDownDetails d) {
      setHover(ShadHoverStrategy.onLongPressDown);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onLongPressDown
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    void effectiveOnLongPressEnd(LongPressEndDetails d) {
      setHover(ShadHoverStrategy.onLongPressEnd);
      final correctedGlobalPosition =
          correctGlobalPosition(context, d.globalPosition);
      widget.onLongPressEnd
          ?.call(d.copyWith(globalPosition: correctedGlobalPosition));
    }

    gestures[TapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
      () => TapGestureRecognizer(
        debugOwner: this,
        supportedDevices: widget.supportedDevices,
      ),
      (TapGestureRecognizer instance) {
        instance
          ..onTapDown = effectiveOnTapDown
          ..onTapUp = effectiveOnTapUp
          ..onTap = effectiveOnTap
          ..onTapCancel = effectiveOnTapCancel
          ..onSecondaryTapDown = effectiveOnSecondaryTapDown
          ..onSecondaryTapUp = effectiveOnSecondaryTapUp
          ..onSecondaryTap = effectiveOnSecondaryTap
          ..onSecondaryTapCancel = effectiveOnSecondaryTapCancel
          ..gestureSettings = gestureSettings
          ..supportedDevices = widget.supportedDevices;
      },
    );

    if (widget.onDoubleTap != null ||
        widget.onDoubleTapDown != null ||
        widget.onDoubleTapCancel != null) {
      gestures[DoubleTapGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
        () => DoubleTapGestureRecognizer(
          debugOwner: this,
          supportedDevices: widget.supportedDevices,
        ),
        (DoubleTapGestureRecognizer instance) {
          instance
            ..onDoubleTapDown = effectiveOnDoubleTapDown
            ..onDoubleTap = widget.onDoubleTap
            ..onDoubleTapCancel = effectiveOnDoubleTapCancel
            ..gestureSettings = gestureSettings
            ..supportedDevices = widget.supportedDevices;
        },
      );
    }

    if (widget.onLongPressDown != null ||
        widget.onLongPressCancel != null ||
        widget.onLongPress != null ||
        widget.onLongPressStart != null ||
        widget.onLongPressMoveUpdate != null ||
        widget.onLongPressUp != null ||
        widget.onLongPressEnd != null) {
      gestures[LongPressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
        () => LongPressGestureRecognizer(
          duration: widget.longPressDuration ??
              effectiveHoverStrategies.longPressDuration ??
              kLongPressTimeout,
          debugOwner: this,
          supportedDevices: widget.supportedDevices,
        ),
        (LongPressGestureRecognizer instance) {
          instance
            ..onLongPressDown = effectiveOnLongPressDown
            ..onLongPressCancel = effectiveOnLongPressCancel
            ..onLongPress = widget.onLongPress
            ..onLongPressStart = effectiveOnLongPressStart
            ..onLongPressMoveUpdate = widget.onLongPressMoveUpdate
            ..onLongPressUp = effectiveOnLongPressUp
            ..onLongPressEnd = effectiveOnLongPressEnd
            ..gestureSettings = gestureSettings
            ..supportedDevices = widget.supportedDevices;
        },
      );
    }

    if (widget.onForcePressStart != null ||
        widget.onForcePressPeak != null ||
        widget.onForcePressUpdate != null ||
        widget.onForcePressEnd != null) {
      gestures[ForcePressGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<ForcePressGestureRecognizer>(
        () => ForcePressGestureRecognizer(
          debugOwner: this,
          supportedDevices: widget.supportedDevices,
          startPressure: widget.forceStartPressure,
          peakPressure: widget.forcePeakPressure,
        ),
        (ForcePressGestureRecognizer instance) {
          instance
            ..onStart = widget.onForcePressStart
            ..onPeak = widget.onForcePressPeak
            ..onUpdate = widget.onForcePressUpdate
            ..onEnd = widget.onForcePressEnd
            ..gestureSettings = gestureSettings
            ..supportedDevices = widget.supportedDevices;
        },
      );
    }

    if (widget.onPanDown != null ||
        widget.onPanStart != null ||
        widget.onPanUpdate != null ||
        widget.onPanEnd != null ||
        widget.onPanCancel != null) {
      gestures[PanGestureRecognizer] =
          GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
        () => PanGestureRecognizer(
            debugOwner: this, supportedDevices: widget.supportedDevices),
        (PanGestureRecognizer instance) {
          instance
            ..onDown = widget.onPanDown
            ..onStart = widget.onPanStart
            ..onUpdate = widget.onPanUpdate
            ..onEnd = widget.onPanEnd
            ..onCancel = widget.onPanCancel
            ..dragStartBehavior = widget.dragStartBehavior
            ..multitouchDragStrategy =
                configuration.getMultitouchDragStrategy(context)
            ..gestureSettings = gestureSettings
            ..supportedDevices = widget.supportedDevices;
        },
      );
    }

    return TapRegion(
      onTapOutside: effectiveOnTapOutside,
      groupId: widget.groupId,
      child: MouseRegion(
        cursor: widget.cursor,
        onEnter: (_) {
          widget.onHoverChange?.call(true);
        },
        onExit: (_) {
          widget.onHoverChange?.call(false);
        },
        child: RawGestureDetector(
          gestures: gestures,
          behavior: widget.behavior,
          excludeFromSemantics: widget.excludeFromSemantics,
          child: widget.child,
        ),
      ),
    );
  }
}
