import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/card.dart'; // Adjust import path based on your project structure
import 'package:shadcn_ui/src/theme/theme.dart';

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

  group('ShadCard', () {
    testWidgets('renders basic content correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            title: Text('Card Title'),
            description: Text('Card Description'),
            footer: Text('Card Footer'),
            child: Text('Card Content'),
          ),
        ),
      );

      // Check if all content widgets are rendered
      expect(find.text('Card Title'), findsOneWidget);
      expect(find.text('Card Description'), findsOneWidget);
      expect(find.text('Card Content'), findsOneWidget);
      expect(find.text('Card Footer'), findsOneWidget);

      // Check basic layout (Container with Row)
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final columnFinder = find.byType(Column);
      expect(columnFinder, findsOneWidget);
    });

    testWidgets('renders with leading and trailing widgets',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            child: Text('Main Content'),
          ),
        ),
      );

      // Check if leading, child, and trailing are rendered
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Main Content'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      // Check layout includes all three in a Row
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      expect(
        find.descendant(of: rowFinder, matching: find.byType(Icon)),
        findsNWidgets(2),
      );
      expect(
        find.descendant(of: rowFinder, matching: find.text('Main Content')),
        findsOneWidget,
      );
    });

    testWidgets('applies custom padding correctly',
        (WidgetTester tester) async {
      const customPadding = EdgeInsets.all(40);
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            padding: customPadding,
            child: Text('Padded Card'),
          ),
        ),
      );

      // Check Container applies custom padding
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      expect(container.padding, customPadding);
    });

    testWidgets('applies custom background color and radius correctly',
        (WidgetTester tester) async {
      const customBackgroundColor = Colors.blue;
      const customRadius = BorderRadius.all(Radius.circular(12));
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            backgroundColor: customBackgroundColor,
            radius: customRadius,
            child: Text('Styled Card'),
          ),
        ),
      );

      // Check Container applies custom background color and radius
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, customBackgroundColor);
      expect(decoration?.borderRadius, customRadius);
    });

    testWidgets('applies custom width and height correctly',
        (WidgetTester tester) async {
      const customWidth = 300.0;
      const customHeight = 200.0;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            width: customWidth,
            height: customHeight,
            child: Text('Sized Card'),
          ),
        ),
      );

      // Check Container applies custom width and height
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      expect(container.constraints?.maxWidth, customWidth);
      expect(container.constraints?.maxHeight, customHeight);
    });

    testWidgets('handles row alignment correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            leading: Icon(Icons.star),
            trailing: Icon(Icons.arrow_forward),
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            child: Text('Aligned Card'),
          ),
        ),
      );

      // Check Row applies custom alignments
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final row = tester.widget<Row>(rowFinder);
      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('handles column alignment correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            title: Text('Title'),
            description: Text('Description'),
            columnMainAxisAlignment: MainAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      );

      // Check Column applies custom alignments
      final columnFinder = find.byType(Column);
      expect(columnFinder, findsOneWidget);
      final column = tester.widget<Column>(columnFinder);
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('renders without optional content',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            child: Text('Minimal Card'),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsNothing); // No leading
      expect(find.text('Title'), findsNothing); // No title
      expect(find.text('Footer'), findsNothing); // No footer
    });

    testWidgets('applies default theme styles when not specified',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            child: Text('Default Styled Card'),
          ),
        ),
      );

      // Check Container uses default padding and theme styles
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration?;
      expect(container.padding, const EdgeInsets.all(24)); // Default padding
      expect(
        decoration?.color,
        ShadTheme.of(tester.element(containerFinder)).colorScheme.card,
      );
      expect(
        decoration?.borderRadius,
        ShadTheme.of(tester.element(containerFinder)).cardTheme.radius,
      );
      expect(decoration?.border, isNotNull);
    });

    testWidgets('ShadCard matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCard(
            title: Text('title'),
            description: Text('description'),
            footer: Text('footer'),
            leading: Text('leading'),
            trailing: Text('trailing'),
            child: Text('content'),
          ),
        ),
      );

      expect(
        find.byType(ShadCard),
        matchesGoldenFile('goldens/card.png'),
      );
    });
  });
}
