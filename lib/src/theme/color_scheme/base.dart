import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class ShadColorScheme {
  const ShadColorScheme({
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
    required this.selection,
  });

  factory ShadColorScheme.fromName(
    String name, {
    Brightness brightness = Brightness.light,
  }) {
    return switch (name) {
      'blue' => brightness == Brightness.light
          ? const ShadBlueColorScheme.light()
          : const ShadBlueColorScheme.dark(),
      'gray' => brightness == Brightness.light
          ? const ShadGrayColorScheme.light()
          : const ShadGrayColorScheme.dark(),
      'green' => brightness == Brightness.light
          ? const ShadGreenColorScheme.light()
          : const ShadGreenColorScheme.dark(),
      'neutral' => brightness == Brightness.light
          ? const ShadNeutralColorScheme.light()
          : const ShadNeutralColorScheme.dark(),
      'orange' => brightness == Brightness.light
          ? const ShadOrangeColorScheme.light()
          : const ShadOrangeColorScheme.dark(),
      'red' => brightness == Brightness.light
          ? const ShadRedColorScheme.light()
          : const ShadRedColorScheme.dark(),
      'rose' => brightness == Brightness.light
          ? const ShadRoseColorScheme.light()
          : const ShadRoseColorScheme.dark(),
      'slate' => brightness == Brightness.light
          ? const ShadSlateColorScheme.light()
          : const ShadSlateColorScheme.dark(),
      'stone' => brightness == Brightness.light
          ? const ShadStoneColorScheme.light()
          : const ShadStoneColorScheme.dark(),
      'violet' => brightness == Brightness.light
          ? const ShadVioletColorScheme.light()
          : const ShadVioletColorScheme.dark(),
      'yellow' => brightness == Brightness.light
          ? const ShadYellowColorScheme.light()
          : const ShadYellowColorScheme.dark(),
      'zinc' => brightness == Brightness.light
          ? const ShadZincColorScheme.light()
          : const ShadZincColorScheme.dark(),
      _ => throw Exception('Invalid color scheme name'),
    };
  }

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
  final Color selection;

  static ShadColorScheme lerp(
    ShadColorScheme a,
    ShadColorScheme b,
    double t,
  ) {
    return ShadColorScheme(
      background: Color.lerp(a.background, b.background, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t)!,
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
      selection: Color.lerp(a.selection, b.selection, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadColorScheme &&
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
        other.selection == selection;
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
        selection.hashCode;
  }
}
