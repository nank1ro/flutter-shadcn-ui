import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/badge.dart'; // Adjust import path based on your project structure

import '../../extra/pump_async_widget.dart'; // Assuming this is available in your project

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadBadge', () {
    testWidgets('renders primary variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            child: Text('Primary Badge'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Primary Badge'), findsOneWidget);

      // Check basic layout (Container wraps the content)
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      // Check Column contains the child
      final columnFinder = find.byType(Column);
      expect(columnFinder, findsOneWidget);
    });

    testWidgets('renders secondary variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.secondary(
            child: Text('Secondary Badge'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Secondary Badge'), findsOneWidget);

      // Check basic layout
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('renders outline variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.outline(
            child: Text('Outline Badge'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Outline Badge'), findsOneWidget);

      // Check basic layout
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('renders destructive variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.destructive(
            child: Text('Destructive Badge'),
          ),
        ),
      );

      // Check if the child content renders
      expect(find.text('Destructive Badge'), findsOneWidget);

      // Check basic layout
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
    });

    testWidgets('applies custom shape correctly', (WidgetTester tester) async {
      const customShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      );
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            shape: customShape,
            child: Text('Custom Shape Badge'),
          ),
        ),
      );

      // Check Container uses ShapeDecoration with custom shape
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.shape, customShape);
    });

    testWidgets('applies custom background and foreground colors correctly',
        (WidgetTester tester) async {
      const customBackgroundColor = Colors.blue;
      const customForegroundColor = Colors.yellow;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            backgroundColor: customBackgroundColor,
            foregroundColor: customForegroundColor,
            child: Text('Colored Badge'),
          ),
        ),
      );

      // Check Container uses ShapeDecoration with custom background color
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.color, customBackgroundColor);

      // Check DefaultTextStyle applies custom foreground color
      final defaultTextStyleFinder = find.descendant(
        of: containerFinder,
        matching: find.byType(DefaultTextStyle),
      );
      expect(defaultTextStyleFinder, findsOneWidget);
      final defaultTextStyle =
          tester.widget<DefaultTextStyle>(defaultTextStyleFinder);
      expect(defaultTextStyle.style.color, customForegroundColor);
    });

    testWidgets('applies custom padding correctly',
        (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(10);
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            padding: customPadding,
            child: Text('Padded Badge'),
          ),
        ),
      );

      // Check Container applies custom padding
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      expect(container.padding, customPadding);
    });

    testWidgets('changes background color on hover',
        (WidgetTester tester) async {
      const customHoverBackgroundColor = Colors.red;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            hoverBackgroundColor: customHoverBackgroundColor,
            child: Text('Hover Badge'),
          ),
        ),
      );

      // Initially, hover background shouldn’t apply
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      var container = tester.widget<Container>(containerFinder);
      var decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.color, isNot(customHoverBackgroundColor));

      // Simulate hover
      final pointer = TestPointer(1, PointerDeviceKind.mouse);
      await tester.sendEventToBinding(
        pointer.hover(tester.getCenter(find.text('Hover Badge'))),
      );
      await tester.pumpAndSettle();

      // Check hover background color applies
      container = tester.widget<Container>(containerFinder);
      decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.color, customHoverBackgroundColor);
    });

    testWidgets('executes onPressed callback on tap',
        (WidgetTester tester) async {
      var pressed = false;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBadge(
            child: const Text('Press Me'),
            onPressed: () => pressed = true,
          ),
        ),
      );

      // Tap the badge
      await tester.tap(find.text('Press Me'));
      await tester.pumpAndSettle();

      // Verify onPressed was called
      expect(pressed, true);
    });

    testWidgets('uses default shape when not specified',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(
            child: Text('Default Shape Badge'),
          ),
        ),
      );

      // Check Container uses ShapeDecoration with default StadiumBorder
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as ShapeDecoration?;
      expect(decoration?.shape, isA<StadiumBorder>());
    });

    testWidgets('ShadBadge matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge(child: Text('Badge')),
        ),
      );

      expect(
        find.byType(ShadBadge),
        matchesGoldenFile('goldens/badge.png'),
      );
    });

    testWidgets('ShadBadge.secondary matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.secondary(child: Text('Badge')),
        ),
      );

      expect(
        find.byType(ShadBadge),
        matchesGoldenFile('goldens/badge_secondary.png'),
      );
    });

    testWidgets('ShadBadge.outline matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.outline(child: Text('Badge')),
        ),
      );

      expect(
        find.byType(ShadBadge),
        matchesGoldenFile('goldens/badge_outline.png'),
      );
    });

    testWidgets('ShadBadge.destructive matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBadge.destructive(child: Text('Badge')),
        ),
      );

      expect(
        find.byType(ShadBadge),
        matchesGoldenFile('goldens/badge_destructive.png'),
      );
    });
  });
}
