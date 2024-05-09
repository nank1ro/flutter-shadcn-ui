import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

const kDefaultFontFamily = 'Geist';

abstract class ShadTextDefaultTheme {
  static TextStyle h1Large({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 48,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 48 / 48,
      letterSpacing: -0.4,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle h1({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 36,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 40 / 36,
      letterSpacing: -0.4,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle h2({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 30,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 36 / 30,
      letterSpacing: -0.4,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle h3({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 24,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      letterSpacing: -0.4,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle h4({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 20,
      letterSpacing: -0.4,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle p({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 16,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle blockquote({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle table({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle list({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle lead({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 20,
      letterSpacing: 0,
      color: colorScheme.mutedForeground,
      fontFamily: family,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle large({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 18,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 18,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle small({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 14 / 14,
      letterSpacing: 0,
      fontFamily: family,
      color: colorScheme.foreground,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  static TextStyle muted({
    required ShadColorScheme colorScheme,
    required String family,
  }) {
    return TextStyle(
      inherit: false,
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: 0,
      color: colorScheme.mutedForeground,
      fontFamily: family,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}
