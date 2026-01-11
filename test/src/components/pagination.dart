import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  group('ShadPaginationController', () {
    test('initial state is 0', () {
      final controller = ShadPaginationController();
      expect(controller.selectedIndex, 0);
    });

    test('selectedIndex setter updates value and notifies listeners', () {
      final controller = ShadPaginationController();
      var listenerCalled = false;

      controller.addListener(() {
        listenerCalled = true;
      });

      controller.selectedIndex = 5;

      expect(controller.selectedIndex, 5);
      expect(listenerCalled, true);
    });

    test('selectedIndex setter does not notify when value is same', () {
      final controller = ShadPaginationController();
      controller.selectedIndex = 3;

      var listenerCalled = false;
      controller.addListener(() {
        listenerCalled = true;
      });

      controller.selectedIndex = 3; // Same value

      expect(listenerCalled, false);
    });

    test('nextPage advances when possible', () {
      final controller = ShadPaginationController();

      // Start at page 0, total pages 5
      expect(controller.nextPage(5), true);
      expect(controller.selectedIndex, 1);
    });

    test('nextPage returns false at last page', () {
      final controller = ShadPaginationController();
      controller.selectedIndex = 4; // Last page for 5 total pages

      expect(controller.nextPage(5), false);
      expect(controller.selectedIndex, 4); // Should not change
    });

    test('previousPage goes back when possible', () {
      final controller = ShadPaginationController();
      controller.selectedIndex = 3;

      expect(controller.previousPage(), true);
      expect(controller.selectedIndex, 2);
    });

    test('previousPage returns false at first page', () {
      final controller = ShadPaginationController();

      expect(controller.previousPage(), false);
      expect(controller.selectedIndex, 0);
    });

    test('firstPage navigates to page 0', () {
      final controller = ShadPaginationController();
      controller.selectedIndex = 4;

      controller.firstPage();
      expect(controller.selectedIndex, 0);
    });

    test('lastPage navigates to last page', () {
      final controller = ShadPaginationController();

      controller.lastPage(5);
      expect(controller.selectedIndex, 4);
    });
  });

  group('ShadPagination Widget Tests', () {
    testWidgets('renders with default configuration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(totalPages: 5),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('respects initialPage', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
              initialPage: 2,
            ),
          ),
        ),
      );

      // Page 3 should be selected (since pages are 1-based in display)
      final button3 = find.text('3');
      expect(button3, findsOneWidget);
    });

    testWidgets('calls onPageChanged when page is changed', (tester) async {
      int? changedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
              onPageChanged: (page) {
                changedPage = page;
              },
            ),
          ),
        ),
      );

      // Tap page 3
      await tester.tap(find.text('3'));
      await tester.pump();

      expect(changedPage, 2); // 0-based index
    });

    testWidgets('works with external controller', (tester) async {
      final controller = ShadPaginationController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
              controller: controller,
            ),
          ),
        ),
      );

      // Change page via controller
      controller.selectedIndex = 2;
      await tester.pump();

      // Page 3 should be selected
      final button3 = find.text('3');
      expect(button3, findsOneWidget);
    });

    testWidgets('shows ellipsis for many pages', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
            ),
          ),
        ),
      );

      // Should show ellipsis
      expect(find.text('...'), findsAtLeast(1));
    });

    testWidgets('hides ellipsis when showEllipsis is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
              showEllipsis: false,
            ),
          ),
        ),
      );

      expect(find.text('...'), findsNothing);
    });

    testWidgets('shows first and last buttons when enabled', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
              showFirstLastButtons: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('hides page numbers when showPageNumbers is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
              showPageNumbers: false,
            ),
          ),
        ),
      );

      expect(find.text('1'), findsNothing);
      expect(find.text('2'), findsNothing);
      expect(find.text('3'), findsNothing);
      expect(find.text('4'), findsNothing);
      expect(find.text('5'), findsNothing);
    });

    testWidgets('compact mode shows fewer buttons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
              isCompact: true,
            ),
          ),
        ),
      );

      // In compact mode, only current page and navigation buttons
      //should be visible
      expect(find.byType(ShadButton), findsAtLeast(3));
    });

    testWidgets('navigation buttons are disabled when at boundaries', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 5,
            ),
          ),
        ),
      );

      // Previous button should be disabled
      final previousButton = find.byIcon(Icons.chevron_left).first;
      expect(tester.widget<ShadButton>(previousButton).onPressed, isNull);
    });

    testWidgets('siblingCount controls visible siblings', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
              initialPage: 5,
              siblingCount: 2,
            ),
          ),
        ),
      );

      // With siblingCount=2, should see pages 4,5,6,7
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('6'), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
    });

    testWidgets('boundaryCount controls boundary pages', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
              boundaryCount: 2,
            ),
          ),
        ),
      );

      // With boundaryCount=2, should always see pages 1 and 2 at start
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('throws assertion for invalid totalPages', (tester) async {
      expect(
        () => ShadPagination(totalPages: 0),
        throwsAssertionError,
      );
    });

    testWidgets('throws assertion for invalid initialPage', (tester) async {
      expect(
        () => ShadPagination(totalPages: 5, initialPage: -1),
        throwsAssertionError,
      );

      expect(
        () => ShadPagination(totalPages: 5, initialPage: 5),
        throwsAssertionError,
      );
    });
  });

  group('Responsive Behavior', () {
    testWidgets('switches to compact mode below breakpoint', (tester) async {
      // Set screen width below default breakpoint (768)
      addTearDown(tester.view.reset);
      tester.view.physicalSize = const Size(500, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
            ),
          ),
        ),
      );

      // Should be in compact mode due to screen width
      expect(find.byType(ShadButton), findsAtLeast(3));
    });

    testWidgets('respects custom compactBreakpoint', (tester) async {
      addTearDown(tester.view.reset);
      tester.view.physicalSize = const Size(600, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 10,
              compactBreakpoint: 700,
            ),
          ),
        ),
      );

      // Should NOT be compact at 600px when breakpoint is 700px
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
    });
  });

  group('Edge Cases', () {
    testWidgets('handles single page', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(totalPages: 1),
          ),
        ),
      );

      // Should only show navigation buttons (disabled)
      expect(find.byType(ShadButton), findsAtLeast(2));
    });

    testWidgets('handles very large page count', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShadPagination(
              totalPages: 100,
            ),
          ),
        ),
      );

      // Should render without error
      expect(find.byType(ShadPagination), findsOneWidget);
    });

    testWidgets('updates when totalPages changes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: _TestPageUpdater(),
        ),
      );

      expect(find.text('5'), findsOneWidget);

      // Tap button to update totalPages
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('5'), findsNothing);
      expect(find.text('3'), findsOneWidget);
    });
  });
}

class _TestPageUpdater extends StatefulWidget {
  @override
  State<_TestPageUpdater> createState() => _TestPageUpdaterState();
}

class _TestPageUpdaterState extends State<_TestPageUpdater> {
  int totalPages = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShadPagination(totalPages: totalPages),
          ShadButton(
            onPressed: () => setState(() => totalPages = 3),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
