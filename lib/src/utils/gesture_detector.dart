import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

enum ShadHoverMobileStrategy {
  onTap,
  onTapDown,
  onTapUp,
  onTapCancel,
  onLongPress,
  onLongPressStart,
  onLongPressCancel,
  onLongPressUp,
  onLongPressDown,
  onLongPressEnd,
  onDoubleTap,
  onDoubleTapDown,
  onDoubleTapCancel,
}

class ShadGestureDetector extends StatelessWidget {
  const ShadGestureDetector({
    super.key,
    required this.child,
    this.hoverStrategies,
    this.unhoverStrategies,
    this.hovered,
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

  final List<ShadHoverMobileStrategy>? hoverStrategies;
  final List<ShadHoverMobileStrategy>? unhoverStrategies;
  final ValueChanged<bool>? hovered;
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

  bool hasStrategy(ShadHoverMobileStrategy strategy) =>
      hoverStrategies?.contains(strategy) ??
      unhoverStrategies?.contains(strategy) ??
      false;

  void setHover(ShadHoverMobileStrategy strategy) {
    if (hoverStrategies?.contains(strategy) ?? false) {
      hovered?.call(true);
    } else if (unhoverStrategies?.contains(strategy) ?? false) {
      hovered?.call(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        hovered?.call(true);
      },
      onExit: (_) {
        hovered?.call(false);
      },
      child: GestureDetector(
        onTap: () {
          setHover(ShadHoverMobileStrategy.onTap);
          onTap?.call();
        },
        onTapDown: (d) {
          print('onTapDown');
          setHover(ShadHoverMobileStrategy.onTapDown);
          onTapDown?.call(d);
        },
        onTapUp: (d) {
          print('onTapUp');
          setHover(ShadHoverMobileStrategy.onTapUp);
          onTapUp?.call(d);
        },
        onTapCancel: () {
          setHover(ShadHoverMobileStrategy.onTapCancel);
          onTapCancel?.call();
        },
        onLongPress: () {
          setHover(ShadHoverMobileStrategy.onLongPress);
          onLongPress?.call();
        },
        onLongPressStart: (d) {
          print('onLongPressStart');
          setHover(ShadHoverMobileStrategy.onLongPressStart);
          onLongPressStart?.call(d);
        },
        onLongPressCancel: () {
          print('onLongPressCancel');
          setHover(ShadHoverMobileStrategy.onLongPressCancel);
          onLongPressCancel?.call();
        },
        onLongPressUp: () {
          print('onLongPressUp');
          setHover(ShadHoverMobileStrategy.onLongPressUp);
          onLongPressUp?.call();
        },
        onLongPressDown: (d) {
          print('onLongPressDown');
          setHover(ShadHoverMobileStrategy.onLongPressDown);
          onLongPressDown?.call(d);
        },
        onLongPressEnd: (d) {
          setHover(ShadHoverMobileStrategy.onLongPressEnd);
          onLongPressEnd?.call(d);
        },
        onDoubleTap: () {
          setHover(ShadHoverMobileStrategy.onDoubleTap);
          onDoubleTap?.call();
        },
        onDoubleTapDown: (d) {
          setHover(ShadHoverMobileStrategy.onDoubleTapDown);
          onDoubleTapDown?.call(d);
        },
        onDoubleTapCancel: () {
          setHover(ShadHoverMobileStrategy.onDoubleTapCancel);
          onDoubleTapCancel?.call();
        },
        child: child,
      ),
    );
  }
}
