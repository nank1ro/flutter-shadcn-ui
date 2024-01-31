import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadGrayColorScheme extends ShadColorScheme {
  const ShadGrayColorScheme({
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

  const ShadGrayColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff030712),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff030712),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff030712),
    super.primary = const Color(0xff111827),
    super.primaryForeground = const Color(0xfff9fafb),
    super.secondary = const Color(0xfff3f4f6),
    super.secondaryForeground = const Color(0xff111827),
    super.muted = const Color(0xfff3f4f6),
    super.mutedForeground = const Color(0xff6b7280),
    super.accent = const Color(0xfff3f4f6),
    super.accentForeground = const Color(0xff111827),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfff9fafb),
    super.border = const Color(0xffe5e7eb),
    super.input = const Color(0xffe5e7eb),
    super.ring = const Color(0xff030712),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadGrayColorScheme.dark({
    super.background = const Color(0xff030712),
    super.foreground = const Color(0xfff9fafb),
    super.card = const Color(0xff030712),
    super.cardForeground = const Color(0xfff9fafb),
    super.popover = const Color(0xff030712),
    super.popoverForeground = const Color(0xfff9fafb),
    super.primary = const Color(0xfff9fafb),
    super.primaryForeground = const Color(0xff111827),
    super.secondary = const Color(0xff1f2937),
    super.secondaryForeground = const Color(0xfff9fafb),
    super.muted = const Color(0xff1f2937),
    super.mutedForeground = const Color(0xff9ca3af),
    super.accent = const Color(0xff1f2937),
    super.accentForeground = const Color(0xfff9fafb),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfff9fafb),
    super.border = const Color(0xff1f2937),
    super.input = const Color(0xff1f2937),
    super.ring = const Color(0xffd1d5db),
    super.selection = const Color(0xFF355172),
  });
}
