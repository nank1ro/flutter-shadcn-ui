import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadRoseColorScheme extends ShadColorScheme {
  const ShadRoseColorScheme({
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

  const ShadRoseColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff09090b),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff09090b),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff09090b),
    super.primary = const Color(0xffe11d48),
    super.primaryForeground = const Color(0xfffff1f2),
    super.secondary = const Color(0xfff4f4f5),
    super.secondaryForeground = const Color(0xff18181b),
    super.muted = const Color(0xfff4f4f5),
    super.mutedForeground = const Color(0xff71717a),
    super.accent = const Color(0xfff4f4f5),
    super.accentForeground = const Color(0xff18181b),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfffafafa),
    super.border = const Color(0xffe4e4e7),
    super.input = const Color(0xffe4e4e7),
    super.ring = const Color(0xffe11d48),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadRoseColorScheme.dark({
    super.background = const Color(0xff0c0a09),
    super.foreground = const Color(0xfff2f2f2),
    super.card = const Color(0xff1c1917),
    super.cardForeground = const Color(0xfff2f2f2),
    super.popover = const Color(0xff171717),
    super.popoverForeground = const Color(0xfff2f2f2),
    super.primary = const Color(0xffe11d48),
    super.primaryForeground = const Color(0xfffff1f2),
    super.secondary = const Color(0xff27272a),
    super.secondaryForeground = const Color(0xfffafafa),
    super.muted = const Color(0xff262626),
    super.mutedForeground = const Color(0xffa1a1aa),
    super.accent = const Color(0xff292524),
    super.accentForeground = const Color(0xfffafafa),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfffef2f2),
    super.border = const Color(0xff27272a),
    super.input = const Color(0xff27272a),
    super.ring = const Color(0xffe11d48),
    super.selection = const Color(0xFF355172),
  });
}
