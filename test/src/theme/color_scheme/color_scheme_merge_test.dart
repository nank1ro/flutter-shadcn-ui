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

    test('merge with canMerge false returns other unchanged', () {
      final base = const ShadSlateColorScheme.light().copyWith(
        custom: const {'brand': Color(0xFF000000)},
      );
      const other = ShadColorScheme(
        canMerge: false,
        background: Color(0xFF111111),
        foreground: Color(0xFF222222),
        card: Color(0xFF333333),
        cardForeground: Color(0xFF444444),
        popover: Color(0xFF555555),
        popoverForeground: Color(0xFF666666),
        primary: Color(0xFF777777),
        primaryForeground: Color(0xFF888888),
        secondary: Color(0xFF999999),
        secondaryForeground: Color(0xFFAAAAAA),
        muted: Color(0xFFBBBBBB),
        mutedForeground: Color(0xFFCCCCCC),
        accent: Color(0xFFDDDDDD),
        accentForeground: Color(0xFFEEEEEE),
        destructive: Color(0xFFFF0000),
        destructiveForeground: Color(0xFFFFFFFF),
        border: Color(0xFF000001),
        input: Color(0xFF000002),
        ring: Color(0xFF000003),
        selection: Color(0xFF000004),
        custom: {'accent': Color(0xFFFFFFFF)},
      );
      final result = base.merge(other);

      expect(identical(result, other), isTrue);
      expect(result.custom, containsPair('accent', const Color(0xFFFFFFFF)));
      expect(result.custom.containsKey('brand'), isFalse);
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

    test('non-mergeable colorScheme replaces rather than merges', () {
      final base = ShadThemeData(
        colorScheme: const ShadSlateColorScheme.light().copyWith(
          custom: const {'brand': Color(0xFF000000)},
        ),
      );
      final other = ShadThemeData(
        colorScheme: const ShadColorScheme(
          canMerge: false,
          background: Color(0xFF111111),
          foreground: Color(0xFF222222),
          card: Color(0xFF333333),
          cardForeground: Color(0xFF444444),
          popover: Color(0xFF555555),
          popoverForeground: Color(0xFF666666),
          primary: Color(0xFF777777),
          primaryForeground: Color(0xFF888888),
          secondary: Color(0xFF999999),
          secondaryForeground: Color(0xFFAAAAAA),
          muted: Color(0xFFBBBBBB),
          mutedForeground: Color(0xFFCCCCCC),
          accent: Color(0xFFDDDDDD),
          accentForeground: Color(0xFFEEEEEE),
          destructive: Color(0xFFFF0000),
          destructiveForeground: Color(0xFFFFFFFF),
          border: Color(0xFF000001),
          input: Color(0xFF000002),
          ring: Color(0xFF000003),
          selection: Color(0xFF000004),
          custom: {'accent': Color(0xFFFFFFFF)},
        ),
      );
      final merged = base.merge(other);

      expect(
        merged.colorScheme.custom,
        containsPair('accent', const Color(0xFFFFFFFF)),
      );
      expect(merged.colorScheme.custom.containsKey('brand'), isFalse);
    });
  });
}
