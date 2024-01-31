import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadZincColorScheme extends ShadColorScheme {
  const ShadZincColorScheme({
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

  const ShadZincColorScheme.light({
    super.background = const Color(0xFFFFFFFF),
    super.foreground = const Color(0xff09090b),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff09090b),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff09090b),
    super.primary = const Color(0xff18181b),
    super.primaryForeground = const Color(0xfffafafa),
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
    super.ring = const Color(0xff18181b),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadZincColorScheme.dark({
    super.background = const Color(0xff09090b),
    super.foreground = const Color(0xfffafafa),
    super.card = const Color(0xff09090b),
    super.cardForeground = const Color(0xfffafafa),
    super.popover = const Color(0xff09090b),
    super.popoverForeground = const Color(0xfffafafa),
    super.primary = const Color(0xfffafafa),
    super.primaryForeground = const Color(0xff18181b),
    super.secondary = const Color(0xff27272a),
    super.secondaryForeground = const Color(0xfffafafa),
    super.muted = const Color(0xff27272a),
    super.mutedForeground = const Color(0xffa1a1aa),
    super.accent = const Color(0xff27272a),
    super.accentForeground = const Color(0xfffafafa),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfffafafa),
    super.border = const Color(0xff27272a),
    super.input = const Color(0xff27272a),
    super.ring = const Color(0xffd4d4d8),
    super.selection = const Color(0xFF355172),
  });
}
