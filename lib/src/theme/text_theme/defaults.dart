import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';

abstract class ShadTextDefaultTheme {
  static TextStyle h1Large({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 48,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 48 / 48,
      letterSpacing: -0.4,
    );
  }

  static TextStyle h1({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 36,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      height: 40 / 36,
      letterSpacing: -0.4,
    );
  }

  static TextStyle h2({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 30,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 36 / 30,
      letterSpacing: -0.4,
    );
  }

  static TextStyle h3({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 24,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      letterSpacing: -0.4,
    );
  }

  static TextStyle h4({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 20,
      letterSpacing: -0.4,
    );
  }

  static TextStyle p({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle blockquote({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle table({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle list({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 16,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: 0,
    );
  }

  static TextStyle lead({
    required ShadColorScheme colorScheme,
  }) {
    return TextStyle(
      fontSize: 20,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 28 / 20,
      letterSpacing: 0,
      color: colorScheme.mutedForeground,
    );
  }

  static TextStyle large({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 18,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      height: 28 / 18,
      letterSpacing: 0,
    );
  }

  static TextStyle small({
    required ShadColorScheme colorScheme,
  }) {
    return const TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 14 / 14,
      letterSpacing: 0,
    );
  }

  static TextStyle muted({
    required ShadColorScheme colorScheme,
  }) {
    return TextStyle(
      fontSize: 14,
      decoration: TextDecoration.none,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: 0,
      color: colorScheme.mutedForeground,
    );
  }
}
