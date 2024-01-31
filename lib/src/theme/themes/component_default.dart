import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/card.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/option.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/select.dart';
import 'package:shadcn_ui/src/theme/components/switch.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/data.dart';
import 'package:shadcn_ui/src/theme/text_theme/defaults.dart';
import 'package:shadcn_ui/src/theme/themes/shadows.dart';

abstract class ShadComponentDefaultTheme {
  static ShadButtonTheme primaryButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.9),
      foregroundColor: colorScheme.primaryForeground,
      hoverForegroundColor: colorScheme.primaryForeground,
    );
  }

  static ShadButtonTheme secondaryButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      hoverForegroundColor: colorScheme.secondaryForeground,
    );
  }

  static ShadButtonTheme destructiveButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.9),
      foregroundColor: colorScheme.destructiveForeground,
      hoverForegroundColor: colorScheme.destructiveForeground,
    );
  }

  static ShadButtonTheme outlineButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
      border: Border.all(color: colorScheme.input),
    );
  }

  static ShadButtonTheme ghostButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      hoverBackgroundColor: colorScheme.accent,
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.accentForeground,
    );
  }

  static ShadButtonTheme linkButtonTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadButtonTheme(
      foregroundColor: colorScheme.primary,
      hoverForegroundColor: colorScheme.primary,
      hoverTextDecoration: TextDecoration.underline,
    );
  }

  static ShadButtonSizesTheme buttonSizesTheme() {
    return const ShadButtonSizesTheme(
      regular: ShadButtonSizeTheme(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      sm: ShadButtonSizeTheme(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
      lg: ShadButtonSizeTheme(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      ),
      icon: ShadButtonSizeTheme(
        height: 40,
        width: 40,
        padding: EdgeInsets.zero,
      ),
    );
  }

  static ShadBadgeTheme primaryBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.primary,
      hoverBackgroundColor: colorScheme.primary.withOpacity(.8),
      foregroundColor: colorScheme.primaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme secondaryBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.secondary,
      hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
      foregroundColor: colorScheme.secondaryForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme destructiveBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      backgroundColor: colorScheme.destructive,
      hoverBackgroundColor: colorScheme.destructive.withOpacity(.8),
      foregroundColor: colorScheme.destructiveForeground,
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadBadgeTheme outlineBadgeTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadBadgeTheme(
      foregroundColor: colorScheme.foreground,
      shape: StadiumBorder(side: BorderSide(color: colorScheme.border)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    );
  }

  static ShadAvatarTheme avatarTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadAvatarTheme(
      size: const Size.square(40),
      shape: const CircleBorder(),
      backgroundColor: colorScheme.muted,
    );
  }

  static ShadTooltipTheme tooltipTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadTooltipTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      shadows: ShadShadows.md,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: colorScheme.border,
        ),
        color: colorScheme.popover,
        boxShadow: ShadShadows.md,
      ),
      alignment: Alignment.topCenter,
      childAlignment: Alignment.bottomCenter,
    );
  }

  static ShadPopoverTheme popoverTheme({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadPopoverTheme(
      effects: const [
        FadeEffect(),
        ScaleEffect(begin: Offset(.95, .95), end: Offset(1, 1)),
        MoveEffect(begin: Offset(0, 2), end: Offset.zero),
      ],
      shadows: ShadShadows.md,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: colorScheme.border,
        ),
        color: colorScheme.popover,
        boxShadow: ShadShadows.md,
      ),
      alignment: Alignment.bottomCenter,
      childAlignment: Alignment.topCenter,
    );
  }

  static ShadDecorationTheme decoration({
    required ShadColorScheme colorScheme,
    required BorderRadius radius,
  }) {
    return ShadDecorationTheme(
      border: const ShadBorder(padding: EdgeInsets.all(4)),
      focusedBorder: ShadBorder(
        width: 2,
        color: colorScheme.ring,
        radius: radius.add(radius / 2),
        padding: const EdgeInsets.all(2),
      ),
    );
  }

  static ShadTextThemeData textTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadTextThemeData(
      h1Large: ShadTextDefaultTheme.h1Large(colorScheme: colorScheme),
      h1: ShadTextDefaultTheme.h1(colorScheme: colorScheme),
      h2: ShadTextDefaultTheme.h2(colorScheme: colorScheme),
      h3: ShadTextDefaultTheme.h3(colorScheme: colorScheme),
      h4: ShadTextDefaultTheme.h4(colorScheme: colorScheme),
      p: ShadTextDefaultTheme.p(colorScheme: colorScheme),
      blockquote: ShadTextDefaultTheme.blockquote(colorScheme: colorScheme),
      table: ShadTextDefaultTheme.table(colorScheme: colorScheme),
      list: ShadTextDefaultTheme.list(colorScheme: colorScheme),
      lead: ShadTextDefaultTheme.lead(colorScheme: colorScheme),
      large: ShadTextDefaultTheme.large(colorScheme: colorScheme),
      small: ShadTextDefaultTheme.small(colorScheme: colorScheme),
      muted: ShadTextDefaultTheme.muted(colorScheme: colorScheme),
    );
  }

  static ShadSelectTheme selectTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadSelectTheme(
      minWidth: kDefaultSelectMinWidth,
      maxHeight: kDefaultSelectMaxHeight,
      offset: const Offset(4, 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      backgroundColor: colorScheme.background,
      border: Border.all(color: colorScheme.input),
      optionsPadding: const EdgeInsets.all(4),
      showScrollToTopChevron: true,
      showScrollToBottomChevron: true,
    );
  }

  static ShadOptionTheme optionTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadOptionTheme(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      hoveredBackgroundColor: colorScheme.accent,
    );
  }

  static ShadCardTheme cardTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadCardTheme(
      backgroundColor: colorScheme.card,
      padding: const EdgeInsets.all(24),
      border: Border.all(color: colorScheme.border),
      radius: const BorderRadius.all(Radius.circular(8)),
      shadows: ShadShadows.sm,
    );
  }

  static ShadSwitchTheme switchTheme({
    required ShadColorScheme colorScheme,
  }) {
    return ShadSwitchTheme(
      radius: const BorderRadius.all(Radius.circular(24)),
      width: 44,
      margin: 2,
      duration: 100.milliseconds,
      thumbColor: colorScheme.background,
      uncheckedTrackColor: colorScheme.input,
      checkedTrackColor: colorScheme.primary,
      decoration: ShadDecorationTheme(
        border: const ShadBorder(width: 4, color: Colors.transparent),
        focusedBorder: ShadBorder(
          width: 2,
          color: colorScheme.ring,
          // the outer radius is calculated as
          // outerRadius = innerRadius + innerRadius / 2
          // outerRadius = 24 + 24 / 2 = 36
          radius: const BorderRadius.all(Radius.circular(36)),
          padding: const EdgeInsets.all(2),
        ),
      ),
    );
  }
}
