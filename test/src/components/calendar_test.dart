import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/button.dart';
import 'package:shadcn_ui/src/components/calendar.dart'; // Adjust import path based on your project structure
import 'package:shadcn_ui/src/components/icon_button.dart';
import 'package:shadcn_ui/src/utils/extensions/date_time.dart';

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

  group('ShadCalendar', () {
    testWidgets('renders single variant correctly',
        (WidgetTester tester) async {
      final now = DateTime.now();
      final initialMonth = DateTime(now.year, now.month);
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar(
            initialMonth: initialMonth,
          ),
        ),
      );

      // Check if the current month is displayed in the header
      final monthYearText = DateFormat('MMMM y').format(initialMonth);
      expect(find.text(monthYearText), findsOneWidget);

      // Check navigation buttons are present
      expect(find.byType(ShadIconButton), findsNWidgets(2));

      // Check weekday names are rendered (default 7 days)
      expect(find.byType(GridView), findsOneWidget);

      // Find the Column containing the calendar month (header, weekdays, grid)
      final monthColumnFinder = find.ancestor(
        of: find.byType(GridView).first,
        matching: find.byType(Column),
      );
      expect(monthColumnFinder, findsOneWidget);

      // Find the Row within the Column that has exactly 7 Text children
      // (weekdays)
      final weekdayRowFinder = find.descendant(
        of: monthColumnFinder,
        matching: find.byWidgetPredicate(
          (widget) =>
              widget is Row &&
              tester
                      .widgetList(
                        find.descendant(
                          of: find.byWidget(widget),
                          matching: find.byType(Text),
                        ),
                      )
                      .length ==
                  7,
          description: 'Row with 7 Text children (weekdays)',
        ),
      );
      expect(weekdayRowFinder, findsOneWidget);

      final weekdayTexts = tester.widgetList(
        find.descendant(
          of: weekdayRowFinder,
          matching: find.byType(Text),
        ),
      );
      expect(weekdayTexts.length, 7); // 7 weekdays
    });

    testWidgets('renders multiple variant correctly',
        (WidgetTester tester) async {
      final now = DateTime.now();
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCalendar.multiple(
            selected: [],
          ),
        ),
      );

      // Check if the current month is displayed
      final monthYearText = DateFormat('MMMM y').format(now.startOfMonth);
      expect(find.text(monthYearText), findsOneWidget);

      // Check basic layout (GridView for days)
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('renders range variant correctly', (WidgetTester tester) async {
      final now = DateTime.now();
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCalendar.range(),
        ),
      );

      // Check if the current month is displayed
      final monthYearText = DateFormat('MMMM y').format(now.startOfMonth);
      expect(find.text(monthYearText), findsOneWidget);

      // Check basic layout (GridView for days)
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('displays initial month correctly',
        (WidgetTester tester) async {
      final initialMonth = DateTime(2023, 10);
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar(
            initialMonth: initialMonth,
          ),
        ),
      );

      // Check if the initial month is displayed
      final monthYearText = DateFormat('MMMM y').format(initialMonth);
      expect(find.text(monthYearText), findsOneWidget);

      // Check a specific date from October 2023 is rendered
      expect(find.text('15'), findsOneWidget);
    });

    testWidgets('selects date in single variant', (WidgetTester tester) async {
      DateTime? selectedDate;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar(
            onChanged: (date) => selectedDate = date,
          ),
        ),
      );

      // Tap a day button (e.g., day 15)
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();

      // Verify onChanged was called with the selected date
      expect(selectedDate, isNotNull);
      expect(selectedDate!.day, 15);

      // Check the selected day button has the primary variant
      final selectedButtonFinder = find.ancestor(
        of: find.text('15'),
        matching: find.byType(ShadButton),
      );
      final selectedButton = tester.widget<ShadButton>(selectedButtonFinder);
      expect(selectedButton.variant, ShadButtonVariant.primary);
    });

    testWidgets('selects multiple dates in multiple variant',
        (WidgetTester tester) async {
      var selectedDates = <DateTime>[];
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar.multiple(
            onChanged: (dates) => selectedDates = dates,
          ),
        ),
      );

      // Tap two days (e.g., 15 and 16)
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('16'));
      await tester.pumpAndSettle();

      // Verify onMultipleChanged was called with both dates
      expect(selectedDates.length, 2);
      expect(selectedDates.any((d) => d.day == 15), true);
      expect(selectedDates.any((d) => d.day == 16), true);
    });

    testWidgets('selects date range in range variant',
        (WidgetTester tester) async {
      ShadDateTimeRange? selectedRange;
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar.range(
            onChanged: (range) => selectedRange = range,
          ),
        ),
      );

      // Tap start and end days (e.g., 10 and 15)
      await tester.tap(find.text('10'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();

      // Verify onRangeChanged was called with the range
      expect(selectedRange, isNotNull);
      expect(selectedRange!.start!.day, 10);
      expect(selectedRange!.end!.day, 15);

      // Check start and end buttons have the selected variant
      final startButtonFinder = find.ancestor(
        of: find.text('10'),
        matching: find.byType(ShadButton),
      );
      final endButtonFinder = find.ancestor(
        of: find.text('15'),
        matching: find.byType(ShadButton),
      );
      expect(
        tester.widget<ShadButton>(startButtonFinder).variant,
        ShadButtonVariant.primary,
      );
      expect(
        tester.widget<ShadButton>(endButtonFinder).variant,
        ShadButtonVariant.primary,
      );
    });

    testWidgets('navigates to previous and next months',
        (WidgetTester tester) async {
      final initialMonth = DateTime(2023, 10);
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadCalendar(
            initialMonth: initialMonth,
          ),
        ),
      );

      // Check initial month
      expect(find.text('October 2023'), findsOneWidget);

      // Tap forward navigation button
      final forwardButtonFinder = find.byIcon(LucideIcons.chevronRight);
      await tester.tap(forwardButtonFinder);
      await tester.pumpAndSettle();

      // Check next month
      expect(find.text('November 2023'), findsOneWidget);

      // Tap back navigation button
      final backButtonFinder = find.byIcon(LucideIcons.chevronLeft);
      await tester.tap(backButtonFinder);
      await tester.pumpAndSettle();

      // Check previous month
      expect(find.text('October 2023'), findsOneWidget);
    });

    testWidgets('applies custom day button size correctly',
        (WidgetTester tester) async {
      const customDayButtonSize = 50.0;
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCalendar(
            dayButtonSize: customDayButtonSize,
          ),
        ),
      );

      // Check a day button has the custom size
      final dayButtonFinder = find.ancestor(
        of: find.text('15'),
        matching: find.byType(ShadButton),
      );
      expect(dayButtonFinder, findsOneWidget);
      final dayButton = tester.widget<ShadButton>(dayButtonFinder);
      expect(dayButton.width, customDayButtonSize);
      expect(dayButton.height, customDayButtonSize);
    });

    testWidgets('displays week numbers when enabled',
        (WidgetTester tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadCalendar(
            showWeekNumbers: true,
          ),
        ),
      );

      // Check week numbers header (#) is rendered
      expect(find.text('#'), findsOneWidget);

      // Check a week number is rendered (e.g., for the current week)
      final now = DateTime.now();
      final weekNumber = now.weekNumber.toString();
      // 2 because there is also the day button with the same text
      expect(find.text(weekNumber), findsNWidgets(2));

      // Check grid has 8 columns (7 days + 1 for week numbers)
      final gridFinder = find.byType(GridView);
      expect(gridFinder, findsWidgets);
      final grid = tester.widget<GridView>(gridFinder.first);
      expect(
        (grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount)
            .crossAxisCount,
        8,
      );
    });
  });
}
