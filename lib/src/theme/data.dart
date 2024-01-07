import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';

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
    Brightness? brightness,
  }) {
    return ShadcnThemeData.raw(
      background: background ?? shadcnDefaultTheme.background,
      foreground: foregroung ?? shadcnDefaultTheme.foreground,
      card: card ?? shadcnDefaultTheme.card,
      cardForeground: cardForeground ?? shadcnDefaultTheme.cardForeground,
      popover: popover ?? shadcnDefaultTheme.popover,
      popoverForeground:
          popoverForeground ?? shadcnDefaultTheme.popoverForeground,
      primary: primary ?? shadcnDefaultTheme.primary,
      primaryForeground:
          primaryForeground ?? shadcnDefaultTheme.primaryForeground,
      secondary: secondary ?? shadcnDefaultTheme.secondary,
      secondaryForeground:
          secondaryForeground ?? shadcnDefaultTheme.secondaryForeground,
      muted: muted ?? shadcnDefaultTheme.muted,
      mutedForeground: mutedForeground ?? shadcnDefaultTheme.mutedForeground,
      accent: accent ?? shadcnDefaultTheme.accent,
      accentForeground: accentForeground ?? shadcnDefaultTheme.accentForeground,
      destructive: destructive ?? shadcnDefaultTheme.destructive,
      destructiveForeground:
          destructiveForeground ?? shadcnDefaultTheme.destructiveForeground,
      border: border ?? shadcnDefaultTheme.border,
      input: input ?? shadcnDefaultTheme.input,
      ring: ring ?? shadcnDefaultTheme.ring,
      radius: radius ?? shadcnDefaultTheme.radius,
      brightness: brightness ?? shadcnDefaultTheme.brightness,
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
    this.brightness = Brightness.light,
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
  final Brightness brightness;

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

    return other is ShadcnBaseTheme &&
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
