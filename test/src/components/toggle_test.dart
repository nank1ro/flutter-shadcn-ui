import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(body: Center(child: child)),
    );
  }

  ShadDecoration toggleDecoration(WidgetTester tester) {
    return tester
        .widget<ShadDecorator>(
          find.descendant(
            of: find.byType(ShadToggle),
            matching: find.byType(ShadDecorator),
          ),
        )
        .decoration!;
  }

  group('ShadToggle', () {
    testWidgets('calls onChanged with the opposite value when tapped', (
      tester,
    ) async {
      var value = false;
      await tester.pumpWidget(
        createTestWidget(
          StatefulBuilder(
            builder: (context, setState) => ShadToggle(
              value: value,
              onChanged: (v) => setState(() => value = v),
              child: const Text('Bold'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ShadToggle));
      await tester.pump();
      expect(value, isTrue);

      await tester.tap(find.byType(ShadToggle));
      await tester.pump();
      expect(value, isFalse);
    });

    testWidgets('does not call onChanged when disabled', (tester) async {
      var called = false;
      await tester.pumpWidget(
        createTestWidget(
          ShadToggle(
            value: false,
            enabled: false,
            onChanged: (_) => called = true,
            child: const Text('Bold'),
          ),
        ),
      );

      await tester.tap(find.byType(ShadToggle), warnIfMissed: false);
      await tester.pump();
      expect(called, isFalse);
    });

    testWidgets('toggles with Space and Enter when focused', (tester) async {
      var value = false;
      final focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      await tester.pumpWidget(
        createTestWidget(
          StatefulBuilder(
            builder: (context, setState) => ShadToggle(
              value: value,
              focusNode: focusNode,
              onChanged: (v) => setState(() => value = v),
              child: const Text('Bold'),
            ),
          ),
        ),
      );

      focusNode.requestFocus();
      await tester.pump();

      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pump();
      expect(value, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();
      expect(value, isFalse);
    });

    testWidgets('uses the accent colors when pressed', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadToggle(value: true, child: Text('Bold')),
        ),
      );

      final colorScheme = ShadTheme.of(
        tester.element(find.byType(ShadToggle)),
      ).colorScheme;
      expect(toggleDecoration(tester).color, colorScheme.accent);
      expect(
        DefaultTextStyle.of(tester.element(find.text('Bold'))).style.color,
        colorScheme.accentForeground,
      );
    });

    testWidgets('is transparent when not pressed', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadToggle(value: false, child: Text('Bold')),
        ),
      );

      expect(toggleDecoration(tester).color, const Color(0x00000000));
    });

    testWidgets('has the height of its size and is at least square', (
      tester,
    ) async {
      for (final (size, height) in [
        (ShadButtonSize.sm, 32.0),
        (ShadButtonSize.regular, 36.0),
        (ShadButtonSize.lg, 40.0),
      ]) {
        await tester.pumpWidget(
          createTestWidget(
            ShadToggle(
              value: false,
              size: size,
              child: const Icon(LucideIcons.bold),
            ),
          ),
        );

        final rect = tester.getSize(find.byType(ShadToggle));
        expect(rect.height, height, reason: '$size');
        expect(rect.width, height, reason: '$size');
      }
    });

    testWidgets('outline variant has a border', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadToggle.outline(value: false, child: Text('Bold')),
        ),
      );

      final colorScheme = ShadTheme.of(
        tester.element(find.byType(ShadToggle)),
      ).colorScheme;
      final border = toggleDecoration(tester).border!;
      expect(border.left?.width, 1);
      expect(border.left?.color, colorScheme.input);
    });

    testWidgets('exposes the toggled state to semantics', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        createTestWidget(
          ShadToggle(
            value: true,
            onChanged: (_) {},
            child: const Text('Bold'),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(ShadToggle)),
        matchesSemantics(
          label: 'Bold',
          isButton: true,
          hasToggledState: true,
          isToggled: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          hasTapAction: true,
          hasFocusAction: true,
        ),
      );
      handle.dispose();
    });

    testWidgets('matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShadToggle(value: false, child: Icon(LucideIcons.bold)),
              ShadToggle(value: true, child: Icon(LucideIcons.italic)),
              ShadToggle.outline(
                value: false,
                leading: Icon(LucideIcons.bookmark),
                child: Text('Bookmark'),
              ),
              ShadToggle.outline(
                value: true,
                leading: Icon(LucideIcons.bookmark),
                child: Text('Bookmark'),
              ),
            ],
          ),
        ),
      );

      await expectLater(
        find.byType(Row).first,
        matchesGoldenFile('goldens/toggle.png'),
      );
    });
  });
}
