import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

typedef AnimEffect<T> = Effect<T>;

@immutable
class SizeEffect extends Effect<double> {
  const SizeEffect({
    super.delay,
    super.duration,
    super.curve,
    double? begin,
    double? end,
  }) : super(
          begin: begin ?? (end == null ? defaultValue : neutralValue),
          end: end ?? neutralValue,
        );

  @override
  Widget build(
    BuildContext context,
    Widget child,
    AnimationController controller,
    EffectEntry entry,
  ) {
    return SizeTransition(
      sizeFactor: buildAnimation(controller, entry),
      child: child,
    );
  }

  static const neutralValue = 1.0;
  static const defaultValue = 0.0;
}

@immutable
class PaddingEffect extends Effect<double> {
  const PaddingEffect({
    required this.padding,
    super.delay,
    super.duration,
    super.curve,
    double? begin,
    double? end,
  }) : super(
          begin: begin ?? (end == null ? defaultValue : neutralValue),
          end: end ?? neutralValue,
        );

  @override
  Widget build(
    BuildContext context,
    Widget child,
    AnimationController controller,
    EffectEntry entry,
  ) {
    final animation = buildAnimation(controller, entry);
    return Padding(
      padding: padding * animation.value,
      child: child,
    );
  }

  final EdgeInsets padding;

  static const neutralValue = 1.0;
  static const defaultValue = 0.0;
}
