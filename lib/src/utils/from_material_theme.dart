import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/color_scheme/base.dart';
import 'package:shadcn_ui/src/theme/data.dart';

extension ThemeDataConversion on ThemeData {
  ThemeData mergeWith(ShadThemeData other) {
    return copyWith(
      colorScheme: colorScheme.mergeWith(other.colorScheme),
      extensions: other.extensions,
      scaffoldBackgroundColor: other.colorScheme.background,
      dividerTheme: dividerTheme.mergeWith(
        DividerThemeData(
          color: other.colorScheme.border,
          thickness: 1,
        ),
      ),
    );
  }
}

extension ColorSchemeConversion on ColorScheme {
  ColorScheme mergeWith(ShadColorScheme other) {
    return copyWith(
      primary: other.primary,
      onPrimary: other.primaryForeground,
      secondary: other.secondary,
      onSecondary: other.secondaryForeground,
      error: other.destructive,
      onError: other.destructiveForeground,
      background: other.background,
      onBackground: other.foreground,
      surface: other.card,
      onSurface: other.cardForeground,
    );
  }
}

extension DividerThemeDataConversion on DividerThemeData {
  DividerThemeData mergeWith(DividerThemeData other) {
    return copyWith(
      color: other.color,
      thickness: other.thickness,
    );
  }
}
