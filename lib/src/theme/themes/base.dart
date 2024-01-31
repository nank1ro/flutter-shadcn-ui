import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/checkbox.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/option.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/data.dart';

@immutable
abstract class ShadBaseTheme {
  const ShadBaseTheme({
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
    required this.disabledOpacity,
    required this.selectTheme,
    required this.optionTheme,
    required this.cardTheme,
    required this.switchTheme,
    required this.checkboxTheme,
  });

  final ShadColorScheme colorScheme;
  final Brightness brightness;
  final Iterable<ThemeExtension<dynamic>>? extensions;
  final ShadButtonTheme primaryButtonTheme;
  final ShadButtonTheme secondaryButtonTheme;
  final ShadButtonTheme destructiveButtonTheme;
  final ShadButtonTheme outlineButtonTheme;
  final ShadButtonTheme ghostButtonTheme;
  final ShadButtonTheme linkButtonTheme;
  final ShadBadgeTheme primaryBadgeTheme;
  final ShadBadgeTheme secondaryBadgeTheme;
  final ShadBadgeTheme destructiveBadgeTheme;
  final ShadBadgeTheme outlineBadgeTheme;
  final BorderRadius radius;
  final ShadAvatarTheme avatarTheme;
  final ShadButtonSizesTheme buttonSizesTheme;
  final ShadTooltipTheme tooltipTheme;
  final ShadPopoverTheme popoverTheme;
  final ShadDecorationTheme decoration;
  final ShadTextThemeData textTheme;
  final double disabledOpacity;
  final ShadSelectTheme selectTheme;
  final ShadOptionTheme optionTheme;
  final ShadCardTheme cardTheme;
  final ShadSwitchTheme switchTheme;
  final ShadCheckboxTheme checkboxTheme;
}
