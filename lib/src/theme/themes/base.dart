import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/data.dart';

@immutable
abstract class ShadcnBaseTheme {
  const ShadcnBaseTheme({
    required this.colorScheme,
    required this.brightness,
    required this.extensions,
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.destructiveButtonTheme,
    required this.outlineButtonTheme,
    required this.ghostButtonTheme,
    required this.linkButtonTheme,
    required this.primaryBadgeTheme,
    required this.secondaryBadgeTheme,
    required this.destructiveBadgeTheme,
    required this.outlineBadgeTheme,
    required this.radius,
    required this.avatarTheme,
    required this.buttonSizesTheme,
    required this.tooltipTheme,
    required this.popoverTheme,
    required this.decoration,
    required this.textTheme,
  });

  final ShadcnColorScheme colorScheme;
  final Brightness brightness;
  final Iterable<ThemeExtension<dynamic>>? extensions;
  final ShadcnButtonTheme primaryButtonTheme;
  final ShadcnButtonTheme secondaryButtonTheme;
  final ShadcnButtonTheme destructiveButtonTheme;
  final ShadcnButtonTheme outlineButtonTheme;
  final ShadcnButtonTheme ghostButtonTheme;
  final ShadcnButtonTheme linkButtonTheme;
  final ShadcnBadgeTheme primaryBadgeTheme;
  final ShadcnBadgeTheme secondaryBadgeTheme;
  final ShadcnBadgeTheme destructiveBadgeTheme;
  final ShadcnBadgeTheme outlineBadgeTheme;
  final BorderRadius radius;
  final ShadcnAvatarTheme avatarTheme;
  final ShadcnButtonSizesTheme buttonSizesTheme;
  final ShadcnTooltipTheme tooltipTheme;
  final ShadcnPopoverTheme popoverTheme;
  final ShadcnDecorationTheme decoration;
  final ShadcnTextThemeData textTheme;
}
