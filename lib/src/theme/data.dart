import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';

@immutable
class ShadcnThemeData extends ShadcnBaseTheme {
  const ShadcnThemeData({
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
    required super.brightness,
    required super.primaryButtonTheme,
    required super.secondaryButtonTheme,
    required super.destructiveButtonTheme,
    required super.outlineButtonTheme,
    required super.ghostButtonTheme,
    required super.linkButtonTheme,
    required super.primaryBadgeTheme,
    required super.secondaryBadgeTheme,
    required super.destructiveBadgeTheme,
    required super.outlineBadgeTheme,
  });

  static ShadcnThemeData lerp(ShadcnThemeData a, ShadcnThemeData b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ShadcnThemeData(
      background: Color.lerp(a.background, b.background, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t)!,
      radius: BorderRadius.lerp(a.radius, b.radius, t)!,
      popover: Color.lerp(a.popover, b.popover, t)!,
      popoverForeground:
          Color.lerp(a.popoverForeground, b.popoverForeground, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      primaryForeground:
          Color.lerp(a.primaryForeground, b.primaryForeground, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      secondaryForeground:
          Color.lerp(a.secondaryForeground, b.secondaryForeground, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      mutedForeground: Color.lerp(a.mutedForeground, b.mutedForeground, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentForeground: Color.lerp(a.accentForeground, b.accentForeground, t)!,
      destructive: Color.lerp(a.destructive, b.destructive, t)!,
      destructiveForeground:
          Color.lerp(a.destructiveForeground, b.destructiveForeground, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      input: Color.lerp(a.input, b.input, t)!,
      ring: Color.lerp(a.ring, b.ring, t)!,
      brightness: b.brightness,
      primaryButtonTheme:
          a.primaryButtonTheme != null && b.primaryButtonTheme != null
              ? ShadcnButtonTheme.lerp(
                  a.primaryButtonTheme!,
                  b.primaryButtonTheme!,
                  t,
                )
              : null,
      secondaryButtonTheme:
          a.secondaryButtonTheme != null && b.secondaryButtonTheme != null
              ? ShadcnButtonTheme.lerp(
                  a.secondaryButtonTheme!,
                  b.secondaryButtonTheme!,
                  t,
                )
              : null,
      destructiveButtonTheme:
          a.destructiveButtonTheme != null && b.destructiveButtonTheme != null
              ? ShadcnButtonTheme.lerp(
                  a.destructiveButtonTheme!,
                  b.destructiveButtonTheme!,
                  t,
                )
              : null,
      outlineButtonTheme:
          a.outlineButtonTheme != null && b.outlineButtonTheme != null
              ? ShadcnButtonTheme.lerp(
                  a.outlineButtonTheme!,
                  b.outlineButtonTheme!,
                  t,
                )
              : null,
      ghostButtonTheme:
          a.ghostButtonTheme != null && b.outlineButtonTheme != null
              ? ShadcnButtonTheme.lerp(
                  a.ghostButtonTheme!,
                  b.ghostButtonTheme!,
                  t,
                )
              : null,
      linkButtonTheme: a.linkButtonTheme != null && b.linkButtonTheme != null
          ? ShadcnButtonTheme.lerp(
              a.linkButtonTheme!,
              b.linkButtonTheme!,
              t,
            )
          : null,
      primaryBadgeTheme:
          a.primaryBadgeTheme != null && b.primaryBadgeTheme != null
              ? ShadcnBadgeTheme.lerp(
                  a.primaryBadgeTheme!,
                  b.primaryBadgeTheme!,
                  t,
                )
              : null,
      secondaryBadgeTheme:
          a.secondaryBadgeTheme != null && b.secondaryBadgeTheme != null
              ? ShadcnBadgeTheme.lerp(
                  a.secondaryBadgeTheme!,
                  b.secondaryBadgeTheme!,
                  t,
                )
              : null,
      destructiveBadgeTheme:
          a.destructiveBadgeTheme != null && b.destructiveBadgeTheme != null
              ? ShadcnBadgeTheme.lerp(
                  a.destructiveBadgeTheme!,
                  b.destructiveBadgeTheme!,
                  t,
                )
              : null,
      outlineBadgeTheme:
          a.outlineBadgeTheme != null && b.outlineBadgeTheme != null
              ? ShadcnBadgeTheme.lerp(
                  a.outlineBadgeTheme!,
                  b.outlineBadgeTheme!,
                  t,
                )
              : null,
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
        other.radius == radius &&
        other.brightness == brightness &&
        other.primaryButtonTheme == primaryButtonTheme &&
        other.secondaryButtonTheme == secondaryButtonTheme &&
        other.destructiveButtonTheme == destructiveButtonTheme &&
        other.outlineButtonTheme == outlineButtonTheme &&
        other.ghostButtonTheme == ghostButtonTheme &&
        other.linkButtonTheme == linkButtonTheme &&
        other.primaryBadgeTheme == primaryBadgeTheme &&
        other.secondaryBadgeTheme == secondaryBadgeTheme &&
        other.destructiveBadgeTheme == destructiveBadgeTheme &&
        other.outlineBadgeTheme == outlineBadgeTheme;
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
        radius.hashCode ^
        brightness.hashCode ^
        primaryButtonTheme.hashCode ^
        secondaryButtonTheme.hashCode ^
        destructiveButtonTheme.hashCode ^
        outlineButtonTheme.hashCode ^
        ghostButtonTheme.hashCode ^
        linkButtonTheme.hashCode ^
        primaryBadgeTheme.hashCode ^
        secondaryBadgeTheme.hashCode ^
        outlineBadgeTheme.hashCode ^
        destructiveBadgeTheme.hashCode;
  }

  ShadcnThemeData copyWith({
    Color? background,
    Color? foreground,
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
    ShadcnButtonTheme? primaryButtonTheme,
    ShadcnButtonTheme? secondaryButtonTheme,
    ShadcnButtonTheme? destructiveButtonTheme,
    ShadcnButtonTheme? outlineButtonTheme,
    ShadcnButtonTheme? ghostButtonTheme,
    ShadcnButtonTheme? linkButtonTheme,
    ShadcnBadgeTheme? primaryBadgeTheme,
    ShadcnBadgeTheme? secondaryBadgeTheme,
    ShadcnBadgeTheme? destructiveBadgeTheme,
    ShadcnBadgeTheme? outlineBadgeTheme,
  }) {
    return ShadcnThemeData(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      popover: popover ?? this.popover,
      popoverForeground: popoverForeground ?? this.popoverForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      destructive: destructive ?? this.destructive,
      destructiveForeground:
          destructiveForeground ?? this.destructiveForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      radius: radius ?? this.radius,
      brightness: brightness,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      destructiveButtonTheme:
          destructiveButtonTheme ?? this.destructiveButtonTheme,
      outlineButtonTheme: outlineButtonTheme ?? this.outlineButtonTheme,
      ghostButtonTheme: ghostButtonTheme ?? this.ghostButtonTheme,
      linkButtonTheme: linkButtonTheme ?? this.linkButtonTheme,
      primaryBadgeTheme: primaryBadgeTheme ?? this.primaryBadgeTheme,
      secondaryBadgeTheme: secondaryBadgeTheme ?? this.secondaryBadgeTheme,
      destructiveBadgeTheme:
          destructiveBadgeTheme ?? this.destructiveBadgeTheme,
      outlineBadgeTheme: outlineBadgeTheme ?? this.outlineBadgeTheme,
    );
  }
}
