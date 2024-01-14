import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/components/badge.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';

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
  }) {
    return ShadcnThemeData._internal(
      colorScheme: colorScheme,
      brightness: brightness,
      extensions: extensions,
      primaryButtonTheme: _generatePrimaryButtonTheme(
        userTheme: primaryButtonTheme,
        colorScheme: colorScheme,
      ),
      secondaryButtonTheme: _generateSecondaryButtonTheme(
        userTheme: secondaryButtonTheme,
        colorScheme: colorScheme,
      ),
      destructiveButtonTheme: _generateDescructiveButtonTheme(
        userTheme: destructiveButtonTheme,
        colorScheme: colorScheme,
      ),
      outlineButtonTheme: _generateOutlineButtonTheme(
        userTheme: outlineButtonTheme,
        colorScheme: colorScheme,
      ),
      ghostButtonTheme: _generateGhostButtonTheme(
        userTheme: ghostButtonTheme,
        colorScheme: colorScheme,
      ),
      linkButtonTheme: _generateLinkButtonTheme(
        userTheme: linkButtonTheme,
        colorScheme: colorScheme,
      ),
      primaryBadgeTheme: _generatePrimaryBadgeTheme(
        userTheme: primaryBadgeTheme,
        colorScheme: colorScheme,
      ),
      secondaryBadgeTheme: _generateSecondaryBadgeTheme(
        userTheme: secondaryBadgeTheme,
        colorScheme: colorScheme,
      ),
      destructiveBadgeTheme: _generateDestructiveBadgeTheme(
        userTheme: destructiveBadgeTheme,
        colorScheme: colorScheme,
      ),
      outlineBadgeTheme: _generateOutlineBadgeTheme(
        userTheme: outlineBadgeTheme,
        colorScheme: colorScheme,
      ),
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
  });

  static ShadcnButtonTheme _generatePrimaryButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        backgroundColor: colorScheme.primary,
        hoverBackgroundColor: colorScheme.primary.withOpacity(.9),
        foregroundColor: colorScheme.primaryForeground,
        hoverForegroundColor: colorScheme.primaryForeground,
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.primary,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.primary.withOpacity(.9),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.primaryForeground,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.primaryForeground,
      );
    }
    return userTheme;
  }

  static ShadcnButtonTheme _generateSecondaryButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        backgroundColor: colorScheme.secondary,
        hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
        foregroundColor: colorScheme.secondaryForeground,
        hoverForegroundColor: colorScheme.secondaryForeground,
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.secondary,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.secondary.withOpacity(.8),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.secondaryForeground,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.secondaryForeground,
      );
    }
    return userTheme;
  }

  static ShadcnButtonTheme _generateDescructiveButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        backgroundColor: colorScheme.destructive,
        hoverBackgroundColor: colorScheme.destructive.withOpacity(.9),
        foregroundColor: colorScheme.destructiveForeground,
        hoverForegroundColor: colorScheme.destructiveForeground,
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.destructive,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.destructive.withOpacity(.9),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.destructiveForeground,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.destructiveForeground,
      );
    }
    return userTheme;
  }

  static ShadcnButtonTheme _generateGhostButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        hoverBackgroundColor: colorScheme.accent,
        foregroundColor: colorScheme.primary,
        hoverForegroundColor: colorScheme.accentForeground,
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        hoverBackgroundColor:
            userTheme.hoverBackgroundColor ?? colorScheme.accent,
        foregroundColor: userTheme.foregroundColor ?? colorScheme.primary,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.accentForeground,
      );
    }
    return userTheme;
  }

  static ShadcnButtonTheme _generateOutlineButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        hoverBackgroundColor: colorScheme.accent,
        foregroundColor: colorScheme.primary,
        hoverForegroundColor: colorScheme.accentForeground,
        border: Border.all(color: colorScheme.input),
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        hoverBackgroundColor:
            userTheme.hoverBackgroundColor ?? colorScheme.accent,
        foregroundColor: userTheme.foregroundColor ?? colorScheme.primary,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.accentForeground,
        border: userTheme.border ?? Border.all(color: colorScheme.input),
      );
    }
    return userTheme;
  }

  static ShadcnButtonTheme _generateLinkButtonTheme({
    required ShadcnButtonTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnButtonTheme(
        foregroundColor: colorScheme.primary,
        hoverForegroundColor: colorScheme.primary,
        hoverTextDecoration: TextDecoration.underline,
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        foregroundColor: userTheme.foregroundColor ?? colorScheme.primary,
        hoverForegroundColor:
            userTheme.hoverForegroundColor ?? colorScheme.primary,
        hoverTextDecoration:
            userTheme.hoverTextDecoration ?? TextDecoration.underline,
      );
    }
    return userTheme;
  }

  static ShadcnBadgeTheme _generatePrimaryBadgeTheme({
    required ShadcnBadgeTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnBadgeTheme(
        backgroundColor: colorScheme.primary,
        hoverBackgroundColor: colorScheme.primary.withOpacity(.8),
        foregroundColor: colorScheme.primaryForeground,
        shape: const StadiumBorder(),
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.primary,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.primary.withOpacity(.8),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.primaryForeground,
        shape: userTheme.shape ?? const StadiumBorder(),
      );
    }
    return userTheme;
  }

  static ShadcnBadgeTheme _generateSecondaryBadgeTheme({
    required ShadcnBadgeTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnBadgeTheme(
        backgroundColor: colorScheme.secondary,
        hoverBackgroundColor: colorScheme.secondary.withOpacity(.8),
        foregroundColor: colorScheme.secondaryForeground,
        shape: const StadiumBorder(),
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.secondary,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.secondary.withOpacity(.8),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.secondaryForeground,
        shape: userTheme.shape ?? const StadiumBorder(),
      );
    }
    return userTheme;
  }

  static ShadcnBadgeTheme _generateDestructiveBadgeTheme({
    required ShadcnBadgeTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnBadgeTheme(
        backgroundColor: colorScheme.destructive,
        hoverBackgroundColor: colorScheme.destructive.withOpacity(.8),
        foregroundColor: colorScheme.destructiveForeground,
        shape: const StadiumBorder(),
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        backgroundColor: userTheme.backgroundColor ?? colorScheme.destructive,
        hoverBackgroundColor: userTheme.hoverBackgroundColor ??
            colorScheme.destructive.withOpacity(.8),
        foregroundColor:
            userTheme.foregroundColor ?? colorScheme.destructiveForeground,
        shape: userTheme.shape ?? const StadiumBorder(),
      );
    }
    return userTheme;
  }

  static ShadcnBadgeTheme _generateOutlineBadgeTheme({
    required ShadcnBadgeTheme? userTheme,
    required ShadcnColorScheme colorScheme,
  }) {
    if (userTheme == null) {
      return ShadcnBadgeTheme(
        foregroundColor: colorScheme.foreground,
        shape: StadiumBorder(side: BorderSide(color: colorScheme.border)),
      );
    }
    if (userTheme.inherit) {
      return userTheme.copyWith(
        foregroundColor: userTheme.foregroundColor ?? colorScheme.foreground,
        shape: userTheme.shape ??
            StadiumBorder(side: BorderSide(color: colorScheme.border)),
      );
    }
    return userTheme;
  }

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
        other.outlineBadgeTheme == outlineBadgeTheme;
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
        destructiveBadgeTheme.hashCode;
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
  }) {
    return ShadcnThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      brightness: brightness,
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
    );
  }
}
