import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show Scaffold;
import 'package:shadcn_ui/shadcn_ui.dart';

Widget app(Widget child) => ShadApp(
  home: Scaffold(body: Center(child: child)),
);

String fmt(DateTime d) => '${d.month}/${d.day}';

ShadButtonVariant dayVariant(WidgetTester tester, String day) =>
    tester.widget<ShadButton>(find.widgetWithText(ShadButton, day)).variant;

/// Pumps [build] inside a StatefulBuilder and returns its setState.
Future<StateSetter> pumpState(
  WidgetTester tester,
  Widget Function() build,
) async {
  late StateSetter update;
  await tester.pumpWidget(
    app(
      StatefulBuilder(
        builder: (context, setState) {
          update = setState;
          return build();
        },
      ),
    ),
  );
  return update;
}

void main() {
  group('without a controller', () {
    testWidgets('a multiple list edited in place is applied on rebuild', (
      tester,
    ) async {
      final dates = [DateTime(2024, 1, 10), DateTime(2024, 1, 11)];
      final update = await pumpState(
        tester,
        () => ShadCalendar.multiple(
          selected: dates,
          initialMonth: DateTime(2024),
        ),
      );
      expect(dayVariant(tester, '10'), ShadButtonVariant.primary);
      update(dates.clear);
      await tester.pump();
      await tester.pump();
      expect(dayVariant(tester, '10'), ShadButtonVariant.ghost);
      expect(dayVariant(tester, '11'), ShadButtonVariant.ghost);
    });

    testWidgets('a new selected keeps the month the user navigated to', (
      tester,
    ) async {
      var selected = DateTime(2024, 1, 10);
      final update = await pumpState(
        tester,
        () => ShadCalendar(selected: selected, initialMonth: DateTime(2024)),
      );
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pumpAndSettle();
      update(() => selected = DateTime(2024, 6, 10));
      await tester.pumpAndSettle();
      expect(find.text('February 2024'), findsOneWidget);
    });

    testWidgets('a new selected does not leave the bounds', (tester) async {
      var selected = DateTime(2024, 1, 10);
      final update = await pumpState(
        tester,
        () => ShadCalendar(
          selected: selected,
          initialMonth: DateTime(2024),
          fromMonth: DateTime(2024),
          toMonth: DateTime(2024, 6),
        ),
      );
      update(() => selected = DateTime(2024, 12, 10));
      await tester.pumpAndSettle();
      expect(find.text('December 2024'), findsNothing);
    });

    testWidgets('a selected date before fromMonth opens inside the bounds', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          ShadCalendar(
            selected: DateTime(2023),
            fromMonth: DateTime(2024),
            toMonth: DateTime(2099),
          ),
        ),
      );
      expect(find.text('January 2023'), findsNothing);
    });

    testWidgets('a new initialMonth applies together with a new selected', (
      tester,
    ) async {
      var selected = DateTime(2024, 1, 10);
      var month = DateTime(2024);
      final update = await pumpState(
        tester,
        () => ShadCalendar(selected: selected, initialMonth: month),
      );
      update(() {
        selected = DateTime(2024, 6, 10);
        month = DateTime(2024, 3);
      });
      await tester.pumpAndSettle();
      expect(find.text('March 2024'), findsOneWidget);
    });

    testWidgets('a closed picker still opens on initialMonth after selected '
        'changes', (tester) async {
      var selected = DateTime(2024, 1, 10);
      final update = await pumpState(
        tester,
        () => ShadDatePicker(
          selected: selected,
          initialMonth: DateTime(2024, 3),
          formatDate: fmt,
        ),
      );
      update(() => selected = DateTime(2024, 6, 10));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      expect(find.text('March 2024'), findsOneWidget);
    });
  });

  group('with a controller', () {
    testWidgets('visibleMonth beyond toMonth with two months stays inside', (
      tester,
    ) async {
      final c = ShadCalendarController(visibleMonth: DateTime(2024, 3));
      addTearDown(c.dispose);
      await tester.pumpWidget(
        app(
          ShadCalendar(
            controller: c,
            numberOfMonths: 2,
            fromMonth: DateTime(2024),
            toMonth: DateTime(2024, 6),
          ),
        ),
      );
      c.visibleMonth = DateTime(2024, 12);
      await tester.pumpAndSettle();
      expect(find.text('May 2024'), findsOneWidget);
      expect(find.text('June 2024'), findsOneWidget);
      expect(find.text('July 2024'), findsNothing);
    });

    testWidgets('a selection beyond toMonth does not move the view out', (
      tester,
    ) async {
      final c = ShadCalendarController(visibleMonth: DateTime(2024, 3));
      addTearDown(c.dispose);
      await tester.pumpWidget(
        app(
          ShadCalendar(
            controller: c,
            fromMonth: DateTime(2024),
            toMonth: DateTime(2024, 6),
          ),
        ),
      );
      c.selected = DateTime(2024, 12, 10);
      await tester.pumpAndSettle();
      expect(find.text('December 2024'), findsNothing);
    });

    testWidgets('the form field accepts a controller change made while a '
        'sibling builds', (tester) async {
      final c = ShadCalendarController();
      addTearDown(c.dispose);
      DateTime? next;
      late StateSetter update;
      await tester.pumpWidget(
        app(
          ShadForm(
            child: Column(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    update = setState;
                    if (next != null) c.selected = next;
                    return const SizedBox();
                  },
                ),
                ShadDatePickerFormField(
                  id: 'd',
                  controller: c,
                  formatDate: fmt,
                ),
              ],
            ),
          ),
        ),
      );
      update(() => next = DateTime(2024, 3, 3));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('visibleMonth wins over initialMonth in calendar and picker', (
      tester,
    ) async {
      final a = ShadCalendarController(visibleMonth: DateTime(2024, 6));
      final b = ShadCalendarController(visibleMonth: DateTime(2024, 6));
      addTearDown(a.dispose);
      addTearDown(b.dispose);
      await tester.pumpWidget(
        app(ShadCalendar(controller: a, initialMonth: DateTime(2024))),
      );
      await tester.pumpAndSettle();
      expect(find.text('June 2024'), findsOneWidget);
      expect(a.visibleMonth, DateTime(2024, 6));
      await tester.pumpWidget(
        app(
          ShadDatePicker(
            controller: b,
            initialMonth: DateTime(2024),
            formatDate: fmt,
          ),
        ),
      );
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      expect(find.text('June 2024'), findsOneWidget);
      expect(b.visibleMonth, DateTime(2024, 6));
    });

    testWidgets('visibleMonth reports the month shown at mount', (
      tester,
    ) async {
      final c = ShadCalendarController(selected: DateTime(2024, 6, 19));
      addTearDown(c.dispose);
      await tester.pumpWidget(app(ShadCalendar(controller: c)));
      expect(find.text('June 2024'), findsOneWidget);
      expect(c.visibleMonth, DateTime(2024, 6));
    });

    testWidgets('clearing visibleMonth reports the month still shown', (
      tester,
    ) async {
      final c = ShadCalendarController(visibleMonth: DateTime(2024, 3));
      addTearDown(c.dispose);
      await tester.pumpWidget(app(ShadCalendar(controller: c)));
      c.visibleMonth = null;
      await tester.pumpAndSettle();
      expect(find.text('March 2024'), findsOneWidget);
      expect(c.visibleMonth, DateTime(2024, 3));
    });

    testWidgets('visibleMonth set mid-month is normalised on a closed picker', (
      tester,
    ) async {
      final c = ShadCalendarController();
      addTearDown(c.dispose);
      await tester.pumpWidget(
        app(ShadDatePicker(controller: c, formatDate: fmt)),
      );
      c.visibleMonth = DateTime(2024, 5, 20);
      await tester.pumpAndSettle();
      expect(c.visibleMonth, DateTime(2024, 5));
    });

    testWidgets('a closed picker opens on initialMonth after a programmatic '
        'selection', (tester) async {
      final c = ShadCalendarController(selected: DateTime(2024, 1, 10));
      addTearDown(c.dispose);
      await tester.pumpWidget(
        app(
          ShadDatePicker(
            controller: c,
            initialMonth: DateTime(2024, 3),
            formatDate: fmt,
          ),
        ),
      );
      c.selected = DateTime(2024, 6, 10);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      expect(find.text('March 2024'), findsOneWidget);
    });

    testWidgets('a visibleMonth assigned after the mount frame is kept', (
      tester,
    ) async {
      final c = ShadCalendarController(visibleMonth: DateTime(2024));
      addTearDown(c.dispose);
      await tester.pumpWidget(
        app(
          Column(
            children: [
              ShadCalendar(controller: c, initialMonth: DateTime(2024, 6)),
              Builder(
                builder: (_) {
                  c.visibleMonth = DateTime(2024, 9);
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(c.visibleMonth, DateTime(2024, 9));
    });

    testWidgets('two calendars with different bounds on one controller '
        'settle', (tester) async {
      final c = ShadCalendarController(visibleMonth: DateTime(2024, 3));
      addTearDown(c.dispose);
      final months = <DateTime>[];
      await tester.pumpWidget(
        app(
          SingleChildScrollView(
            child: Column(
              children: [
                ShadCalendar(
                  controller: c,
                  toMonth: DateTime(2024, 4),
                  onMonthChanged: months.add,
                ),
                ShadCalendar(
                  controller: c,
                  fromMonth: DateTime(2024, 8),
                  onMonthChanged: months.add,
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(months.length, lessThan(3), reason: '$months');
    });
  });
}
