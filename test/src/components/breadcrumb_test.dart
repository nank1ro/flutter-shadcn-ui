import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/breadcrumb.dart';

import '../../extra/pump_async_widget.dart';

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
    testWidgets('renders basic breadcrumb correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: Text('Home'),
              ),
              ShadBreadcrumbItem(
                child: Text('Library'),
              ),
              ShadBreadcrumbItem(
                child: Text('Data'),
                isCurrentPage: true,
              ),
            ],
          ),
        ),
      );

      // Check if all breadcrumb items render
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Library'), findsOneWidget);
      expect(find.text('Data'), findsOneWidget);

      // Check basic layout (Row should contain the children and separators)
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);

      // Should have 2 separators between 3 items (chevron icons)
      final iconFinder = find.byIcon(LucideIcons.chevronRight);
      expect(iconFinder, findsNWidgets(2));
    });

    testWidgets('renders with custom separator', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
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
      );

      // Check if custom separator is used
      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
      expect(find.byIcon(LucideIcons.chevronRight), findsNothing);
    });

    testWidgets('handles text direction correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
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
      );

      // Check Row reflects RTL text direction
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final row = tester.widget<Row>(rowFinder);
      expect(row.textDirection, TextDirection.rtl);
    });

    testWidgets('applies custom alignment correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
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
      );

      // Check Row alignment
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final row = tester.widget<Row>(rowFinder);
      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.crossAxisAlignment, CrossAxisAlignment.end);
    });
  });

  group('ShadBreadcrumbItem', () {
    testWidgets('renders basic item correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbItem(
            child: Text('Home'),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('handles current page state correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbItem(
            child: Text('Current Page'),
            isCurrentPage: true,
          ),
        ),
      );

      expect(find.text('Current Page'), findsOneWidget);
      
      // Verify the item widget exists
      final itemFinder = find.byType(ShadBreadcrumbItem);
      expect(itemFinder, findsOneWidget);
      final item = tester.widget<ShadBreadcrumbItem>(itemFinder);
      expect(item.isCurrentPage, true);
    });
  });

  group('ShadBreadcrumbLink', () {
    testWidgets('renders link correctly', (WidgetTester tester) async {
      var pressed = false;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            onPressed: () => pressed = true,
            child: const Text('Home'),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);

      // Tap the link
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();

      // Verify onPressed was called
      expect(pressed, true);
    });

    testWidgets('handles disabled state correctly', (WidgetTester tester) async {
      var pressed = false;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            onPressed: null, // Disabled by setting onPressed to null
            child: const Text('Disabled Link'),
          ),
        ),
      );

      expect(find.text('Disabled Link'), findsOneWidget);

      // Try to tap the disabled link
      await tester.tap(find.text('Disabled Link'));
      await tester.pumpAndSettle();

      // Verify onPressed was not called (since it's null)
      expect(pressed, false);
    });

    testWidgets('handles cursor correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            cursor: SystemMouseCursors.help,
            onPressed: () {},
            child: const Text('Help Link'),
          ),
        ),
      );

      // Find the MouseRegion within the breadcrumb link specifically
      final linkFinder = find.byType(ShadBreadcrumbLink);
      expect(linkFinder, findsOneWidget);
      
      final mouseRegionFinder = find.descendant(
        of: linkFinder,
        matching: find.byType(MouseRegion),
      );
      expect(mouseRegionFinder, findsOneWidget);
      final mouseRegion = tester.widget<MouseRegion>(mouseRegionFinder);
      expect(mouseRegion.cursor, SystemMouseCursors.help);
    });
  });

  group('ShadBreadcrumbEllipsis', () {
    testWidgets('renders ellipsis correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbEllipsis(),
        ),
      );

      // Check if ellipsis icon is rendered
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);

      // Check if it's wrapped in a SizedBox with correct dimensions
      final ellipsisFinder = find.byType(ShadBreadcrumbEllipsis);
      expect(ellipsisFinder, findsOneWidget);
      
      final sizedBoxFinder = find.descendant(
        of: ellipsisFinder,
        matching: find.byWidgetPredicate((widget) => 
          widget is SizedBox && 
          widget.width == 36 && 
          widget.height == 36),
      );
      expect(sizedBoxFinder, findsOneWidget);
      final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
      expect(sizedBox.width, 36);
      expect(sizedBox.height, 36);
    });

    testWidgets('renders custom ellipsis widget', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbEllipsis(
            child: Icon(Icons.more_horiz),
          ),
        ),
      );

      // Check if custom ellipsis is rendered
      expect(find.byIcon(Icons.more_horiz), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsNothing);
    });
  });

  group('ShadBreadcrumb Integration', () {
    testWidgets('renders breadcrumb with links and ellipsis', (WidgetTester tester) async {
      var homePressed = false;
      var libraryPressed = false;

      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () => homePressed = true,
                  child: const Text('Home'),
                ),
              ),
              const ShadBreadcrumbItem(
                child: ShadBreadcrumbEllipsis(),
              ),
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () => libraryPressed = true,
                  child: const Text('Library'),
                ),
              ),
              const ShadBreadcrumbItem(
                child: Text('Current'),
                isCurrentPage: true,
              ),
            ],
          ),
        ),
      );

      // Check all elements are rendered
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Library'), findsOneWidget);
      expect(find.text('Current'), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);

      // Should have 3 separators between 4 items
      expect(find.byIcon(LucideIcons.chevronRight), findsNWidgets(3));

      // Test link interactions
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(homePressed, true);

      await tester.tap(find.text('Library'));
      await tester.pumpAndSettle();
      expect(libraryPressed, true);
    });

    testWidgets('respects theme spacing', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
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
      );

      // Find SizedBox widgets that provide spacing
      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsAtLeastNWidgets(2)); // Should have spacing SizedBoxes

      final sizedBoxes = tester.widgetList<SizedBox>(sizedBoxFinder);
      final spacingSizedBoxes = sizedBoxes.where((box) => box.width == 8.0).toList();
      expect(spacingSizedBoxes.length, 2); // One before and one after separator
    });

    testWidgets('handles empty children list', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            children: [],
          ),
        ),
      );

      // Should render without crashing
      final rowFinder = find.byType(Row);
      expect(rowFinder, findsOneWidget);
      final row = tester.widget<Row>(rowFinder);
      expect(row.children, isEmpty);
    });

    testWidgets('handles single child correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: Text('Home'),
              ),
            ],
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      // Should have no separators with single item
      expect(find.byIcon(LucideIcons.chevronRight), findsNothing);
    });
  });

  group('Golden Tests', () {
    // Golden tests are enabled
    // Run with --update-goldens to create the initial golden files
    
    testWidgets('ShadBreadcrumb basic matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: Text('Home'),
              ),
              ShadBreadcrumbItem(
                child: Text('Library'),
              ),
              ShadBreadcrumbPage(
                child: Text('Data'),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadBreadcrumb),
        matchesGoldenFile('goldens/breadcrumb_basic.png'),
      );
    });

    testWidgets('ShadBreadcrumb with links matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () {},
                  child: const Text('Home'),
                ),
              ),
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () {},
                  child: const Text('Components'),
                ),
              ),
              const ShadBreadcrumbPage(
                child: Text('Breadcrumb'),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadBreadcrumb),
        matchesGoldenFile('goldens/breadcrumb_with_links.png'),
      );
    });

    testWidgets('ShadBreadcrumb with ellipsis matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumb(
            children: [
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () {},
                  child: const Text('Home'),
                ),
              ),
              const ShadBreadcrumbItem(
                child: ShadBreadcrumbEllipsis(),
              ),
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () {},
                  child: const Text('Components'),
                ),
              ),
              const ShadBreadcrumbPage(
                child: Text('Breadcrumb'),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadBreadcrumb),
        matchesGoldenFile('goldens/breadcrumb_with_ellipsis.png'),
      );
    });

    testWidgets('ShadBreadcrumb with custom separator matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
            separator: Icon(Icons.arrow_forward_ios, size: 14),
            children: [
              ShadBreadcrumbItem(
                child: Text('Home'),
              ),
              ShadBreadcrumbItem(
                child: Text('Library'),
              ),
              ShadBreadcrumbPage(
                child: Text('Data'),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadBreadcrumb),
        matchesGoldenFile('goldens/breadcrumb_custom_separator.png'),
      );
    });
  });
}
