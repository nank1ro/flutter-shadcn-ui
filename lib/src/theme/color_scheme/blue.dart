import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

@immutable
class ShadBlueColorScheme extends ShadColorScheme {
  const ShadBlueColorScheme({
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

  const ShadBlueColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff020817),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff020817),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff020817),
    super.primary = const Color(0xff2563eb),
    super.primaryForeground = const Color(0xfff8fafc),
    super.secondary = const Color(0xfff1f5f9),
    super.secondaryForeground = const Color(0xff0f172a),
    super.muted = const Color(0xfff1f5f9),
    super.mutedForeground = const Color(0xff64748b),
    super.accent = const Color(0xfff1f5f9),
    super.accentForeground = const Color(0xff0f172a),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xffe2e8f0),
    super.input = const Color(0xffe2e8f0),
    super.ring = const Color(0xff2563eb),
    super.selection = const Color(0xFFB4D7FF),
  });

  const ShadBlueColorScheme.dark({
    super.background = const Color(0xff020817),
    super.foreground = const Color(0xfff8fafc),
    super.card = const Color(0xff020817),
    super.cardForeground = const Color(0xfff8fafc),
    super.popover = const Color(0xff020817),
    super.popoverForeground = const Color(0xfff8fafc),
    super.primary = const Color(0xff3b82f6),
    super.primaryForeground = const Color(0xff0f172a),
    super.secondary = const Color(0xff1e293b),
    super.secondaryForeground = const Color(0xfff8fafc),
    super.muted = const Color(0xff1e293b),
    super.mutedForeground = const Color(0xff94a3b8),
    super.accent = const Color(0xff1e293b),
    super.accentForeground = const Color(0xfff8fafc),
    super.destructive = const Color(0xff7f1d1d),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xff1e293b),
    super.input = const Color(0xff1e293b),
    super.ring = const Color(0xff1d4ed8),
    super.selection = const Color(0xFF355172),
  });
}
