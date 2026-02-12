import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadCarousel Widget Tests', () {
    testWidgets('ShadCarousel renders items and navigation buttons correctly', (
      WidgetTester tester,
    ) async {
      const itemCount = 3;
      final children = List.generate(
        itemCount,
        (index) => Container(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      );

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadCarousel(
              itemExtent: 200,
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
      expect(find.byIcon(LucideIcons.chevronRight), findsOneWidget);
    });

    testWidgets('Next and previous buttons navigate carousel items correctly', (
      WidgetTester tester,
    ) async {
      const itemCount = 4;
      final children = List.generate(
        itemCount,
        (index) => Container(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      );

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadCarousel(
              itemExtent: 200,
              itemSnapping: true,
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

      // Verify the scroll position actually changed
      final scrollable = tester.widget<Scrollable>(find.byType(Scrollable));
      expect(scrollable.controller!.offset, greaterThan(0));

      // Tap previous button
      await tester.tap(find.byIcon(LucideIcons.chevronLeft));
      await tester.pumpAndSettle();

      // Verify carousel scrolled back
      expect(find.text('Item 0'), findsOneWidget);
    });
  });
}
