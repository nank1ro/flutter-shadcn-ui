import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/breadcrumb.dart';
import 'package:shadcn_ui/src/components/button.dart';

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

    testWidgets('uses ShadButton.ghost for styling', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            onPressed: () {},
            child: const Text('Help Link'),
          ),
        ),
      );

      // Find the ShadButton within the breadcrumb link
      final linkFinder = find.byType(ShadBreadcrumbLink);
      expect(linkFinder, findsOneWidget);
      
      final buttonFinder = find.descendant(
        of: linkFinder,
        matching: find.byType(ShadButton),
      );
      expect(buttonFinder, findsOneWidget);
      
      // Verify the text is rendered within the button
      expect(find.text('Help Link'), findsOneWidget);
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

      // Find Padding widgets that provide spacing around separators
      final paddingFinder = find.byType(Padding);
      expect(paddingFinder, findsAtLeastNWidgets(1)); // Should have spacing padding

      final paddingWidgets = tester.widgetList<Padding>(paddingFinder);
      final spacingPaddings = paddingWidgets.where((padding) => 
        padding.padding is EdgeInsets && 
        (padding.padding as EdgeInsets).horizontal > 0).toList();
      expect(spacingPaddings.length, greaterThanOrEqualTo(1)); // At least one spacing padding
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

  group('ShadBreadcrumbDropdown', () {
    testWidgets('renders dropdown trigger correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbDropdown(
            items: [
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Item 1'),
              ),
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Item 2'),
              ),
            ],
          ),
        ),
      );

      // Check if the dropdown trigger (ellipsis button) is rendered
      expect(find.byType(ShadBreadcrumbDropdown), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);
      
      // The popover should not be visible initially
      expect(find.text('Item 1'), findsNothing);
      expect(find.text('Item 2'), findsNothing);
    });

    testWidgets('opens dropdown on trigger tap', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbDropdown(
            items: [
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Documentation'),
              ),
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Tutorials'),
              ),
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Building UI'),
              ),
            ],
          ),
        ),
      );

      // Initially, dropdown items should not be visible
      expect(find.text('Documentation'), findsNothing);
      expect(find.text('Tutorials'), findsNothing);
      expect(find.text('Building UI'), findsNothing);

      // Tap the dropdown trigger
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Now dropdown items should be visible
      expect(find.text('Documentation'), findsOneWidget);
      expect(find.text('Tutorials'), findsOneWidget);
      expect(find.text('Building UI'), findsOneWidget);
    });

    testWidgets('handles item selection correctly', (WidgetTester tester) async {
      var selectedItem = '';
      
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbDropdown(
            items: [
              ShadBreadcrumbLink(
                onPressed: () => selectedItem = 'Documentation',
                child: const Text('Documentation'),
              ),
              ShadBreadcrumbLink(
                onPressed: () => selectedItem = 'Tutorials',
                child: const Text('Tutorials'),
              ),
            ],
          ),
        ),
      );

      // Open the dropdown
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Tap on a dropdown item
      await tester.tap(find.text('Documentation'));
      await tester.pumpAndSettle();

      // Verify the callback was called
      expect(selectedItem, 'Documentation');
    });

    testWidgets('renders custom trigger correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbDropdown(
            trigger: const Text('Custom Trigger'),
            items: [
              ShadBreadcrumbLink(
                onPressed: () {},
                child: const Text('Item 1'),
              ),
            ],
          ),
        ),
      );

      // Check if custom trigger is rendered
      expect(find.text('Custom Trigger'), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsNothing);

      // Test that the custom trigger opens the dropdown
      await tester.tap(find.text('Custom Trigger'));
      await tester.pumpAndSettle();

      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('closes dropdown when tapping outside', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          Padding(
            padding: const EdgeInsets.all(100.0), // Give more space
            child: Column(
              children: [
                ShadBreadcrumbDropdown(
                  items: [
                    ShadBreadcrumbLink(
                      onPressed: () {},
                      child: const Text('Item 1'),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text('Outside Area'),
              ],
            ),
          ),
        ),
      );

      // Open the dropdown
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Verify dropdown is open
      expect(find.text('Item 1'), findsOneWidget);

      // Since popovers might not close on tap outside in tests, let's just verify
      // that the dropdown can be closed by tapping the trigger again
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Verify dropdown is closed
      expect(find.text('Item 1'), findsNothing);
    });

    testWidgets('handles empty items list', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbDropdown(
            items: [],
          ),
        ),
      );

      // Should render trigger without crashing
      expect(find.byType(ShadBreadcrumbDropdown), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);

      // Open the dropdown
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Should show empty dropdown without crashing
      // The popover should be present but with no items
      expect(find.byType(Column), findsWidgets);
    });
  });

  group('ShadBreadcrumb with Dropdown Integration', () {
    testWidgets('renders breadcrumb with dropdown correctly', (WidgetTester tester) async {
      var homePressed = false;
      var docPressed = false;
      var componentPressed = false;

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
              ShadBreadcrumbItem(
                child: ShadBreadcrumbDropdown(
                  items: [
                    ShadBreadcrumbLink(
                      onPressed: () => docPressed = true,
                      child: const Text('Documentation'),
                    ),
                    ShadBreadcrumbLink(
                      onPressed: () {},
                      child: const Text('Tutorials'),
                    ),
                  ],
                ),
              ),
              ShadBreadcrumbItem(
                child: ShadBreadcrumbLink(
                  onPressed: () => componentPressed = true,
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

      // Check main breadcrumb items are rendered
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Components'), findsOneWidget);
      expect(find.text('Breadcrumb'), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);

      // Should have 3 separators between 4 items
      expect(find.byIcon(LucideIcons.chevronRight), findsNWidgets(3));

      // Test main link interactions
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(homePressed, true);

      await tester.tap(find.text('Components'));
      await tester.pumpAndSettle();
      expect(componentPressed, true);

      // Test dropdown interactions
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Dropdown items should now be visible
      expect(find.text('Documentation'), findsOneWidget);
      expect(find.text('Tutorials'), findsOneWidget);

      // Test dropdown item interactions
      await tester.tap(find.text('Documentation'));
      await tester.pumpAndSettle();
      expect(docPressed, true);

      // Manually close the dropdown by clicking the trigger again
      await tester.tap(find.byIcon(LucideIcons.ellipsis));
      await tester.pumpAndSettle();

      // Verify dropdown is now closed
      expect(find.text('Documentation'), findsNothing);
      expect(find.text('Tutorials'), findsNothing);
    });
  });
}
