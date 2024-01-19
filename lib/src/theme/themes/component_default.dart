import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

abstract class ShadcnComponentDefaultTheme {
  static ShadcnButtonTheme primaryButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.9),
      foregroundColor: colorScheme.primaryForeground,
      hoverForegroundColor: colorScheme.primaryForeground,
    );
  }

  static ShadcnButtonTheme secondaryButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      hoverForegroundColor: colorScheme.secondaryForeground,
    );
  }

  static ShadcnButtonTheme destructiveButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.9),
      foregroundColor: colorScheme.destructiveForeground,
      hoverForegroundColor: colorScheme.destructiveForeground,
    );
  }

  static ShadcnButtonTheme outlineButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      border: Border.all(color: colorScheme.input),
    );
  }

  static ShadcnButtonTheme ghostButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
    );
  }

  static ShadcnButtonTheme linkButtonTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnButtonTheme(
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.primary,
      hoverTextDecoration: TextDecoration.underline,
    );
  }

  static ShadcnButtonSizesTheme buttonSizesTheme() {
    return const ShadcnButtonSizesTheme(
      regular: ShadcnButtonSizeTheme(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      sm: ShadcnButtonSizeTheme(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
      lg: ShadcnButtonSizeTheme(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ),
      icon: ShadcnButtonSizeTheme(
        height: 40,
        width: 40,
        padding: EdgeInsets.zero,
      ),
    );
  }

  static ShadcnBadgeTheme primaryBadgeTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnBadgeTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.8),
      foregroundColor: colorScheme.primaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadcnBadgeTheme secondaryBadgeTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnBadgeTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadcnBadgeTheme destructiveBadgeTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnBadgeTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.8),
      foregroundColor: colorScheme.destructiveForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadcnBadgeTheme outlineBadgeTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnBadgeTheme(
      foregroundColor: colorScheme.foreground,
      shape: StadiumBorder(side: BorderSide(color: colorScheme.border)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadcnAvatarTheme avatarTheme({
    required ShadcnColorScheme colorScheme,
  }) {
    return ShadcnAvatarTheme(
      size: const Size.square(40),
      shape: const CircleBorder(),
      backgroundColor: colorScheme.muted,
    );
  }

  static ShadcnTooltipTheme tooltipTheme({
    required ShadcnColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadcnTooltipTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      shadows: ShadcnShadows.md,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: colorScheme.border,
        ),
        color: colorScheme.popover,
        boxShadow: ShadcnShadows.md,
      ),
      alignment: Alignment.topCenter,
      childAlignment: Alignment.bottomCenter,
    );
  }
}
