import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget app(Widget child) => ShadApp(home: Scaffold(body: child));

ShadButtonVariant dayVariant(WidgetTester t, String day) =>
    t.widget<ShadButton>(find.widgetWithText(ShadButton, day)).variant;

void main() {
  testWidgets(
    'calendar property updates do not call the parent during build',
    (tester) async {
      var selected = DateTime(2024, 1, 10);
      late StateSetter outer;
      await tester.pumpWidget(
        app(
          StatefulBuilder(
            builder: (context, setState) {
              outer = setState;
              return ShadCalendar(
                selected: selected,
                onMonthChanged: (_) => setState(() {}),
              );
            },
          ),
        ),
      );
      outer(() => selected = DateTime(2024, 6, 10));
      await tester.pump();
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'open picker property updates do not call the parent during build',
    (tester) async {
      var selected = DateTime(2024, 1, 10);
      late StateSetter outer;
      await tester.pumpWidget(
        app(
          StatefulBuilder(
            builder: (context, setState) {
              outer = setState;
              return ShadDatePicker(
                selected: selected,
                formatDate: (d) => '${d.month}/${d.day}',
                onMonthChanged: (_) => setState(() {}),
              );
            },
          ),
        ),
      );
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      outer(() => selected = DateTime(2024, 6, 10));
      await tester.pump();
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'F6 calendar: rebuild with unchanged selected keeps the user selection',
    (tester) async {
      late StateSetter outer;
      await tester.pumpWidget(
        app(
          StatefulBuilder(
            builder: (context, setState) {
              outer = setState;
              return ShadCalendar(
                selected: DateTime(2024, 1, 10),
                initialMonth: DateTime(2024),
              );
            },
          ),
        ),
      );
      await tester.tap(find.widgetWithText(ShadButton, '20'));
      await tester.pump();
      outer(() {});
      await tester.pump();
      expect(dayVariant(tester, '20'), ShadButtonVariant.primary);
    },
  );

  testWidgets('F7 calendar: changing selected to null clears the selection', (
    tester,
  ) async {
    DateTime? selected = DateTime(2024, 1, 10);
    late StateSetter outer;
    await tester.pumpWidget(
      app(
        StatefulBuilder(
          builder: (context, setState) {
            outer = setState;
            return ShadCalendar(
              selected: selected,
              initialMonth: DateTime(2024),
            );
          },
        ),
      ),
    );
    expect(dayVariant(tester, '10'), ShadButtonVariant.primary);
    outer(() => selected = null);
    await tester.pump();
    expect(dayVariant(tester, '10'), ShadButtonVariant.ghost);
  });
}
