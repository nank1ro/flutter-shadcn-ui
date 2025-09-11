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
                child: ShadBreadcrumbPage(
                  child: Text('Data'),
                ),
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

    testWidgets('renders breadcrumb links correctly', (WidgetTester tester) async {
      bool homeTapped = false;
      bool libraryTapped = false;

      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumb(
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
                child: ShadBreadcrumbPage(
                  child: Text('Current'),
                ),
              ),
            ],
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
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumb(
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
                child: ShadBreadcrumbPage(
                  child: Text('Current'),
                ),
              ),
            ],
          ),
        ),
      );

      expect(find.byType(ShadBreadcrumbEllipsis), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);
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
  });

  group('ShadBreadcrumbItem', () {
    testWidgets('renders child content correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbItem(
            child: Text('Test Item'),
          ),
        ),
      );

      expect(find.text('Test Item'), findsOneWidget);
      expect(find.byType(ShadBreadcrumbItem), findsOneWidget);
    });
  });

  group('ShadBreadcrumbLink', () {
    testWidgets('calls onPressed when tapped', (WidgetTester tester) async {
      bool wasTapped = false;

      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            onPressed: () => wasTapped = true,
            child: const Text('Clickable'),
          ),
        ),
      );

      expect(find.text('Clickable'), findsOneWidget);

      await tester.tap(find.text('Clickable'));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('handles hover correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadBreadcrumbLink(
            onPressed: () {},
            child: const Text('Hoverable'),
          ),
        ),
      );

      expect(find.text('Hoverable'), findsOneWidget);
      expect(find.byType(MouseRegion), findsOneWidget);
    });
  });

  group('ShadBreadcrumbPage', () {
    testWidgets('renders current page content correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbPage(
            child: Text('Current Page'),
          ),
        ),
      );

      expect(find.text('Current Page'), findsOneWidget);
      expect(find.byType(ShadBreadcrumbPage), findsOneWidget);
    });
  });

  group('ShadBreadcrumbSeparator', () {
    testWidgets('renders default separator correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbSeparator(),
        ),
      );

      expect(find.byType(ShadBreadcrumbSeparator), findsOneWidget);
      expect(find.byIcon(LucideIcons.chevronRight), findsOneWidget);
    });

    testWidgets('renders custom separator content', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbSeparator(
            child: Text(' / '),
          ),
        ),
      );

      expect(find.text(' / '), findsOneWidget);
      expect(find.byIcon(LucideIcons.chevronRight), findsNothing);
    });
  });

  group('ShadBreadcrumbEllipsis', () {
    testWidgets('renders default ellipsis correctly', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbEllipsis(),
        ),
      );

      expect(find.byType(ShadBreadcrumbEllipsis), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsOneWidget);
    });

    testWidgets('renders custom ellipsis content', (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadBreadcrumbEllipsis(
            child: Text('...'),
          ),
        ),
      );

      expect(find.text('...'), findsOneWidget);
      expect(find.byIcon(LucideIcons.ellipsis), findsNothing);
    });
  });
}
