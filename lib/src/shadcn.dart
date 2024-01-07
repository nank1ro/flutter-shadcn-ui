import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/base.dart';

class Shadcn extends StatelessWidget {
  const Shadcn({
    super.key,
    required this.child,
    this.textDirection = TextDirection.ltr,
    this.themeData,
  });

  final TextDirection textDirection;
  final Widget child;
  final ShadcnThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    final effectiveThemeData = themeData ?? shadcnDefaultTheme;
    final isDarkMode = effectiveThemeData.brightness == Brightness.dark;
    final effectiveTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    return AnimatedShadcnTheme(
      data: effectiveThemeData,
      child: Directionality(
        textDirection: textDirection,
        child: Theme(
          data: effectiveTheme.copyWith(
            colorScheme: ColorScheme(
              brightness: effectiveThemeData.brightness,
              primary: effectiveThemeData.primary,
              onPrimary: effectiveThemeData.primaryForeground,
              secondary: effectiveThemeData.secondary,
              onSecondary: effectiveThemeData.secondaryForeground,
              error: effectiveThemeData.destructive,
              onError: effectiveThemeData.destructiveForeground,
              background: effectiveThemeData.background,
              onBackground: effectiveThemeData.foreground,
              surface: effectiveThemeData.card,
              onSurface: effectiveThemeData.cardForeground,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
