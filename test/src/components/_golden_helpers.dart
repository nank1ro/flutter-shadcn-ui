import 'package:flutter/material.dart';
import 'package:golden_matrix/golden_matrix.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/theme/color_scheme/slate.dart';
import 'package:shadcn_ui/src/theme/data.dart';

const goldenAxes = MatrixAxes(
  themes: [MatrixTheme.light, MatrixTheme.dark],
);

ShadApp shadAppForCombination(
  MatrixCombination combination, {
  required Widget home,
}) {
  return ShadApp(
    theme: ShadThemeData(
      colorScheme: const ShadSlateColorScheme.light(),
      brightness: Brightness.light,
    ),
    darkTheme: ShadThemeData(
      colorScheme: const ShadSlateColorScheme.dark(),
      brightness: Brightness.dark,
    ),
    themeMode:
        combination.theme.name == 'dark' ? ThemeMode.dark : ThemeMode.light,
    home: home,
  );
}
