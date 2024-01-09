import 'package:flutter/material.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/theme/themes/slate.dart';

final shadcnDefaultTheme = ShadcnSlateTheme.dark();

class Shadcn extends StatelessWidget {
  const Shadcn({
    super.key,
    this.child,
    this.builder,
    this.themeData,
  }) : assert(
          (child != null) ^ (builder != null),
          'Either a child or builder must be provided',
        );

  final Widget? child;
  final WidgetBuilder? builder;
  final ShadcnThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    final effectiveThemeData = themeData ?? shadcnDefaultTheme;
    final isDarkMode = effectiveThemeData.brightness == Brightness.dark;
    final effectiveTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    return AnimatedShadcnTheme(
      data: effectiveThemeData,
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
          scaffoldBackgroundColor: effectiveThemeData.background,
        ),
        child: builder != null
            ? Builder(builder: (context) => builder!(context))
            : child!,
      ),
    );
  }
}
