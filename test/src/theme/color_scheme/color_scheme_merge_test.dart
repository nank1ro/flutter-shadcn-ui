import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadColorScheme.merge', () {
    test('merge with null returns this', () {
      const scheme = ShadSlateColorScheme.light();
      final result = scheme.merge(null);
      expect(identical(result, scheme), isTrue);
    });

    test('merge replaces all standard color fields', () {
      const base = ShadSlateColorScheme.light();
      const other = ShadSlateColorScheme.dark();
      final result = base.merge(other);

      expect(result.background, other.background);
      expect(result.foreground, other.foreground);
      expect(result.card, other.card);
      expect(result.cardForeground, other.cardForeground);
      expect(result.popover, other.popover);
      expect(result.popoverForeground, other.popoverForeground);
      expect(result.primary, other.primary);
      expect(result.primaryForeground, other.primaryForeground);
      expect(result.secondary, other.secondary);
      expect(result.secondaryForeground, other.secondaryForeground);
      expect(result.muted, other.muted);
      expect(result.mutedForeground, other.mutedForeground);
      expect(result.accent, other.accent);
      expect(result.accentForeground, other.accentForeground);
      expect(result.destructive, other.destructive);
      expect(result.destructiveForeground, other.destructiveForeground);
      expect(result.border, other.border);
      expect(result.input, other.input);
      expect(result.ring, other.ring);
      expect(result.selection, other.selection);
    });

    test('merge combines custom maps', () {
      final base = const ShadSlateColorScheme.light().copyWith(
        custom: const {'brand': Color(0xFF000000)},
      );
      final other = const ShadSlateColorScheme.light().copyWith(
        custom: const {'accent': Color(0xFFFFFFFF)},
      );
      final result = base.merge(other);

      expect(result.custom, containsPair('brand', const Color(0xFF000000)));
      expect(result.custom, containsPair('accent', const Color(0xFFFFFFFF)));
    });

    test('merge custom map - other overrides same keys', () {
      final base = const ShadSlateColorScheme.light().copyWith(
        custom: const {'brand': Color(0xFF000000)},
      );
      final other = const ShadSlateColorScheme.light().copyWith(
        custom: const {'brand': Color(0xFFFF0000)},
      );
      final result = base.merge(other);

      expect(result.custom['brand'], const Color(0xFFFF0000));
    });
  });

  group('ShadThemeData.merge', () {
    test('merges colorScheme custom maps', () {
      final base = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light().copyWith(
          custom: const {'brand': Color(0xFF000000)},
        ),
      );
      final other = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light().copyWith(
          custom: const {'accent': Color(0xFFFFFFFF)},
        ),
      );
      final merged = base.merge(other);

      expect(
        merged.colorScheme.custom,
        containsPair('brand', const Color(0xFF000000)),
      );
      expect(
        merged.colorScheme.custom,
        containsPair('accent', const Color(0xFFFFFFFF)),
      );
    });
  });
}
