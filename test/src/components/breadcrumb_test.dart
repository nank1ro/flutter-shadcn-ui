import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/breadcrumb.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/theme/components/breadcrumb.dart';
import 'package:shadcn_ui/src/theme/data.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  group('ShadBreadcrumb', () {
    testWidgets('renders basic breadcrumb correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadApp(
            home: ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Data'),
                ),
              ],
            ),
          ),
        ),
      );

      // Check if all breadcrumb items render
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Library'), findsOneWidget);
      expect(find.text('Data'), findsOneWidget);

      // Check basic layout (Wrap should contain the children and separators)
      final wrapFinder = find.byType(Wrap);
      expect(wrapFinder, findsOneWidget);

      // Should have 2 separators between 3 items (chevron icons)
      final iconFinder = find.byIcon(LucideIcons.chevronRight);
      expect(iconFinder, findsNWidgets(2));
    });

    testWidgets('renders with custom separator', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadApp(
            home: ShadBreadcrumb(
              separator: Icon(Icons.arrow_forward_ios),
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
              ],
            ),
          ),
        ),
      );

      // Check if custom separator is used
      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
      expect(find.byIcon(LucideIcons.chevronRight), findsNothing);
    });

    testWidgets('renders breadcrumb links correctly', (
      WidgetTester tester,
    ) async {
      var homeTapped = false;
      var libraryTapped = false;

      await tester.pumpWidget(
        createTestWidget(
          ShadApp(
            home: ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: () => homeTapped = true,
                    child: const Text('Home'),
                  ),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbLink(
                    onPressed: () => libraryTapped = true,
                    child: const Text('Library'),
                  ),
                ),
                const ShadBreadcrumbItem(
                  child: Text('Current'),
                ),
              ],
            ),
          ),
        ),
      );

      // Test tapping links
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(homeTapped, true);

      await tester.tap(find.text('Library'));
      await tester.pumpAndSettle();
      expect(libraryTapped, true);
    });

    testWidgets('renders ellipsis correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadApp(
            home: ShadBreadcrumb(
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: ShadBreadcrumbEllipsis(),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Current'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(ShadBreadcrumbEllipsis), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);
    });

    testWidgets('handles text direction correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadApp(
            home: ShadBreadcrumb(
              textDirection: TextDirection.rtl,
              children: [
                ShadBreadcrumbItem(
                  child: Text('Home'),
                ),
                ShadBreadcrumbItem(
                  child: Text('Library'),
                ),
              ],
            ),
          ),
        ),
      );

      // Check Wrap reflects RTL text direction
      final wrapFinder = find.byType(Wrap);
      expect(wrapFinder, findsOneWidget);
      final wrap = tester.widget<Wrap>(wrapFinder);
      expect(wrap.textDirection, TextDirection.rtl);
    });
  });

  group('ShadBreadcrumbItem', () {
    testWidgets('renders child content correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadApp(
            home: ShadBreadcrumbItem(
              child: Text('Test Item'),
            ),
          ),
        ),
      );

      expect(find.text('Test Item'), findsOneWidget);
      expect(find.byType(ShadBreadcrumbItem), findsOneWidget);
    });
  });

  group('ShadBreadcrumbLink', () {
    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      var wasTapped = false;

      await tester.pumpWidget(
        createTestWidget(
          ShadApp(
            home: ShadBreadcrumbLink(
              onPressed: () => wasTapped = true,
              child: const Text('Clickable'),
            ),
          ),
        ),
      );

      expect(find.text('Clickable'), findsOneWidget);

      await tester.tap(find.text('Clickable'));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('handles hover correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadApp(
            home: ShadBreadcrumbLink(
              onPressed: () {},
              child: const Text('Hoverable'),
            ),
          ),
        ),
      );

      expect(find.text('Hoverable'), findsOneWidget);
      final button = find.widgetWithText(ShadButton, 'Hoverable');
      expect(
        find.descendant(of: button, matching: find.byType(MouseRegion)),
        findsOneWidget,
      );
    });
  });

  group('ShadBreadcrumbSeparator', () {
    testWidgets('renders default separator correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadBreadcrumbSeparator(),
        ),
      );

      expect(find.byType(ShadBreadcrumbSeparator), findsOneWidget);
      expect(find.byIcon(LucideIcons.chevronRight), findsOneWidget);
    });
  });

  group('ShadBreadcrumbEllipsis', () {
    testWidgets('renders default ellipsis correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadBreadcrumbEllipsis(),
        ),
      );

      expect(find.byType(ShadBreadcrumbEllipsis), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);
    });
  });

  group('ShadBreadcrumbDropdown', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Dropdown'), findsOneWidget);
    });

    testWidgets('displays chevron down icon', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(LucideIcons.chevronDown), findsOneWidget);
    });

    testWidgets('shows popover when clicked', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
                ShadBreadcrumbDropMenuItem(child: Text('Item 2')),
              ],
            ),
          ),
        ),
      );

      // Initially, dropdown items should not be visible
      expect(find.text('Item 1'), findsNothing);
      expect(find.text('Item 2'), findsNothing);

      // Tap to open dropdown
      await tester.tap(find.text('Dropdown'));
      await tester.pumpAndSettle();

      // Dropdown items should now be visible
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('hides popover when clicked again', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
              ],
            ),
          ),
        ),
      );

      // Open dropdown
      await tester.tap(find.text('Dropdown'));
      await tester.pumpAndSettle();
      expect(find.text('Item 1'), findsOneWidget);

      // Close dropdown
      await tester.tap(find.text('Dropdown'));
      await tester.pumpAndSettle();
      expect(find.text('Item 1'), findsNothing);
    });

    testWidgets('displays multiple dropdown items', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('More'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Components')),
                ShadBreadcrumbDropMenuItem(child: Text('Documentation')),
                ShadBreadcrumbDropMenuItem(child: Text('Themes')),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('More'));
      await tester.pumpAndSettle();

      expect(find.text('Components'), findsOneWidget);
      expect(find.text('Documentation'), findsOneWidget);
      expect(find.text('Themes'), findsOneWidget);
    });

    testWidgets('respects theme spacing', (tester) async {
      const testSpacing = 10.0;

      await tester.pumpWidget(
        ShadApp(
          theme: ShadThemeData(
            brightness: Brightness.light,
            breadcrumbTheme: const ShadBreadcrumbTheme(
              spacing: testSpacing,
            ),
          ),
          home: const Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
              ],
            ),
          ),
        ),
      );

      // Verify the widget builds without error
      expect(find.text('Dropdown'), findsOneWidget);
    });

    testWidgets('controller is disposed properly', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Dropdown'),
              children: [
                ShadBreadcrumbDropMenuItem(child: Text('Item 1')),
              ],
            ),
          ),
        ),
      );

      // Remove the widget
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      // If we get here without errors, disposal worked correctly
      expect(find.byType(ShadBreadcrumbDropdown), findsNothing);
    });
  });

  group('ShadBreadcrumbDropMenuItem', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              child: Text('Menu Item'),
            ),
          ),
        ),
      );

      expect(find.text('Menu Item'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var wasPressed = false;

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              onPressed: () => wasPressed = true,
              child: const Text('Clickable Item'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Clickable Item'));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets('does not call onPressed when null', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              child: Text('Non-clickable Item'),
            ),
          ),
        ),
      );

      // Should not throw error when tapped with null onPressed
      await tester.tap(find.text('Non-clickable Item'));
      await tester.pumpAndSettle();

      expect(find.text('Non-clickable Item'), findsOneWidget);
    });

    testWidgets('applies default padding', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              child: Text('Item'),
            ),
          ),
        ),
      );

      final button = tester.widget<ShadButton>(find.byType(ShadButton));
      expect(
        button.padding,
        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      );
    });

    testWidgets('applies custom padding', (tester) async {
      const customPadding = EdgeInsets.all(12);

      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              itemPadding: customPadding,
              child: Text('Item'),
            ),
          ),
        ),
      );

      final button = tester.widget<ShadButton>(find.byType(ShadButton));
      expect(button.padding, customPadding);
    });

    testWidgets('uses ghost button variant', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              child: Text('Item'),
            ),
          ),
        ),
      );

      final button = tester.widget<ShadButton>(find.byType(ShadButton));
      expect(button.variant, ShadButtonVariant.ghost);
    });

    testWidgets('renders complex child widget', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropMenuItem(
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8),
                  Text('Home'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
    });
  });

  group('ShadBreadcrumbDropdown integration', () {
    testWidgets('dropdown items respond to tap', (tester) async {
      var selectedItem = '';

      await tester.pumpWidget(
        ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: const Text('Select'),
              children: [
                ShadBreadcrumbDropMenuItem(
                  onPressed: () => selectedItem = 'Item 1',
                  child: const Text('Item 1'),
                ),
                ShadBreadcrumbDropMenuItem(
                  onPressed: () => selectedItem = 'Item 2',
                  child: const Text('Item 2'),
                ),
              ],
            ),
          ),
        ),
      );

      // Open dropdown
      await tester.tap(find.text('Select'));
      await tester.pumpAndSettle();

      // Tap an item
      await tester.tap(find.text('Item 2'));
      await tester.pumpAndSettle();

      expect(selectedItem, 'Item 2');
    });

    testWidgets('works with empty children list', (tester) async {
      await tester.pumpWidget(
        const ShadApp(
          home: Scaffold(
            body: ShadBreadcrumbDropdown(
              child: Text('Empty'),
              children: [],
            ),
          ),
        ),
      );

      expect(find.text('Empty'), findsOneWidget);

      // Should be able to toggle even with no items
      await tester.tap(find.text('Empty'));
      await tester.pumpAndSettle();
    });
  });
}
