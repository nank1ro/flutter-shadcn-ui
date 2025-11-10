import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadThemeData.copyWith', () {
    test('copyWith should regenerate theme components when colorScheme changes', () {
      // Create a light theme
      final lightTheme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
      );

      // Create a dark theme using copyWith
      final darkThemeFromCopyWith = lightTheme.copyWith(
        colorScheme: const ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
      );

      // Create a dark theme using constructor
      final darkThemeFromConstructor = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
      );

      // Verify that both approaches produce the same result
      expect(
        darkThemeFromCopyWith.colorScheme,
        darkThemeFromConstructor.colorScheme,
      );
      expect(
        darkThemeFromCopyWith.brightness,
        darkThemeFromConstructor.brightness,
      );
      
      // Verify that component themes are regenerated (not copied from light theme)
      // Button themes should match the new variant
      expect(
        darkThemeFromCopyWith.primaryButtonTheme,
        darkThemeFromConstructor.primaryButtonTheme,
      );
      expect(
        darkThemeFromCopyWith.secondaryButtonTheme,
        darkThemeFromConstructor.secondaryButtonTheme,
      );
      expect(
        darkThemeFromCopyWith.destructiveButtonTheme,
        darkThemeFromConstructor.destructiveButtonTheme,
      );
      
      // Badge themes should match the new variant
      expect(
        darkThemeFromCopyWith.primaryBadgeTheme,
        darkThemeFromConstructor.primaryBadgeTheme,
      );
      expect(
        darkThemeFromCopyWith.secondaryBadgeTheme,
        darkThemeFromConstructor.secondaryBadgeTheme,
      );
      
      // Other component themes should also match
      expect(
        darkThemeFromCopyWith.cardTheme,
        darkThemeFromConstructor.cardTheme,
      );
      expect(
        darkThemeFromCopyWith.inputTheme,
        darkThemeFromConstructor.inputTheme,
      );
    });

    test('copyWith should preserve structural properties', () {
      final theme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
        radius: const BorderRadius.all(Radius.circular(10)),
        disabledOpacity: 0.3,
        breakpoints: ShadBreakpoints(
          sm: 640,
          md: 768,
          lg: 1024,
          xl: 1280,
          xxl: 1536,
        ),
      );

      final copied = theme.copyWith(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      );

      // Structural properties should be preserved
      expect(copied.radius, theme.radius);
      expect(copied.disabledOpacity, theme.disabledOpacity);
      expect(copied.breakpoints, theme.breakpoints);
    });

    test('copyWith with only component themes should not regenerate other themes', () {
      final theme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
      );

      final customCardTheme = ShadCardTheme(
        padding: const EdgeInsets.all(24),
      );

      final copied = theme.copyWith(
        cardTheme: customCardTheme,
      );

      // Explicitly provided theme should be used
      expect(copied.cardTheme.padding, const EdgeInsets.all(24));
      
      // Other themes should remain the same (preserving the variant defaults)
      expect(copied.primaryButtonTheme, theme.primaryButtonTheme);
      expect(copied.secondaryButtonTheme, theme.secondaryButtonTheme);
    });

    test('copyWith without parameters should preserve colorScheme and structural properties', () {
      final theme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
        radius: const BorderRadius.all(Radius.circular(10)),
      );

      // Calling copyWith without parameters should preserve colorScheme, brightness, and structural properties
      // Component themes will be regenerated from the same variant, so they should still match
      final copied = theme.copyWith();

      expect(copied.colorScheme, theme.colorScheme);
      expect(copied.brightness, theme.brightness);
      expect(copied.radius, theme.radius);
      // Since colorScheme/brightness didn't change, component themes should be regenerated
      // from the same variant, resulting in the same values
      expect(copied.primaryButtonTheme, theme.primaryButtonTheme);
    });

    test('copyWith with explicit component themes should preserve those themes', () {
      final theme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
      );

      final customButtonTheme = ShadButtonTheme(
        width: 200,
        height: 50,
      );

      // When explicitly providing a component theme to copyWith, it should be used
      final copied = theme.copyWith(
        primaryButtonTheme: customButtonTheme,
      );

      expect(copied.primaryButtonTheme.width, 200);
      expect(copied.primaryButtonTheme.height, 50);
    });

    test('copyWith preserves explicit component themes when changing only colorScheme', () {
      // Note: This test documents that when you change colorScheme/brightness,
      // explicitly provided component themes are preserved, but themes not provided
      // are regenerated from the new variant
      final customButtonTheme = ShadButtonTheme(
        width: 200,
        height: 50,
      );

      final theme = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light(),
        brightness: Brightness.light,
      );

      final copied = theme.copyWith(
        colorScheme: const ShadSlateColorScheme.dark(),
        brightness: Brightness.dark,
        primaryButtonTheme: customButtonTheme,  // Explicitly preserve this
      );

      // Explicitly provided theme is preserved
      expect(copied.primaryButtonTheme.width, 200);
      expect(copied.primaryButtonTheme.height, 50);
      
      // Other themes are regenerated from the new dark variant
      expect(copied.brightness, Brightness.dark);
    });
  });
}
