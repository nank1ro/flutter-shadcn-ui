import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadNeutralColorScheme extends ShadColorScheme {
  const ShadNeutralColorScheme({
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

  const ShadNeutralColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff0a0a0a),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff0a0a0a),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff0a0a0a),
    super.primary = const Color(0xff171717),
    super.primaryForeground = const Color(0xfffafafa),
    super.secondary = const Color(0xfff5f5f5),
    super.secondaryForeground = const Color(0xff171717),
    super.muted = const Color(0xfff5f5f5),
    super.mutedForeground = const Color(0xff737373),
    super.accent = const Color(0xfff5f5f5),
    super.accentForeground = const Color(0xff171717),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfffafafa),
    super.border = const Color(0xffe5e5e5),
    super.input = const Color(0xffe5e5e5),
    super.ring = const Color(0xff0a0a0a),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadNeutralColorScheme.dark({
    super.background = const Color(0xff0a0a0a),
    super.foreground = const Color(0xfffafafa),
    super.card = const Color(0xff0a0a0a),
    super.cardForeground = const Color(0xfffafafa),
    super.popover = const Color(0xff0a0a0a),
    super.popoverForeground = const Color(0xfffafafa),
    super.primary = const Color(0xfffafafa),
    super.primaryForeground = const Color(0xff171717),
    super.secondary = const Color(0xff262626),
    super.secondaryForeground = const Color(0xfffafafa),
    super.muted = const Color(0xff262626),
    super.mutedForeground = const Color(0xffa3a3a3),
    super.accent = const Color(0xff262626),
    super.accentForeground = const Color(0xfffafafa),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfffafafa),
    super.border = const Color(0xff262626),
    super.input = const Color(0xff262626),
    super.ring = const Color(0xffd4d4d4),
    super.selection = const Color(0xFF355172),
  });
}
