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
    this.clipBehavior = Clip.hardEdge,
  }) : super(
         begin: begin ?? (end == null ? defaultValue : neutralValue),
         end: end ?? neutralValue,
       );

  /// {@template SizeEffect.clipBehavior}
  /// The clip behavior of the size transition.
  /// Defaults to [Clip.hardEdge].
  /// Set to [Clip.none] to prevent clipping of focus rings and other
  /// content that extends beyond the widget's boundary.
  /// {@endtemplate}
  final Clip clipBehavior;

  @override
  Widget build(
    BuildContext context,
    Widget child,
    AnimationController controller,
    EffectEntry entry,
  ) {
    return ShadSizeTransition(
      sizeFactor: buildAnimation(controller, entry),
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  static const neutralValue = 1.0;
  static const defaultValue = 0.0;
}

/// {@template ShadSizeTransition}
/// A custom size transition widget that supports [clipBehavior].
///
/// This is similar to Flutter's [SizeTransition] but with configurable
/// clip behavior to allow focus rings and other content to extend beyond
/// the widget's boundary during animation.
/// {@endtemplate}
class ShadSizeTransition extends AnimatedWidget {
  /// {@macro ShadSizeTransition}
  const ShadSizeTransition({
    super.key,
    required Animation<double> sizeFactor,
    this.clipBehavior = Clip.hardEdge,
    this.child,
  }) : super(listenable: sizeFactor);

  final Clip clipBehavior;
  final Widget? child;

  Animation<double> get sizeFactor => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    final result = Align(
      alignment: AlignmentDirectional.topStart,
      heightFactor: sizeFactor.value,
      child: child,
    );

    if (clipBehavior == Clip.none) {
      return result;
    }

    return ClipRect(
      clipBehavior: clipBehavior,
      child: result,
    );
  }
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

  final EdgeInsetsGeometry padding;

  static const neutralValue = 1.0;
  static const defaultValue = 0.0;
}
