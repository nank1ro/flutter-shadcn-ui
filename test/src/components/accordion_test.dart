import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/accordion.dart';

void main() {
  /// Wraps a widget with necessary providers and material app structure for
  /// testing.
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadAccordion', () {
    testWidgets('renders single variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadAccordion<String>(
            initialValue: 'item1',
            children: const [
              ShadAccordionItem(
                value: 'item1',
                title: Text('Item 1'),
                child: Text('Content 1'),
              ),
              ShadAccordionItem(
                value: 'item2',
                title: Text('Item 2'),
                child: Text('Content 2'),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check initial state
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      // Tap to collapse
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
      expect(find.text('Content 1'), findsNothing);

      // Tap second item
      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();
      expect(find.text('Content 2'), findsOneWidget);
    });

    testWidgets('renders multiple variant correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadAccordion.multiple(
            initialValue: const ['item1'],
            children: const [
              ShadAccordionItem(
                value: 'item1',
                title: Text('Item 1'),
                child: Text('Content 1'),
              ),
              ShadAccordionItem(
                value: 'item2',
                title: Text('Item 2'),
                child: Text('Content 2'),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Check initial state
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Content 2'), findsNothing);

      // Expand second item
      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();
      expect(find.text('Content 1'), findsOneWidget);
      expect(find.text('Content 2'), findsOneWidget);

      // Collapse first item
      await tester.tap(find.text('Item 1'));
      await tester.pumpAndSettle();
      expect(find.text('Content 1'), findsNothing);
      expect(find.text('Content 2'), findsOneWidget);
    });

    /// Tests that custom styles are applied correctly to the accordion item.
    testWidgets('applies custom styles correctly', (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(20);
      const customColor = Colors.red;

      await tester.pumpWidget(
        createTestWidget(
          ShadAccordion<String>(
            children: const [
              ShadAccordionItem(
                value: 'item1',
                title: Text('Item 1'),
                padding: customPadding,
                icon: Icon(Icons.star, color: customColor),
                titleStyle: TextStyle(fontSize: 20),
                child: Text('Content 1'),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the ShadAccordionItem
      final itemFinder = find.byType(ShadAccordionItem<String>);
      expect(itemFinder, findsOneWidget);

      // Check padding - look for the Padding widget that wraps the Row
      final paddingFinder = find.descendant(
        of: itemFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Padding && widget.padding == customPadding,
        ),
      );
      expect(
        paddingFinder,
        findsOneWidget,
        reason: 'Should find Padding with custom padding',
      );
      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, customPadding);

      // Check icon color
      final iconFinder = find.descendant(
        of: itemFinder,
        matching: find.byType(Icon),
      );
      expect(iconFinder, findsOneWidget, reason: 'Should find the custom Icon');
      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.color, customColor);

      // Check title style
      final defaultTextStyleFinder = find.descendant(
        of: itemFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is DefaultTextStyle && widget.style.fontSize == 20,
        ),
      );
      expect(
        defaultTextStyleFinder,
        findsOneWidget,
        reason: 'Should find DefaultTextStyle with fontSize 20',
      );
    });

    /// Tests the hover effect on the title, ensuring underline appears when
    /// hovered.
    testWidgets('handles hover effect correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadAccordion<String>(
            children: const [
              ShadAccordionItem(
                value: 'item1',
                title: Text('Item 1'),
                underlineTitleOnHover: true,
                child: Text('Content 1'),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the ShadAccordionItem
      final itemFinder = find.byType(ShadAccordionItem<String>);
      expect(itemFinder, findsOneWidget);

      // Initial state - no underline
      final textStyleFinder = find.descendant(
        of: itemFinder,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is DefaultTextStyle &&
              widget.child is Text &&
              (widget.child as Text).data == 'Item 1',
        ),
      );
      expect(
        textStyleFinder,
        findsOneWidget,
        reason: 'Should find DefaultTextStyle wrapping title',
      );
      final initialTextStyle = tester.widget<DefaultTextStyle>(textStyleFinder);
      expect(
        initialTextStyle.style.decoration,
        TextDecoration.none,
        reason: 'No underline initially',
      );

      // Simulate hover by entering pointer
      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await tester.pump();
      await gesture.moveTo(tester.getCenter(find.text('Item 1')));
      await tester.pumpAndSettle();

      final hoverTextStyle = tester.widget<DefaultTextStyle>(textStyleFinder);
      expect(
        hoverTextStyle.style.decoration,
        TextDecoration.underline,
        reason: 'Underline should appear on hover',
      );

      // Exit hover
      await gesture.moveTo(Offset.infinite);
      await tester.pumpAndSettle();
      final exitTextStyle = tester.widget<DefaultTextStyle>(textStyleFinder);
      expect(
        exitTextStyle.style.decoration,
        TextDecoration.none,
        reason: 'Underline should disappear after hover',
      );
    });

    testWidgets('ShadAccordion matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadAccordion<String>(
            children: List.generate(2, (index) {
              return ShadAccordionItem(
                value: 'item$index',
                title: Text('Item $index'),
                child: Text('Content $index'),
              );
            }),
          ),
        ),
      );

      expect(
        find.byType(ShadAccordion<String>),
        matchesGoldenFile('goldens/accordion.png'),
      );
    });
  });
}
