import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadCarousel Widget Tests', () {
    testWidgets('ShadCarousel renders items and leading button correctly.', (
      WidgetTester tester,
    ) async {
      const itemCount = 3;
      final children = List.generate(
        itemCount,
        (index) => ColoredBox(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      );

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadCarousel(
              itemExtent: 200,
              leading: const Icon(LucideIcons.chevronLeft),
              children: children,
            ),
          ),
        ),
      );

      // Verify carousel items are rendered
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);

      // Verify navigation buttons are present
      expect(find.byIcon(LucideIcons.chevronLeft), findsOneWidget);
    });

    testWidgets('''
        Testing the trailing and leading buttons navigate carousel items correctly
      ''', (
      WidgetTester tester,
    ) async {
      const itemCount = 4;
      final children = List.generate(
        itemCount,
        (index) => ColoredBox(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      );

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadCarousel(
              itemExtent: 200,
              leading: const Icon(LucideIcons.chevronLeft),
              trailing: const Icon(LucideIcons.chevronRight),
              children: children,
            ),
          ),
        ),
      );

      // Verify initial state shows first item
      expect(find.text('Item 0'), findsOneWidget);

      // Tap next button
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pumpAndSettle();

      // Verify carousel scrolled to next item
      final scrollable = find.byType(Scrollable);
      expect(scrollable, findsOneWidget);

      // Tap previous button
      await tester.tap(find.byIcon(LucideIcons.chevronLeft));
      await tester.pumpAndSettle();

      // Verify carousel scrolled back
      expect(find.text('Item 0'), findsOneWidget);
    });

    testWidgets('ShadCarousel matches goldens', (tester) async {
      const itemCount = 4;
      final children = List.generate(
        itemCount,
        (index) => ColoredBox(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      );

      await tester.pumpWidget(
        createTestWidget(ShadCarousel(itemExtent: 200, children: children)),
      );

      expect(
        find.byType(ShadCarousel),
        matchesGoldenFile('goldens/carousel.png'),
      );
    });
  });
}
