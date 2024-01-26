import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/avatar.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/components/popover.dart';
import 'package:shadcn_ui/src/theme/components/tooltip.dart';
import 'package:shadcn_ui/src/theme/text_theme/data.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';
import 'package:shadcn_ui/src/theme/themes/component_default.dart';

@immutable
class ShadcnThemeData extends ShadcnBaseTheme {
  factory ShadcnThemeData({
    required ShadcnColorScheme colorScheme,
    required Brightness brightness,
    Iterable<ThemeExtension<dynamic>>? extensions,
    ShadcnButtonTheme? primaryButtonTheme,
    ShadcnButtonTheme? secondaryButtonTheme,
    ShadcnButtonTheme? destructiveButtonTheme,
    ShadcnButtonTheme? outlineButtonTheme,
    ShadcnButtonTheme? ghostButtonTheme,
    ShadcnButtonTheme? linkButtonTheme,
    ShadcnBadgeTheme? primaryBadgeTheme,
    ShadcnBadgeTheme? secondaryBadgeTheme,
    ShadcnBadgeTheme? destructiveBadgeTheme,
    ShadcnBadgeTheme? outlineBadgeTheme,
    BorderRadius? radius,
    ShadcnAvatarTheme? avatarTheme,
    ShadcnButtonSizesTheme? buttonSizesTheme,
    ShadcnTooltipTheme? tooltipTheme,
    ShadcnPopoverTheme? popoverTheme,
    ShadcnDecorationTheme? decoration,
    ShadcnTextThemeData? textTheme,
    double? disabledOpacity,
  }) {
    final effectiveRadius =
        radius ?? const BorderRadius.all(Radius.circular(6));
    return ShadcnThemeData._internal(
      colorScheme: colorScheme,
      brightness: brightness,
      extensions: extensions,
      primaryButtonTheme: ShadcnComponentDefaultTheme.primaryButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(primaryButtonTheme),
      secondaryButtonTheme: ShadcnComponentDefaultTheme.secondaryButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(secondaryButtonTheme),
      destructiveButtonTheme:
          ShadcnComponentDefaultTheme.destructiveButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(destructiveButtonTheme),
      outlineButtonTheme: ShadcnComponentDefaultTheme.outlineButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(outlineButtonTheme),
      ghostButtonTheme: ShadcnComponentDefaultTheme.ghostButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(ghostButtonTheme),
      linkButtonTheme: ShadcnComponentDefaultTheme.linkButtonTheme(
        colorScheme: colorScheme,
      ).mergeWith(linkButtonTheme),
      primaryBadgeTheme: ShadcnComponentDefaultTheme.primaryBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(primaryBadgeTheme),
      secondaryBadgeTheme: ShadcnComponentDefaultTheme.secondaryBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(secondaryBadgeTheme),
      destructiveBadgeTheme: ShadcnComponentDefaultTheme.destructiveBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(destructiveBadgeTheme),
      outlineBadgeTheme: ShadcnComponentDefaultTheme.outlineBadgeTheme(
        colorScheme: colorScheme,
      ).mergeWith(outlineBadgeTheme),
      buttonSizesTheme: ShadcnComponentDefaultTheme.buttonSizesTheme()
          .mergeWith(buttonSizesTheme),
      radius: effectiveRadius,
      avatarTheme: ShadcnComponentDefaultTheme.avatarTheme(
        colorScheme: colorScheme,
      ).mergeWith(avatarTheme),
      tooltipTheme: ShadcnComponentDefaultTheme.tooltipTheme(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(tooltipTheme),
      popoverTheme: ShadcnComponentDefaultTheme.popoverTheme(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(popoverTheme),
      decoration: ShadcnComponentDefaultTheme.decoration(
        colorScheme: colorScheme,
        radius: effectiveRadius,
      ).mergeWith(decoration),
      textTheme: ShadcnComponentDefaultTheme.textTheme(colorScheme: colorScheme)
          .mergeWith(textTheme),
      disabledOpacity: disabledOpacity ?? .5,
    );
  }

  const ShadcnThemeData._internal({
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
  });

  static ShadcnThemeData lerp(ShadcnThemeData a, ShadcnThemeData b, double t) {
    if (identical(a, b)) {
      return a;
    }
    return ShadcnThemeData(
      colorScheme: ShadcnColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      brightness: b.brightness,
      primaryButtonTheme:
          ShadcnButtonTheme.lerp(a.primaryButtonTheme, b.primaryButtonTheme, t),
      secondaryButtonTheme: ShadcnButtonTheme.lerp(
        a.secondaryButtonTheme,
        b.secondaryButtonTheme,
        t,
      ),
      destructiveButtonTheme: ShadcnButtonTheme.lerp(
        a.destructiveButtonTheme,
        b.destructiveButtonTheme,
        t,
      ),
      outlineButtonTheme:
          ShadcnButtonTheme.lerp(a.outlineButtonTheme, b.outlineButtonTheme, t),
      ghostButtonTheme:
          ShadcnButtonTheme.lerp(a.ghostButtonTheme, b.ghostButtonTheme, t),
      linkButtonTheme:
          ShadcnButtonTheme.lerp(a.linkButtonTheme, b.linkButtonTheme, t),
      primaryBadgeTheme:
          ShadcnBadgeTheme.lerp(a.primaryBadgeTheme, b.primaryBadgeTheme, t),
      secondaryBadgeTheme: ShadcnBadgeTheme.lerp(
        a.secondaryBadgeTheme,
        b.secondaryBadgeTheme,
        t,
      ),
      destructiveBadgeTheme: ShadcnBadgeTheme.lerp(
        a.destructiveBadgeTheme,
        b.destructiveBadgeTheme,
        t,
      ),
      outlineBadgeTheme:
          ShadcnBadgeTheme.lerp(a.outlineBadgeTheme, b.outlineBadgeTheme, t),
      radius: BorderRadius.lerp(a.radius, b.radius, t),
      avatarTheme: ShadcnAvatarTheme.lerp(a.avatarTheme, b.avatarTheme, t),
      buttonSizesTheme: ShadcnButtonSizesTheme.lerp(
        a.buttonSizesTheme,
        b.buttonSizesTheme,
        t,
      ),
      tooltipTheme: ShadcnTooltipTheme.lerp(a.tooltipTheme, b.tooltipTheme, t),
      popoverTheme: ShadcnPopoverTheme.lerp(a.popoverTheme, b.popoverTheme, t),
      decoration: ShadcnDecorationTheme.lerp(a.decoration, b.decoration, t),
      textTheme: ShadcnTextThemeData.lerp(a.textTheme, b.textTheme, t),
      disabledOpacity: lerpDouble(a.disabledOpacity, b.disabledOpacity, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadcnBaseTheme &&
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
        other.disabledOpacity == disabledOpacity;
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
        disabledOpacity.hashCode;
  }

  ShadcnThemeData copyWith({
    ShadcnColorScheme? colorScheme,
    ShadcnButtonTheme? primaryButtonTheme,
    ShadcnButtonTheme? secondaryButtonTheme,
    ShadcnButtonTheme? destructiveButtonTheme,
    ShadcnButtonTheme? outlineButtonTheme,
    ShadcnButtonTheme? ghostButtonTheme,
    ShadcnButtonTheme? linkButtonTheme,
    ShadcnBadgeTheme? primaryBadgeTheme,
    ShadcnBadgeTheme? secondaryBadgeTheme,
    ShadcnBadgeTheme? destructiveBadgeTheme,
    ShadcnBadgeTheme? outlineBadgeTheme,
    Brightness? brightness,
    Iterable<ThemeExtension<dynamic>>? extensions,
    BorderRadius? radius,
    ShadcnAvatarTheme? avatarTheme,
    ShadcnButtonSizesTheme? buttonSizesTheme,
    ShadcnTooltipTheme? tooltipTheme,
    ShadcnPopoverTheme? popoverTheme,
    ShadcnDecorationTheme? decoration,
    ShadcnTextThemeData? textTheme,
    double? disabledOpacity,
  }) {
    return ShadcnThemeData(
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
    );
  }
}
