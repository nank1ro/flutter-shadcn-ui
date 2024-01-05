import 'package:flutter/material.dart';

@immutable
abstract class ShadcnBaseTheme {
  const ShadcnBaseTheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.radius,
  });

  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final BorderRadius radius;
}

@immutable
class ZincTheme extends ShadcnBaseTheme {
  const ZincTheme.raw({
    required super.background,
    required super.foreground,
    required super.card,
    required super.cardForeground,
    required super.popover,
    required super.popoverForeground,
    required super.primary,
    required super.primaryForeground,
    required super.secondary,
    required super.secondaryForeground,
    required super.muted,
    required super.mutedForeground,
    required super.accent,
    required super.accentForeground,
    required super.destructive,
    required super.destructiveForeground,
    required super.border,
    required super.input,
    required super.ring,
    required super.radius,
  });

  factory ZincTheme.light({
    Color background = const Color(0xFFFFFFFF),
    Color foreground = const Color(0xff09090b),
    Color card = const Color(0xffffffff),
    Color cardForeground = const Color(0xff09090b),
    Color popover = const Color(0xffffffff),
    Color popoverForeground = const Color(0xff09090b),
    Color primary = const Color(0xff18181b),
    Color primaryForeground = const Color(0xfffafafa),
    Color secondary = const Color(0xfff4f4f5),
    Color secondaryForeground = const Color(0xff18181b),
    Color muted = const Color(0xfff4f4f5),
    Color mutedForeground = const Color(0xff71717a),
    Color accent = const Color(0xfff4f4f5),
    Color accentForeground = const Color(0xff18181b),
    Color destructive = const Color(0xffdc2626),
    Color destructiveForeground = const Color(0xfffafafa),
    Color border = const Color(0xffe4e4e7),
    Color input = const Color(0xffe4e4e7),
    Color ring = const Color(0xffa1a1aa),
    BorderRadius radius = const BorderRadius.all(Radius.circular(8)),
  }) {
    return ZincTheme.raw(
      background: background,
      foreground: foreground,
      card: card,
      cardForeground: cardForeground,
      popover: popover,
      popoverForeground: popoverForeground,
      primary: primary,
      primaryForeground: primaryForeground,
      secondary: secondary,
      secondaryForeground: secondaryForeground,
      muted: muted,
      mutedForeground: mutedForeground,
      accent: accent,
      accentForeground: accentForeground,
      destructive: destructive,
      destructiveForeground: destructiveForeground,
      border: border,
      input: input,
      ring: ring,
      radius: radius,
    );
  }

  factory ZincTheme.dark({
    Color background = const Color(0xff09090b),
    Color foreground = const Color(0xfffafafa),
    Color card = const Color(0xff09090b),
    Color cardForeground = const Color(0xfffafafa),
    Color popover = const Color(0xff09090b),
    Color popoverForeground = const Color(0xfffafafa),
    Color primary = const Color(0xfffafafa),
    Color primaryForeground = const Color(0xff18181b),
    Color secondary = const Color(0xff27272a),
    Color secondaryForeground = const Color(0xfffafafa),
    Color muted = const Color(0xff27272a),
    Color mutedForeground = const Color(0xffa1a1aa),
    Color accent = const Color(0xff27272a),
    Color accentForeground = const Color(0xfffafafa),
    Color destructive = const Color(0xff7f1d1d),
    Color destructiveForeground = const Color(0xfffafafa),
    Color border = const Color(0xff27272a),
    Color input = const Color(0xff27272a),
    Color ring = const Color(0xffd4d4d8),
    BorderRadius radius = const BorderRadius.all(Radius.circular(8)),
  }) {
    return ZincTheme.raw(
      background: background,
      foreground: foreground,
      card: card,
      cardForeground: cardForeground,
      popover: popover,
      popoverForeground: popoverForeground,
      primary: primary,
      primaryForeground: primaryForeground,
      secondary: secondary,
      secondaryForeground: secondaryForeground,
      muted: muted,
      mutedForeground: mutedForeground,
      accent: accent,
      accentForeground: accentForeground,
      destructive: destructive,
      destructiveForeground: destructiveForeground,
      border: border,
      input: input,
      ring: ring,
      radius: radius,
    );
  }
}

@immutable
class ShadcnThemeData {
  factory ShadcnThemeData({
    Color? background,
    Color? foregroung,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
    BorderRadius? radius,
  }) {
    final defaultTheme = ZincTheme.light();
    return ShadcnThemeData.raw(
      background: background ?? defaultTheme.background,
      foreground: foregroung ?? defaultTheme.foreground,
      card: card ?? defaultTheme.card,
      cardForeground: cardForeground ?? defaultTheme.cardForeground,
      popover: popover ?? defaultTheme.popover,
      popoverForeground: popoverForeground ?? defaultTheme.popoverForeground,
      primary: primary ?? defaultTheme.primary,
      primaryForeground: primaryForeground ?? defaultTheme.primaryForeground,
      secondary: secondary ?? defaultTheme.secondary,
      secondaryForeground:
          secondaryForeground ?? defaultTheme.secondaryForeground,
      muted: muted ?? defaultTheme.muted,
      mutedForeground: mutedForeground ?? defaultTheme.mutedForeground,
      accent: accent ?? defaultTheme.accent,
      accentForeground: accentForeground ?? defaultTheme.accentForeground,
      destructive: destructive ?? defaultTheme.destructive,
      destructiveForeground:
          destructiveForeground ?? defaultTheme.destructiveForeground,
      border: border ?? defaultTheme.border,
      input: input ?? defaultTheme.input,
      ring: ring ?? defaultTheme.ring,
      radius: radius ?? defaultTheme.radius,
    );
  }

  const ShadcnThemeData.raw({
    this.background,
    this.foreground,
    this.card,
    this.cardForeground,
    this.popover,
    this.popoverForeground,
    this.primary,
    this.primaryForeground,
    this.secondary,
    this.secondaryForeground,
    this.muted,
    this.mutedForeground,
    this.accent,
    this.accentForeground,
    this.destructive,
    this.destructiveForeground,
    this.border,
    this.input,
    this.ring,
    this.radius,
  });

  final Color? background;
  final Color? foreground;
  final Color? card;
  final Color? cardForeground;
  final Color? popover;
  final Color? popoverForeground;
  final Color? primary;
  final Color? primaryForeground;
  final Color? secondary;
  final Color? secondaryForeground;
  final Color? muted;
  final Color? mutedForeground;
  final Color? accent;
  final Color? accentForeground;
  final Color? destructive;
  final Color? destructiveForeground;
  final Color? border;
  final Color? input;
  final Color? ring;
  final BorderRadius? radius;

  // ignore: prefer_constructors_over_static_methods
  static ShadcnThemeData lerp(ShadcnThemeData a, ShadcnThemeData b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ShadcnThemeData.raw(
      background: Color.lerp(a.background, b.background, t),
      foreground: Color.lerp(a.foreground, b.foreground, t),
      card: Color.lerp(a.card, b.card, t),
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      popover: Color.lerp(a.popover, b.popover, t),
      popoverForeground:
          Color.lerp(a.popoverForeground, b.popoverForeground, t),
      primary: Color.lerp(a.primary, b.primary, t),
      primaryForeground:
          Color.lerp(a.primaryForeground, b.primaryForeground, t),
      secondary: Color.lerp(a.secondary, b.secondary, t),
      secondaryForeground:
          Color.lerp(a.secondaryForeground, b.secondaryForeground, t),
      muted: Color.lerp(a.muted, b.muted, t),
      mutedForeground: Color.lerp(a.mutedForeground, b.mutedForeground, t),
      accent: Color.lerp(a.accent, b.accent, t),
      accentForeground: Color.lerp(a.accentForeground, b.accentForeground, t),
      destructive: Color.lerp(a.destructive, b.destructive, t),
      destructiveForeground:
          Color.lerp(a.destructiveForeground, b.destructiveForeground, t),
      border: Color.lerp(a.border, b.border, t),
      input: Color.lerp(a.input, b.input, t),
      ring: Color.lerp(a.ring, b.ring, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnThemeData &&
        other.background == background &&
        other.foreground == foreground &&
        other.card == card &&
        other.cardForeground == cardForeground &&
        other.popover == popover &&
        other.popoverForeground == popoverForeground &&
        other.primary == primary &&
        other.primaryForeground == primaryForeground &&
        other.secondary == secondary &&
        other.secondaryForeground == secondaryForeground &&
        other.muted == muted &&
        other.mutedForeground == mutedForeground &&
        other.accent == accent &&
        other.accentForeground == accentForeground &&
        other.destructive == destructive &&
        other.destructiveForeground == destructiveForeground &&
        other.border == border &&
        other.input == input &&
        other.ring == ring &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return background.hashCode ^
        foreground.hashCode ^
        card.hashCode ^
        cardForeground.hashCode ^
        popover.hashCode ^
        popoverForeground.hashCode ^
        primary.hashCode ^
        primaryForeground.hashCode ^
        secondary.hashCode ^
        secondaryForeground.hashCode ^
        muted.hashCode ^
        mutedForeground.hashCode ^
        accent.hashCode ^
        accentForeground.hashCode ^
        destructive.hashCode ^
        destructiveForeground.hashCode ^
        border.hashCode ^
        input.hashCode ^
        ring.hashCode ^
        radius.hashCode;
  }
}

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

/// An interpolation between two [ThemeData]s.
///
/// This class specializes the interpolation of [Tween<ThemeData>] to call the
/// [ThemeData.lerp] method.
///
/// See [Tween] for a discussion on how to use interpolation objects.
class ShadcnThemeDataTween extends Tween<ShadcnThemeData> {
  /// Creates a [ThemeData] tween.
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
