import 'dart:ui';

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
import 'package:shadcn_ui/src/theme/themes/base.dart';
import 'package:shadcn_ui/src/theme/themes/component_default.dart';

@immutable
class ShadThemeData extends ShadBaseTheme {
  factory ShadThemeData({
    required ShadColorScheme colorScheme,
    required Brightness brightness,
    Iterable<ThemeExtension<dynamic>>? extensions,
    ShadButtonTheme? primaryButtonTheme,
    ShadButtonTheme? secondaryButtonTheme,
    ShadButtonTheme? destructiveButtonTheme,
    ShadButtonTheme? outlineButtonTheme,
    ShadButtonTheme? ghostButtonTheme,
    ShadButtonTheme? linkButtonTheme,
    ShadBadgeTheme? primaryBadgeTheme,
    ShadBadgeTheme? secondaryBadgeTheme,
    ShadBadgeTheme? destructiveBadgeTheme,
    ShadBadgeTheme? outlineBadgeTheme,
    BorderRadius? radius,
    ShadAvatarTheme? avatarTheme,
    ShadButtonSizesTheme? buttonSizesTheme,
    ShadTooltipTheme? tooltipTheme,
    ShadPopoverTheme? popoverTheme,
    ShadDecorationTheme? decoration,
    ShadTextThemeData? textTheme,
    double? disabledOpacity,
    ShadSelectTheme? selectTheme,
    ShadOptionTheme? optionTheme,
    ShadCardTheme? cardTheme,
    ShadSwitchTheme? switchTheme,
    ShadCheckboxTheme? checkboxTheme,
  }) {
    final effectiveRadius =
        radius ?? const BorderRadius.all(Radius.circular(6));
    return ShadThemeData._internal(
      colorScheme: colorScheme,
      brightness: brightness,
      extensions: extensions,
      primaryButtonTheme: ShadComponentDefaultTheme.primaryButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(primaryButtonTheme),
      secondaryButtonTheme: ShadComponentDefaultTheme.secondaryButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(secondaryButtonTheme),
      destructiveButtonTheme: ShadComponentDefaultTheme.destructiveButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(destructiveButtonTheme),
      outlineButtonTheme: ShadComponentDefaultTheme.outlineButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(outlineButtonTheme),
      ghostButtonTheme: ShadComponentDefaultTheme.ghostButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(ghostButtonTheme),
      linkButtonTheme: ShadComponentDefaultTheme.linkButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(linkButtonTheme),
      primaryBadgeTheme: ShadComponentDefaultTheme.primaryBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(primaryBadgeTheme),
      secondaryBadgeTheme: ShadComponentDefaultTheme.secondaryBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(secondaryBadgeTheme),
      destructiveBadgeTheme: ShadComponentDefaultTheme.destructiveBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(destructiveBadgeTheme),
      outlineBadgeTheme: ShadComponentDefaultTheme.outlineBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(outlineBadgeTheme),
      buttonSizesTheme: ShadComponentDefaultTheme.buttonSizesTheme()
          .mergeWith(buttonSizesTheme),
      radius: effectiveRadius,
      avatarTheme: ShadComponentDefaultTheme.avatarTheme(
        colorScheme: colorScheme,
      ).mergeWith(avatarTheme),
      tooltipTheme: ShadComponentDefaultTheme.tooltipTheme(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(tooltipTheme),
      popoverTheme: ShadComponentDefaultTheme.popoverTheme(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(popoverTheme),
      decoration: ShadComponentDefaultTheme.decoration(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(decoration),
      textTheme: ShadComponentDefaultTheme.textTheme(colorScheme: colorScheme)
          .mergeWith(textTheme),
      disabledOpacity: disabledOpacity ?? .5,
      selectTheme:
          ShadComponentDefaultTheme.selectTheme(colorScheme: colorScheme)
              .mergeWith(selectTheme),
      optionTheme: ShadComponentDefaultTheme.optionTheme(
        colorScheme: colorScheme,
      ).mergeWith(optionTheme),
      cardTheme: ShadComponentDefaultTheme.cardTheme(
        colorScheme: colorScheme,
      ).mergeWith(cardTheme),
      switchTheme: ShadComponentDefaultTheme.switchTheme(
        colorScheme: colorScheme,
      ).mergeWith(switchTheme),
      checkboxTheme: ShadComponentDefaultTheme.checkboxTheme(
        colorScheme: colorScheme,
      ).mergeWith(checkboxTheme),
    );
  }

  const ShadThemeData._internal({
    required super.colorScheme,
    required super.brightness,
    required super.extensions,
    required super.primaryButtonTheme,
    required super.secondaryButtonTheme,
    required super.destructiveButtonTheme,
    required super.outlineButtonTheme,
    required super.ghostButtonTheme,
    required super.linkButtonTheme,
    required super.primaryBadgeTheme,
    required super.secondaryBadgeTheme,
    required super.destructiveBadgeTheme,
    required super.outlineBadgeTheme,
    required super.radius,
    required super.avatarTheme,
    required super.buttonSizesTheme,
    required super.tooltipTheme,
    required super.popoverTheme,
    required super.decoration,
    required super.textTheme,
    required super.disabledOpacity,
    required super.selectTheme,
    required super.optionTheme,
    required super.cardTheme,
    required super.switchTheme,
    required super.checkboxTheme,
  });

  static ShadThemeData lerp(ShadThemeData a, ShadThemeData b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ShadThemeData(
      colorScheme: ShadColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      brightness: b.brightness,
      primaryButtonTheme:
          ShadButtonTheme.lerp(a.primaryButtonTheme, b.primaryButtonTheme, t),
      secondaryButtonTheme: ShadButtonTheme.lerp(
        a.secondaryButtonTheme,
        b.secondaryButtonTheme,
        t,
      ),
      destructiveButtonTheme: ShadButtonTheme.lerp(
        a.destructiveButtonTheme,
        b.destructiveButtonTheme,
        t,
      ),
      outlineButtonTheme:
          ShadButtonTheme.lerp(a.outlineButtonTheme, b.outlineButtonTheme, t),
      ghostButtonTheme:
          ShadButtonTheme.lerp(a.ghostButtonTheme, b.ghostButtonTheme, t),
      linkButtonTheme:
          ShadButtonTheme.lerp(a.linkButtonTheme, b.linkButtonTheme, t),
      primaryBadgeTheme:
          ShadBadgeTheme.lerp(a.primaryBadgeTheme, b.primaryBadgeTheme, t),
      secondaryBadgeTheme: ShadBadgeTheme.lerp(
        a.secondaryBadgeTheme,
        b.secondaryBadgeTheme,
        t,
      ),
      destructiveBadgeTheme: ShadBadgeTheme.lerp(
        a.destructiveBadgeTheme,
        b.destructiveBadgeTheme,
        t,
      ),
      outlineBadgeTheme:
          ShadBadgeTheme.lerp(a.outlineBadgeTheme, b.outlineBadgeTheme, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      avatarTheme: ShadAvatarTheme.lerp(a.avatarTheme, b.avatarTheme, t),
      buttonSizesTheme: ShadButtonSizesTheme.lerp(
        a.buttonSizesTheme,
        b.buttonSizesTheme,
        t,
      ),
      tooltipTheme: ShadTooltipTheme.lerp(a.tooltipTheme, b.tooltipTheme, t),
      popoverTheme: ShadPopoverTheme.lerp(a.popoverTheme, b.popoverTheme, t),
      decoration: ShadDecorationTheme.lerp(a.decoration, b.decoration, t),
      textTheme: ShadTextThemeData.lerp(a.textTheme, b.textTheme, t),
      disabledOpacity: lerpDouble(a.disabledOpacity, b.disabledOpacity, t),
      selectTheme: ShadSelectTheme.lerp(a.selectTheme, b.selectTheme, t),
      optionTheme: ShadOptionTheme.lerp(a.optionTheme, b.optionTheme, t),
      cardTheme: ShadCardTheme.lerp(a.cardTheme, b.cardTheme, t),
      switchTheme: ShadSwitchTheme.lerp(a.switchTheme, b.switchTheme, t),
      checkboxTheme:
          ShadCheckboxTheme.lerp(a.checkboxTheme, b.checkboxTheme, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadBaseTheme &&
        other.colorScheme == colorScheme &&
        other.brightness == brightness &&
        other.primaryButtonTheme == primaryButtonTheme &&
        other.secondaryButtonTheme == secondaryButtonTheme &&
        other.destructiveButtonTheme == destructiveButtonTheme &&
        other.outlineButtonTheme == outlineButtonTheme &&
        other.ghostButtonTheme == ghostButtonTheme &&
        other.linkButtonTheme == linkButtonTheme &&
        other.primaryBadgeTheme == primaryBadgeTheme &&
        other.secondaryBadgeTheme == secondaryBadgeTheme &&
        other.destructiveBadgeTheme == destructiveBadgeTheme &&
        other.outlineBadgeTheme == outlineBadgeTheme &&
        other.radius == radius &&
        other.avatarTheme == avatarTheme &&
        other.buttonSizesTheme == buttonSizesTheme &&
        other.tooltipTheme == tooltipTheme &&
        other.popoverTheme == popoverTheme &&
        other.decoration == decoration &&
        other.textTheme == textTheme &&
        other.disabledOpacity == disabledOpacity &&
        other.selectTheme == selectTheme &&
        other.optionTheme == optionTheme &&
        other.cardTheme == cardTheme &&
        other.optionTheme == optionTheme &&
        other.switchTheme == switchTheme &&
        other.checkboxTheme == checkboxTheme;
  }

  @override
  int get hashCode {
    return colorScheme.hashCode ^
        brightness.hashCode ^
        primaryButtonTheme.hashCode ^
        secondaryButtonTheme.hashCode ^
        destructiveButtonTheme.hashCode ^
        outlineButtonTheme.hashCode ^
        ghostButtonTheme.hashCode ^
        linkButtonTheme.hashCode ^
        primaryBadgeTheme.hashCode ^
        secondaryBadgeTheme.hashCode ^
        outlineBadgeTheme.hashCode ^
        destructiveBadgeTheme.hashCode ^
        radius.hashCode ^
        avatarTheme.hashCode ^
        buttonSizesTheme.hashCode ^
        tooltipTheme.hashCode ^
        popoverTheme.hashCode ^
        decoration.hashCode ^
        textTheme.hashCode ^
        disabledOpacity.hashCode ^
        selectTheme.hashCode ^
        optionTheme.hashCode ^
        cardTheme.hashCode ^
        optionTheme.hashCode ^
        switchTheme.hashCode ^
        checkboxTheme.hashCode;
  }

  ShadThemeData copyWith({
    ShadColorScheme? colorScheme,
    ShadButtonTheme? primaryButtonTheme,
    ShadButtonTheme? secondaryButtonTheme,
    ShadButtonTheme? destructiveButtonTheme,
    ShadButtonTheme? outlineButtonTheme,
    ShadButtonTheme? ghostButtonTheme,
    ShadButtonTheme? linkButtonTheme,
    ShadBadgeTheme? primaryBadgeTheme,
    ShadBadgeTheme? secondaryBadgeTheme,
    ShadBadgeTheme? destructiveBadgeTheme,
    ShadBadgeTheme? outlineBadgeTheme,
    Brightness? brightness,
    Iterable<ThemeExtension<dynamic>>? extensions,
    BorderRadius? radius,
    ShadAvatarTheme? avatarTheme,
    ShadButtonSizesTheme? buttonSizesTheme,
    ShadTooltipTheme? tooltipTheme,
    ShadPopoverTheme? popoverTheme,
    ShadDecorationTheme? decoration,
    ShadTextThemeData? textTheme,
    double? disabledOpacity,
    ShadSelectTheme? selectTheme,
    ShadOptionTheme? optionTheme,
    ShadCardTheme? cardTheme,
    ShadSwitchTheme? switchTheme,
    ShadCheckboxTheme? checkboxTheme,
  }) {
    return ShadThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      extensions: extensions ?? this.extensions,
      brightness: brightness ?? this.brightness,
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      destructiveButtonTheme:
          destructiveButtonTheme ?? this.destructiveButtonTheme,
      outlineButtonTheme: outlineButtonTheme ?? this.outlineButtonTheme,
      ghostButtonTheme: ghostButtonTheme ?? this.ghostButtonTheme,
      linkButtonTheme: linkButtonTheme ?? this.linkButtonTheme,
      primaryBadgeTheme: primaryBadgeTheme ?? this.primaryBadgeTheme,
      secondaryBadgeTheme: secondaryBadgeTheme ?? this.secondaryBadgeTheme,
      destructiveBadgeTheme:
          destructiveBadgeTheme ?? this.destructiveBadgeTheme,
      outlineBadgeTheme: outlineBadgeTheme ?? this.outlineBadgeTheme,
      radius: radius ?? this.radius,
      avatarTheme: avatarTheme ?? this.avatarTheme,
      buttonSizesTheme: buttonSizesTheme ?? this.buttonSizesTheme,
      tooltipTheme: tooltipTheme ?? this.tooltipTheme,
      popoverTheme: popoverTheme ?? this.popoverTheme,
      decoration: decoration ?? this.decoration,
      textTheme: textTheme ?? this.textTheme,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
      selectTheme: selectTheme ?? this.selectTheme,
      optionTheme: optionTheme ?? this.optionTheme,
      cardTheme: cardTheme ?? this.cardTheme,
      switchTheme: switchTheme ?? this.switchTheme,
      checkboxTheme: checkboxTheme ?? this.checkboxTheme,
    );
  }
}
