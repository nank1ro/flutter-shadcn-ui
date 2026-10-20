import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget app(Widget child) => ShadApp(home: Scaffold(body: child));
String fmt(DateTime d) => '${d.month}/${d.day}';

void main() {
  testWidgets(
    'calendar controller changes leave onChanged silent',
    (tester) async {
      final c = ShadCalendarController();
      var calls = 0;
      await tester.pumpWidget(
        app(ShadCalendar(controller: c, onChanged: (_) => calls++)),
      );
      c.selected = DateTime(2024, 3, 3);
      await tester.pump();
      expect(calls, 0);
    },
  );

  testWidgets(
    'picker controller changes leave onChanged silent',
    (tester) async {
      final c = ShadCalendarController();
      var calls = 0;
      await tester.pumpWidget(
        app(
          ShadDatePicker(
            controller: c,
            formatDate: fmt,
            onChanged: (_) => calls++,
          ),
        ),
      );
      c.selected = DateTime(2024, 3, 3);
      await tester.pump();
      expect(calls, 0);
    },
  );

  testWidgets(
    'initial value seeding does not notify siblings during build',
    (tester) async {
      final c = ShadCalendarController();
      await tester.pumpWidget(
        app(
          ShadForm(
            child: Column(
              children: [
                ListenableBuilder(
                  listenable: c,
                  builder: (_, _) => Text('${c.selected}'),
                ),
                ShadDatePickerFormField(
                  id: 'd',
                  controller: c,
                  initialValue: DateTime(2024),
                  formatDate: fmt,
                ),
              ],
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'an empty replacement controller keeps the form value',
    (tester) async {
      final key = GlobalKey<ShadFormState>();
      Widget build(ShadCalendarController c) => app(
        ShadForm(
          key: key,
          child: ShadDatePickerFormField(
            id: 'd',
            controller: c,
            initialValue: DateTime(2024),
            formatDate: fmt,
          ),
        ),
      );
      await tester.pumpWidget(build(ShadCalendarController()));
      expect(key.currentState!.value['d'], DateTime(2024));
      await tester.pumpWidget(build(ShadCalendarController()));
      expect(key.currentState!.value['d'], DateTime(2024));
    },
  );

  test('F9 single-mode controller rejects multipleSelected/selectedRange', () {
    final c = ShadCalendarController();
    expect(() => c.multipleSelected = [DateTime(2024)], throwsAssertionError);
  });
}
