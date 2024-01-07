import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';

class ShadcnTheme extends StatelessWidget {
  const ShadcnTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final ShadcnThemeData data;
  final Widget child;

  static ShadcnThemeData of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    return inheritedTheme?.theme.data ?? ShadcnThemeData();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    required this.theme,
    required super.child,
  });

  final ShadcnTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ShadcnTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) => theme.data != old.theme.data;
}

/// An interpolation between two [ShadcnThemeData]s.
///
/// This class specializes the interpolation of [Tween<ShadcnThemeData>] to call
/// the [ShadcnThemeData.lerp] method.
///
/// See [Tween] for a discussion on how to use interpolation objects.
class ShadcnThemeDataTween extends Tween<ShadcnThemeData> {
  /// Creates a [ShadcnThemeData] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  ShadcnThemeDataTween({super.begin, super.end});

  @override
  ShadcnThemeData lerp(double t) => ShadcnThemeData.lerp(begin!, end!, t);
}

/// Animated version of [ShadcnTheme] which automatically transitions the colors
/// etc, over a given duration whenever the given theme changes.
class AnimatedShadcnTheme extends ImplicitlyAnimatedWidget {
  /// Creates an animated theme.
  ///
  /// By default, the theme transition uses a linear curve.
  const AnimatedShadcnTheme({
    super.key,
    required this.data,
    required this.child,
    super.curve,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
  });

  /// Specifies the color and typography values for descendant widgets.
  final ShadcnThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  AnimatedWidgetBaseState<AnimatedShadcnTheme> createState() =>
      _ShadcnAnimatedThemeState();
}

class _ShadcnAnimatedThemeState
    extends AnimatedWidgetBaseState<AnimatedShadcnTheme> {
  ShadcnThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (dynamic value) => ShadcnThemeDataTween(begin: value as ShadcnThemeData),
    )! as ShadcnThemeDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return ShadcnTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}
