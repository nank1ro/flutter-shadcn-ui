import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';

class ShadTheme extends StatelessWidget {
  const ShadTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final ShadThemeData data;
  final Widget child;

  static ShadThemeData of(BuildContext context, {bool listen = true}) {
    final provider = maybeOf(context, listen: listen);
    if (provider == null) {
      throw FlutterError(
        '''
        ShadTheme.of() called with a context that does not contain a ShadTheme.\n
        No ShadTheme ancestor could be found starting from the context that was passed to ShadTheme.of(). 
        This can happen because you do not have a ShadApp widget (which introduces a ShadTheme), 
        or it can happen if the context you use comes from a widget above this widget.\n
        The context used was: $context''',
      );
    }
    return provider;
  }

  static ShadThemeData? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ShadInheritedTheme>()
          ?.theme
          .data;
    }
    final provider = context
        .getElementForInheritedWidgetOfExactType<ShadInheritedTheme>()
        ?.widget;

    return (provider as ShadInheritedTheme?)?.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return ShadInheritedTheme(
      theme: this,
      child: child,
    );
  }
}

class ShadInheritedTheme extends InheritedTheme {
  const ShadInheritedTheme({
    super.key,
    required this.theme,
    required super.child,
  });

  final ShadTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ShadTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(ShadInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}

/// An interpolation between two [ShadThemeData]s.
///
/// This class specializes the interpolation of [Tween<ShadThemeData>] to call
/// the [ShadThemeData.lerp] method.
///
/// See [Tween] for a discussion on how to use interpolation objects.
class ShadThemeDataTween extends Tween<ShadThemeData> {
  /// Creates a [ShadThemeData] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  ShadThemeDataTween({super.begin, super.end});

  @override
  ShadThemeData lerp(double t) => ShadThemeData.lerp(begin!, end!, t);
}

/// Animated version of [ShadTheme] which automatically transitions the colors
/// etc, over a given duration whenever the given theme changes.
class ShadAnimatedTheme extends ImplicitlyAnimatedWidget {
  /// Creates an animated theme.
  ///
  /// By default, the theme transition uses a linear curve.
  const ShadAnimatedTheme({
    super.key,
    required this.data,
    required this.child,
    super.curve,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
  });

  /// Specifies the color and typography values for descendant widgets.
  final ShadThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  AnimatedWidgetBaseState<ShadAnimatedTheme> createState() =>
      _ShadAnimatedThemeState();
}

class _ShadAnimatedThemeState
    extends AnimatedWidgetBaseState<ShadAnimatedTheme> {
  ShadThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (dynamic value) => ShadThemeDataTween(begin: value as ShadThemeData),
    )! as ShadThemeDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return ShadTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}
