import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(
    Widget child, {
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return ShadApp(
      home: Directionality(
        textDirection: textDirection,
        child: Scaffold(body: Center(child: child)),
      ),
    );
  }

  const items = [
    ShadToggleGroupItem(value: 'a', child: Text('A')),
    ShadToggleGroupItem(value: 'b', child: Text('B')),
    ShadToggleGroupItem(value: 'c', child: Text('C')),
  ];

  bool isPressed(WidgetTester tester, String text) {
    return tester
        .widget<ShadToggle>(
          find.ancestor(of: find.text(text), matching: find.byType(ShadToggle)),
        )
        .value;
  }

  ShadDecoration itemDecoration(WidgetTester tester, String text) {
    return tester
        .widget<ShadDecorator>(
          find.ancestor(
            of: find.text(text),
            matching: find.byType(ShadDecorator),
          ),
        )
        .decoration!;
  }

  group('ShadToggleGroup', () {
    testWidgets('single selects one item and deselects it', (tester) async {
      final changes = <String?>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(onChanged: changes.add, items: items),
        ),
      );

      await tester.tap(find.text('A'));
      await tester.pump();
      expect(isPressed(tester, 'A'), isTrue);

      await tester.tap(find.text('B'));
      await tester.pump();
      expect(isPressed(tester, 'A'), isFalse);
      expect(isPressed(tester, 'B'), isTrue);

      await tester.tap(find.text('B'));
      await tester.pump();
      expect(isPressed(tester, 'B'), isFalse);

      expect(changes, ['a', 'b', null]);
    });

    testWidgets('single keeps the item pressed without allowDeselection', (
      tester,
    ) async {
      final changes = <String?>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            initialValue: 'a',
            allowDeselection: false,
            onChanged: changes.add,
            items: items,
          ),
        ),
      );

      await tester.tap(find.text('A'));
      await tester.pump();
      expect(isPressed(tester, 'A'), isTrue);
      expect(changes, isEmpty);
    });

    testWidgets('multiple adds and removes items', (tester) async {
      final changes = <Set<String>>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>.multiple(
            initialValues: const {'a'},
            onChanged: changes.add,
            items: items,
          ),
        ),
      );

      await tester.tap(find.text('B'));
      await tester.pump();
      await tester.tap(find.text('A'));
      await tester.pump();

      expect(isPressed(tester, 'A'), isFalse);
      expect(isPressed(tester, 'B'), isTrue);
      expect(changes, [
        {'a', 'b'},
        {'b'},
      ]);
    });

    testWidgets('updates when initialValue changes', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(initialValue: 'a', items: items),
        ),
      );
      expect(isPressed(tester, 'A'), isTrue);

      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(initialValue: 'c', items: items),
        ),
      );
      expect(isPressed(tester, 'A'), isFalse);
      expect(isPressed(tester, 'C'), isTrue);
    });

    testWidgets('reflects controller changes', (tester) async {
      final controller = ShadToggleGroupController<String>();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>.multiple(
            controller: controller,
            items: items,
          ),
        ),
      );

      controller.value = {'b', 'c'};
      await tester.pump();
      expect(isPressed(tester, 'B'), isTrue);
      expect(isPressed(tester, 'C'), isTrue);

      await tester.tap(find.text('C'));
      await tester.pump();
      expect(controller.value, {'b'});
    });

    testWidgets('disabled group and items ignore taps', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            items: const [
              ShadToggleGroupItem(value: 'a', child: Text('A')),
              ShadToggleGroupItem(
                value: 'b',
                enabled: false,
                child: Text('B'),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('B'), warnIfMissed: false);
      await tester.pump();
      expect(isPressed(tester, 'B'), isFalse);

      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(enabled: false, items: items),
        ),
      );
      await tester.tap(find.text('A'), warnIfMissed: false);
      await tester.pump();
      expect(isPressed(tester, 'A'), isFalse);
    });

    testWidgets('joined items only round the outer corners', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            variant: ShadToggleVariant.outline,
            items: items,
          ),
        ),
      );

      final radius = ShadTheme.of(tester.element(find.text('A'))).radius;
      const ltr = TextDirection.ltr;

      final first = itemDecoration(tester, 'A').border!;
      expect(first.radius!.resolve(ltr).topLeft, radius.topLeft);
      expect(first.radius!.resolve(ltr).topRight, Radius.zero);
      expect(first.left!.width, 1);

      final middle = itemDecoration(tester, 'B').border!;
      expect(middle.radius!.resolve(ltr), BorderRadius.zero);
      expect(middle.left!.width, 0);
      expect(middle.right!.width, 1);

      final last = itemDecoration(tester, 'C').border!;
      expect(last.radius!.resolve(ltr).topLeft, Radius.zero);
      expect(last.radius!.resolve(ltr).topRight, radius.topRight);
      expect(last.left!.width, 0);
    });

    testWidgets('joined vertical items collapse the top border', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            variant: ShadToggleVariant.outline,
            axis: Axis.vertical,
            items: items,
          ),
        ),
      );

      final radius = ShadTheme.of(tester.element(find.text('A'))).radius;
      const ltr = TextDirection.ltr;

      final first = itemDecoration(tester, 'A').border!;
      expect(first.radius!.resolve(ltr).topLeft, radius.topLeft);
      expect(first.radius!.resolve(ltr).bottomLeft, Radius.zero);
      expect(first.top!.width, 1);

      final middle = itemDecoration(tester, 'B').border!;
      expect(middle.radius!.resolve(ltr), BorderRadius.zero);
      expect(middle.top!.width, 0);
      expect(middle.left!.width, 1);

      final last = itemDecoration(tester, 'C').border!;
      expect(last.radius!.resolve(ltr).bottomLeft, radius.bottomLeft);
      expect(last.top!.width, 0);
    });

    testWidgets('joined items draw the focus ring with their own radius', (
      tester,
    ) async {
      for (final disableSecondaryBorder in [false, true]) {
        await tester.pumpWidget(
          ShadApp(
            theme: ShadThemeData(
              brightness: Brightness.light,
              colorScheme: const ShadSlateColorScheme.light(),
              disableSecondaryBorder: disableSecondaryBorder,
            ),
            home: Scaffold(
              body: Center(
                child: ShadToggleGroup<String>(items: items),
              ),
            ),
          ),
        );
        // ShadApp animates theme changes between iterations.
        await tester.pumpAndSettle();

        final decoration = itemDecoration(tester, 'B');
        final ring = disableSecondaryBorder
            ? decoration.focusedBorder!
            : decoration.secondaryFocusedBorder!;
        expect(
          ring.radius!.resolve(TextDirection.ltr),
          BorderRadius.zero,
          reason: 'disableSecondaryBorder: $disableSecondaryBorder',
        );
        if (!disableSecondaryBorder) expect(ring.offset, 0);
      }
    });

    testWidgets('keeps the selection when switching controllers', (
      tester,
    ) async {
      final controller = ShadToggleGroupController<String>(
        initialValue: {'b'},
      );
      addTearDown(controller.dispose);

      Widget build(ShadToggleGroupController<String>? controller) {
        return createTestWidget(
          ShadToggleGroup<String>.multiple(
            controller: controller,
            initialValues: const {'a'},
            items: items,
          ),
        );
      }

      await tester.pumpWidget(build(controller));
      expect(isPressed(tester, 'B'), isTrue);

      await tester.pumpWidget(build(null));
      expect(isPressed(tester, 'A'), isTrue);
      expect(isPressed(tester, 'B'), isFalse);
      await tester.tap(find.text('C'));
      await tester.pump();
      expect(isPressed(tester, 'C'), isTrue);
      expect(controller.value, {'b'});

      await tester.pumpWidget(build(controller));
      expect(isPressed(tester, 'B'), isTrue);
      expect(isPressed(tester, 'C'), isFalse);
    });

    testWidgets('joined items mirror in RTL', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            variant: ShadToggleVariant.outline,
            items: items,
          ),
          textDirection: TextDirection.rtl,
        ),
      );

      final middle = itemDecoration(tester, 'B').border!;
      expect(middle.left!.width, 1);
      expect(middle.right!.width, 0);
      expect(
        tester.getCenter(find.text('A')).dx,
        greaterThan(tester.getCenter(find.text('C')).dx),
      );
    });

    testWidgets('spaced items keep their own corners and borders', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            variant: ShadToggleVariant.outline,
            spacing: 8,
            items: items,
          ),
        ),
      );

      final radius = ShadTheme.of(tester.element(find.text('A'))).radius;
      final middle = itemDecoration(tester, 'B').border!;
      expect(middle.radius, radius);
      expect(middle.left!.width, 1);
      expect(
        tester.getTopLeft(find.byType(ShadToggle).at(1)).dx -
            tester.getTopRight(find.byType(ShadToggle).at(0)).dx,
        8,
      );
    });

    testWidgets('vertical items share the same width', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadToggleGroup<String>(
            axis: Axis.vertical,
            items: const [
              ShadToggleGroupItem(value: 'a', child: Text('A')),
              ShadToggleGroupItem(value: 'b', child: Text('A longer label')),
            ],
          ),
        ),
      );

      final first = tester.getRect(find.byType(ShadToggle).at(0));
      final second = tester.getRect(find.byType(ShadToggle).at(1));
      expect(first.width, second.width);
      expect(second.top, first.bottom);
    });

    testWidgets('matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShadToggleGroup<String>.multiple(
                initialValues: {'b'},
                items: items,
              ),
              const SizedBox(height: 16),
              ShadToggleGroup<String>(
                initialValue: 'b',
                variant: ShadToggleVariant.outline,
                items: items,
              ),
              const SizedBox(height: 16),
              ShadToggleGroup<String>(
                initialValue: 'b',
                variant: ShadToggleVariant.outline,
                axis: Axis.vertical,
                items: items,
              ),
            ],
          ),
        ),
      );

      await expectLater(
        find.byType(Column).first,
        matchesGoldenFile('goldens/toggle_group.png'),
      );
    });
  });
}
