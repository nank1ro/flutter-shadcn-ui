import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/alert.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadAlert', () {
    testWidgets('renders primary variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            title: Text('Primary Alert'),
            description: Text('This is a primary alert'),
            iconData: Icons.info,
          ),
        ),
      );

      // Check if components render
      expect(find.text('Primary Alert'), findsOneWidget);
      expect(find.text('This is a primary alert'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);

      // Check basic layout
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('renders destructive variant correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert.destructive(
            title: Text('Error Alert'),
            description: Text('This is a destructive alert'),
            iconData: Icons.error,
          ),
        ),
      );

      // Check if components render
      expect(find.text('Error Alert'), findsOneWidget);
      expect(find.text('This is a destructive alert'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('renders without icon when not provided',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            title: Text('No Icon Alert'),
            description: Text('This alert has no icon'),
          ),
        ),
      );

      // Check text renders
      expect(find.text('No Icon Alert'), findsOneWidget);
      expect(find.text('This alert has no icon'), findsOneWidget);

      // Check no icon is present
      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('applies custom styles correctly', (WidgetTester tester) async {
      const customColor = Colors.red;
      const customPadding = EdgeInsets.all(20);

      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            title: Text('Styled Alert'),
            iconData: Icons.info,
            iconColor: customColor,
            iconPadding: customPadding,
            titleStyle: TextStyle(fontSize: 20),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the specific ShadAlert widget
      final alertFinder = find.byType(ShadAlert);
      expect(alertFinder, findsOneWidget);

      // Find the icon within the ShadAlert and check its color
      final iconFinder = find.descendant(
        of: alertFinder,
        matching: find.byType(Icon),
      );
      expect(iconFinder, findsOneWidget);
      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.color, customColor);

      // Find the specific padding that wraps the icon
      final paddingFinder = find.ancestor(
        of: iconFinder,
        matching: find.byType(Padding),
      );
      final padding = tester.widget<Padding>(paddingFinder.first);
      expect(padding.padding, customPadding);

      // Find the DefaultTextStyle within the ShadAlert that styles the title
      final defaultTextStyleFinder = find.descendant(
        of: alertFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is DefaultTextStyle,
        ),
      );
      expect(defaultTextStyleFinder, findsOneWidget);
      final defaultTextStyle =
          tester.widget<DefaultTextStyle>(defaultTextStyleFinder);
      expect(defaultTextStyle.style.fontSize, 20);
    });

    testWidgets('handles text direction correctly',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            title: Text('RTL Alert'),
            textDirection: TextDirection.rtl,
          ),
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.textDirection, TextDirection.rtl);
    });

    testWidgets('handles null title and description',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            iconData: Icons.info,
          ),
        ),
      );

      // Check icon renders
      expect(find.byIcon(Icons.info), findsOneWidget);

      // Check no text widgets are present
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('ShardAlert matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert(
            iconData: LucideIcons.mail,
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      expect(
        find.byType(ShadAlert),
        matchesGoldenFile('goldens/alert.png'),
      );
    });

    testWidgets('ShardAlert.destructive matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadAlert.destructive(
            iconData: LucideIcons.mail,
            title: Text('Title'),
            description: Text('Description'),
          ),
        ),
      );

      expect(
        find.byType(ShadAlert),
        matchesGoldenFile('goldens/alert_destructive.png'),
      );
    });
  });
}
