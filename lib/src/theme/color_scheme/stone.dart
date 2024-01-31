import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadStoneColorScheme extends ShadColorScheme {
  const ShadStoneColorScheme({
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
    required super.selection,
  });

  const ShadStoneColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff0c0a09),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff0c0a09),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff0c0a09),
    super.primary = const Color(0xff1c1917),
    super.primaryForeground = const Color(0xfffafaf9),
    super.secondary = const Color(0xfff5f5f4),
    super.secondaryForeground = const Color(0xff1c1917),
    super.muted = const Color(0xfff5f5f4),
    super.mutedForeground = const Color(0xff78716c),
    super.accent = const Color(0xfff5f5f4),
    super.accentForeground = const Color(0xff1c1917),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfffafaf9),
    super.border = const Color(0xffe7e5e4),
    super.input = const Color(0xffe7e5e4),
    super.ring = const Color(0xff0c0a09),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadStoneColorScheme.dark({
    super.background = const Color(0xff0c0a09),
    super.foreground = const Color(0xfffafaf9),
    super.card = const Color(0xff0c0a09),
    super.cardForeground = const Color(0xfffafaf9),
    super.popover = const Color(0xff0c0a09),
    super.popoverForeground = const Color(0xfffafaf9),
    super.primary = const Color(0xfffafaf9),
    super.primaryForeground = const Color(0xff1c1917),
    super.secondary = const Color(0xff292524),
    super.secondaryForeground = const Color(0xfffafaf9),
    super.muted = const Color(0xff292524),
    super.mutedForeground = const Color(0xffa8a29e),
    super.accent = const Color(0xff292524),
    super.accentForeground = const Color(0xfffafaf9),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfffafaf9),
    super.border = const Color(0xff292524),
    super.input = const Color(0xff292524),
    super.ring = const Color(0xffd6d3d1),
    super.selection = const Color(0xFF355172),
  });
}
