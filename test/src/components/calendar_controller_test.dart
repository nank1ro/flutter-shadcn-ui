import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget createTestWidget(Widget child) {
  return ShadApp(
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  for (final variant in ShadCalendarVariant.values) {
    ShadCalendarController createController(int month) => switch (variant) {
      ShadCalendarVariant.single => ShadCalendarController(
        selected: DateTime(2024, month, 17),
      ),
      ShadCalendarVariant.multiple => ShadCalendarController.multiple(
        selected: [DateTime(2024, month, 17)],
      ),
      ShadCalendarVariant.range => ShadCalendarController.range(
        selected: ShadDateTimeRange(
          start: DateTime(2024, month, 17),
          end: DateTime(2024, month, 19),
        ),
      ),
    };

    for (final startsInternal in [false, true]) {
      testWidgets(
        '$variant calendar retains selection after controller removal '
        'with startsInternal=$startsInternal',
        (tester) async {
          final first = createController(1);
          final replacement = createController(6);
          addTearDown(first.dispose);
          addTearDown(replacement.dispose);
          Future<void> pump(ShadCalendarController? controller) async {
            await tester.pumpWidget(
              createTestWidget(
                ShadCalendar.raw(
                  variant: variant,
                  controller: controller,
                  initialMonth: DateTime(2024, 6),
                ),
              ),
            );
          }

          if (startsInternal) await pump(null);
          await pump(first);
          await pump(replacement);
          await pump(null);
          final day = tester.widget<ShadButton>(
            find.widgetWithText(ShadButton, '17'),
          );
          expect(day.variant, ShadButtonVariant.primary);
          switch (variant) {
            case ShadCalendarVariant.single:
              first.selected = DateTime(2024, 7, 17);
            case ShadCalendarVariant.multiple:
              first.multipleSelected = [DateTime(2024, 7, 17)];
            case ShadCalendarVariant.range:
              first.selectedRange = ShadDateTimeRange(
                start: DateTime(2024, 7, 17),
              );
          }
          replacement.visibleMonth = DateTime(2024, 7);
          await tester.pumpAndSettle();
          expect(find.text('June 2024'), findsOneWidget);
          expect(tester.takeException(), isNull);
        },
      );
    }

    testWidgets('$variant calendar keeps a cleared selection on removal', (
      tester,
    ) async {
      final controller = createController(6);
      addTearDown(controller.dispose);
      Future<void> pump(ShadCalendarController? current) async {
        await tester.pumpWidget(
          createTestWidget(
            ShadCalendar.raw(
              variant: variant,
              controller: current,
              selected: DateTime(2024, 6, 17),
              multipleSelected: [DateTime(2024, 6, 17)],
              selectedRange: ShadDateTimeRange(
                start: DateTime(2024, 6, 17),
                end: DateTime(2024, 6, 19),
              ),
              initialMonth: DateTime(2024, 6),
            ),
          ),
        );
      }

      await pump(controller);
      switch (variant) {
        case ShadCalendarVariant.single:
          controller.selected = null;
        case ShadCalendarVariant.multiple:
          controller.multipleSelected = [];
        case ShadCalendarVariant.range:
          controller.selectedRange = null;
      }
      await tester.pumpAndSettle();
      await pump(null);
      expect(
        tester
            .widget<ShadButton>(find.widgetWithText(ShadButton, '17'))
            .variant,
        ShadButtonVariant.ghost,
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('$variant selection follows manual calendar navigation', (
      tester,
    ) async {
      final controller = createController(1);
      addTearDown(controller.dispose);
      final months = <DateTime>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadCalendar.raw(
            variant: variant,
            controller: controller,
            onMonthChanged: months.add,
          ),
        ),
      );
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pumpAndSettle();
      expect(find.text('February 2024'), findsOneWidget);
      switch (variant) {
        case ShadCalendarVariant.single:
          controller.selected = DateTime(2024, 6, 17);
        case ShadCalendarVariant.multiple:
          controller.multipleSelected = [DateTime(2024, 6, 17)];
        case ShadCalendarVariant.range:
          controller.selectedRange = ShadDateTimeRange(
            start: DateTime(2024, 6, 17),
            end: DateTime(2024, 6, 19),
          );
      }
      await tester.pumpAndSettle();
      expect(find.text('June 2024'), findsOneWidget);
      expect(controller.visibleMonth, DateTime(2024, 6));
      expect(months, [DateTime(2024, 2), DateTime(2024, 6)]);
      controller.visibleMonth = DateTime(2024, 7);
      await tester.pumpAndSettle();
      expect(find.text('July 2024'), findsOneWidget);
    });
  }

  for (final variant in ShadDatePickerVariant.values) {
    testWidgets('$variant picker selection follows manual navigation', (
      tester,
    ) async {
      final controller = switch (variant) {
        ShadDatePickerVariant.single => ShadCalendarController(
          selected: DateTime(2024, 1, 15),
        ),
        ShadDatePickerVariant.range => ShadCalendarController.range(
          selected: ShadDateTimeRange(
            start: DateTime(2024, 1, 15),
            end: DateTime(2024, 1, 17),
          ),
        ),
      };
      addTearDown(controller.dispose);
      final changes = <Object?>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadDatePicker.raw(
            variant: variant,
            controller: controller,
            width: 500,
            onChanged: changes.add,
            onRangeChanged: changes.add,
          ),
        ),
      );
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pumpAndSettle();
      expect(find.text('February 2024'), findsOneWidget);
      final range = ShadDateTimeRange(
        start: DateTime(2024, 6, 17),
        end: DateTime(2024, 6, 19),
      );
      switch (variant) {
        case ShadDatePickerVariant.single:
          controller.selected = DateTime(2024, 6, 17);
        case ShadDatePickerVariant.range:
          controller.selectedRange = range;
      }
      await tester.pumpAndSettle();
      expect(find.text('June 2024'), findsOneWidget);
      expect(controller.visibleMonth, DateTime(2024, 6));
      expect(changes, isEmpty);
      controller.visibleMonth = DateTime(2024, 7);
      await tester.pumpAndSettle();
      expect(find.text('July 2024'), findsOneWidget);
      expect(changes, isEmpty);
      await tester.tap(find.text('21'));
      await tester.pumpAndSettle();
      expect(find.text('July 2024'), findsOneWidget);
      expect(changes.length, 1);
    });
  }

  testWidgets('controller selection moves the calendar to another month', (
    tester,
  ) async {
    final controller = ShadCalendarController(selected: DateTime(2024, 1, 15));
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      createTestWidget(ShadCalendar(controller: controller)),
    );
    expect(find.text('January 2024'), findsOneWidget);
    controller.selected = DateTime(2024, 6, 17);
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
  });

  testWidgets(
    'calendar navigation keeps the controller visible month current',
    (
      tester,
    ) async {
      final controller = ShadCalendarController(visibleMonth: DateTime(2024));
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        createTestWidget(ShadCalendar(controller: controller)),
      );
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pumpAndSettle();
      expect(controller.visibleMonth, DateTime(2024, 2));
      controller.visibleMonth = DateTime(2024);
      await tester.pumpAndSettle();
      expect(find.text('January 2024'), findsOneWidget);
    },
  );

  for (final variant in ShadCalendarVariant.values) {
    testWidgets('visible month updates without a $variant selection', (
      tester,
    ) async {
      final controller = switch (variant) {
        ShadCalendarVariant.single => ShadCalendarController(),
        ShadCalendarVariant.multiple => ShadCalendarController.multiple(),
        ShadCalendarVariant.range => ShadCalendarController.range(),
      };
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        createTestWidget(
          ShadCalendar.raw(
            variant: variant,
            controller: controller,
            initialMonth: DateTime(2024),
          ),
        ),
      );
      expect(find.text('January 2024'), findsOneWidget);

      controller.visibleMonth = DateTime(2024, 6);
      await tester.pumpAndSettle();
      expect(find.text('June 2024'), findsOneWidget);
      expect(find.text('January 2024'), findsNothing);
    });
  }

  for (final variant in ShadDatePickerVariant.values) {
    testWidgets('empty $variant date picker has an internal controller', (
      tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadDatePicker.raw(
            variant: variant,
            initialMonth: DateTime(2024),
            width: 400,
          ),
        ),
      );
      expect(tester.takeException(), isNull);
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      expect(find.text('January 2024'), findsOneWidget);
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });

    testWidgets(
      '$variant controller changes are silent and user selections report once',
      (
        tester,
      ) async {
        final controller = switch (variant) {
          ShadDatePickerVariant.single => ShadCalendarController(),
          ShadDatePickerVariant.range => ShadCalendarController.range(),
        };
        addTearDown(controller.dispose);
        final changes = <Object?>[];
        final range = ShadDateTimeRange(
          start: DateTime(2024, 1, 15),
          end: DateTime(2024, 1, 17),
        );
        await tester.pumpWidget(
          createTestWidget(
            ShadDatePicker.raw(
              variant: variant,
              controller: controller,
              width: 500,
              onChanged: changes.add,
              onRangeChanged: changes.add,
            ),
          ),
        );
        switch (variant) {
          case ShadDatePickerVariant.single:
            controller.selected = DateTime(2024, 1, 15);
          case ShadDatePickerVariant.range:
            controller.selectedRange = range;
        }
        await tester.pumpAndSettle();
        expect(changes, isEmpty);
        controller.visibleMonth = DateTime(2024, 6);
        await tester.pumpAndSettle();
        expect(changes, isEmpty);
        await tester.tap(find.byType(ShadButton));
        await tester.pumpAndSettle();
        expect(find.text('June 2024'), findsOneWidget);
        await tester.tap(find.text('19'));
        await tester.pumpAndSettle();
        expect(changes.length, 1);
        expect(
          changes.last,
          variant == ShadDatePickerVariant.single
              ? DateTime(2024, 6, 19)
              : ShadDateTimeRange(
                  start: DateTime(2024, 1, 15),
                  end: DateTime(2024, 6, 19),
                ),
        );
      },
    );
  }

  testWidgets('month navigation does not report a date selection', (
    tester,
  ) async {
    final controller = ShadCalendarController(selected: DateTime(2024, 1, 15));
    addTearDown(controller.dispose);
    final changes = <DateTime?>[];
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePicker(
          controller: controller,
          onChanged: changes.add,
          width: 400,
        ),
      ),
    );
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('January 2024'), findsOneWidget);
    await tester.tap(find.byIcon(LucideIcons.chevronRight));
    await tester.pumpAndSettle();
    expect(find.text('February 2024'), findsOneWidget);

    controller.visibleMonth = DateTime(2024, 6);
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
    expect(controller.selected, DateTime(2024, 1, 15));
    expect(changes, isEmpty);

    await tester.tap(find.byIcon(LucideIcons.chevronRight));
    await tester.pumpAndSettle();
    expect(controller.visibleMonth, DateTime(2024, 7));
    controller.visibleMonth = DateTime(2024, 6);
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
    expect(changes, isEmpty);

    await tester.tap(find.text('17'));
    await tester.pumpAndSettle();
    expect(changes, [DateTime(2024, 6, 17)]);
  });

  testWidgets('form initialization does not report a selection change', (
    tester,
  ) async {
    final controller = ShadCalendarController(selected: DateTime(2024, 1, 15));
    addTearDown(controller.dispose);
    final key = GlobalKey<ShadFormBuilderDatePickerState>();
    final formKey = GlobalKey<ShadFormState>();
    final changes = <DateTime?>[];
    await tester.pumpWidget(
      createTestWidget(
        ShadForm(
          key: formKey,
          child: ShadDatePickerFormField(
            width: 400,
            key: key,
            id: 'date',
            controller: controller,
            onChanged: changes.add,
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(key.currentState!.value, DateTime(2024, 1, 15));
    expect(formKey.currentState!.value['date'], DateTime(2024, 1, 15));
    expect(key.currentState!.hasInteractedByUser, isFalse);
    expect(changes, isEmpty);
  });

  testWidgets('an empty form controller receives the initial value', (
    tester,
  ) async {
    final controller = ShadCalendarController();
    addTearDown(controller.dispose);
    final initialValue = DateTime(2024, 1, 15);
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePickerFormField(
          width: 400,
          controller: controller,
          initialValue: initialValue,
        ),
      ),
    );
    await tester.pump();
    expect(controller.selected, initialValue);
    expect(find.text('January 15th, 2024'), findsOneWidget);
  });

  testWidgets('form controller swaps do not report a selection change', (
    tester,
  ) async {
    final first = ShadCalendarController();
    final second = ShadCalendarController(selected: DateTime(2024, 6, 17));
    final empty = ShadCalendarController();
    addTearDown(first.dispose);
    addTearDown(second.dispose);
    addTearDown(empty.dispose);
    final key = GlobalKey<ShadFormBuilderDatePickerState>();
    final changes = <DateTime?>[];
    Future<void> pump(ShadCalendarController controller) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadDatePickerFormField(
            width: 400,
            key: key,
            controller: controller,
            onChanged: changes.add,
          ),
        ),
      );
    }

    await pump(first);
    expect(tester.takeException(), isNull);
    expect(changes, isEmpty);
    await pump(second);
    expect(tester.takeException(), isNull);
    expect(key.currentState!.value, DateTime(2024, 6, 17));
    expect(key.currentState!.hasInteractedByUser, isFalse);
    expect(changes, isEmpty);
    await pump(empty);
    expect(key.currentState!.value, DateTime(2024, 6, 17));
    expect(empty.selected, DateTime(2024, 6, 17));
    expect(changes, isEmpty);
  });

  testWidgets('form updates keep the date picker controller in sync', (
    tester,
  ) async {
    final formKey = GlobalKey<ShadFormState>();
    final key = GlobalKey<ShadFormBuilderDatePickerState>();
    final changes = <DateTime?>[];
    await tester.pumpWidget(
      createTestWidget(
        ShadForm(
          key: formKey,
          child: ShadDatePickerFormField(
            width: 400,
            key: key,
            id: 'date',
            initialValue: DateTime(2024, 1, 15),
            onChanged: changes.add,
          ),
        ),
      ),
    );
    formKey.currentState!.setFieldValue('date', DateTime(2024, 6, 17));
    await tester.pumpAndSettle();
    expect(key.currentState!.controller.selected, DateTime(2024, 6, 17));
    expect(find.text('June 17th, 2024'), findsOneWidget);
    expect(changes, [DateTime(2024, 6, 17)]);
    key.currentState!.setValue(DateTime(2024, 7, 19));
    await tester.pumpAndSettle();
    expect(key.currentState!.controller.selected, DateTime(2024, 7, 19));
    expect(formKey.currentState!.value['date'], DateTime(2024, 7, 19));
    expect(find.text('July 19th, 2024'), findsOneWidget);
    expect(changes, [DateTime(2024, 6, 17)]);
    formKey.currentState!.reset();
    await tester.pumpAndSettle();
    expect(key.currentState!.controller.selected, DateTime(2024, 1, 15));
    expect(find.text('January 15th, 2024'), findsOneWidget);
    expect(changes, [DateTime(2024, 6, 17), DateTime(2024, 1, 15)]);
  });

  testWidgets(
    'picker keeps selection when its external controller is removed',
    (
      tester,
    ) async {
      final controller = ShadCalendarController(
        selected: DateTime(2024, 1, 15),
      );
      addTearDown(controller.dispose);
      final changes = <DateTime?>[];
      Future<void> pump(ShadCalendarController? current) async {
        await tester.pumpWidget(
          createTestWidget(
            ShadDatePicker(
              controller: current,
              width: 400,
              onChanged: changes.add,
            ),
          ),
        );
      }

      await pump(controller);
      await pump(null);
      expect(find.text('January 15th, 2024'), findsOneWidget);
      expect(changes, isEmpty);
      controller.selected = DateTime(2024, 6, 17);
      await tester.pumpAndSettle();
      expect(find.text('January 15th, 2024'), findsOneWidget);
      expect(changes, isEmpty);
    },
  );

  testWidgets('picker recreates its internal controller when variant changes', (
    tester,
  ) async {
    final range = ShadDateTimeRange(
      start: DateTime(2024, 6, 15),
      end: DateTime(2024, 6, 17),
    );
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePicker(selected: DateTime(2024, 1, 15), width: 500),
      ),
    );
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePicker.raw(
          variant: ShadDatePickerVariant.range,
          selectedRange: range,
          width: 500,
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
    final calendar = tester.widget<ShadCalendar>(find.byType(ShadCalendar));
    expect(calendar.controller!.variant, ShadCalendarVariant.range);
    expect(calendar.controller!.selectedRange, range);
  });
  testWidgets('calendar recreates its owned controller when variant changes', (
    tester,
  ) async {
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar(
          selected: DateTime(2024, 1, 10),
        ),
      ),
    );
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar.range(
          selected: ShadDateTimeRange(start: DateTime(2024, 6, 17)),
        ),
      ),
    );
    await tester.tap(find.widgetWithText(ShadButton, '19'));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
  for (final external in [false, true]) {
    testWidgets('ID rebinding updates the picker with external=$external', (
      tester,
    ) async {
      final controller = external ? ShadCalendarController() : null;
      addTearDown(() => controller?.dispose());
      final formKey = GlobalKey<ShadFormState>();
      Future<void> pump(String id) => tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            initialValue: {
              'a': DateTime(2024, 1, 10),
              'b': DateTime(2024, 6, 17),
            },
            child: ShadDatePickerFormField(
              id: id,
              controller: controller,
              formatDate: (date) => '${date.month}/${date.day}',
            ),
          ),
        ),
      );
      await pump('a');
      await tester.pump();
      await pump('b');
      await tester.pump();
      expect(formKey.currentState!.value['b'], DateTime(2024, 6, 17));
      expect(find.text('6/17'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('a selection keeps the month shown from initialMonth', (
    tester,
  ) async {
    final controller = ShadCalendarController(visibleMonth: DateTime(2024));
    addTearDown(controller.dispose);
    final months = <DateTime>[];
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar(
          controller: controller,
          initialMonth: DateTime(2024, 6),
          onMonthChanged: months.add,
        ),
      ),
    );
    await tester.pump();
    expect(controller.visibleMonth, DateTime(2024, 6));
    await tester.tap(find.widgetWithText(ShadButton, '19'));
    await tester.pumpAndSettle();
    expect(controller.selected, DateTime(2024, 6, 19));
    expect(find.text('June 2024'), findsOneWidget);
    expect(controller.visibleMonth, DateTime(2024, 6));
    expect(months, isEmpty);
  });

  testWidgets('swapping the controller of an open picker shows its month', (
    tester,
  ) async {
    final first = ShadCalendarController(visibleMonth: DateTime(2024));
    final second = ShadCalendarController(visibleMonth: DateTime(2024, 6));
    addTearDown(first.dispose);
    addTearDown(second.dispose);
    Future<void> pump(ShadCalendarController controller) => tester.pumpWidget(
      createTestWidget(ShadDatePicker(controller: controller, width: 500)),
    );
    await pump(first);
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(LucideIcons.chevronRight));
    await tester.pumpAndSettle();
    expect(find.text('February 2024'), findsOneWidget);
    await pump(second);
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
    expect(find.text('February 2024'), findsNothing);
    expect(second.visibleMonth, DateTime(2024, 6));
  });

  testWidgets('a form field id change does not notify during build', (
    tester,
  ) async {
    final controller = ShadCalendarController();
    addTearDown(controller.dispose);
    Future<void> pump(String id) => tester.pumpWidget(
      createTestWidget(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShadForm(
              initialValue: {
                'a': DateTime(2024, 1, 10),
                'b': DateTime(2024, 6, 17),
              },
              child: ShadDatePickerFormField(
                id: id,
                controller: controller,
                formatDate: (date) => '${date.month}/${date.day}',
              ),
            ),
            ListenableBuilder(
              listenable: controller,
              builder: (context, _) => Text('selected ${controller.selected}'),
            ),
          ],
        ),
      ),
    );
    await pump('a');
    await tester.pump();
    await pump('b');
    expect(tester.takeException(), isNull);
    await tester.pump();
    expect(controller.selected, DateTime(2024, 6, 17));
    expect(find.textContaining('2024-06-17'), findsOneWidget);
  });

  testWidgets('assigning a displayed month moves the displayed window', (
    tester,
  ) async {
    final controller = ShadCalendarController(visibleMonth: DateTime(2024));
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar(controller: controller, numberOfMonths: 2),
      ),
    );
    expect(find.text('January 2024'), findsOneWidget);
    expect(find.text('February 2024'), findsOneWidget);
    controller.visibleMonth = DateTime(2024, 2);
    await tester.pumpAndSettle();
    expect(find.text('January 2024'), findsNothing);
    expect(find.text('February 2024'), findsOneWidget);
    expect(find.text('March 2024'), findsOneWidget);
  });

  testWidgets('visibleMonth is limited to fromMonth and toMonth', (
    tester,
  ) async {
    final controller = ShadCalendarController(visibleMonth: DateTime(2024, 5));
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar(
          controller: controller,
          fromMonth: DateTime(2024, 3),
          toMonth: DateTime(2024, 8),
        ),
      ),
    );
    controller.visibleMonth = DateTime(2025);
    await tester.pumpAndSettle();
    expect(find.text('August 2024'), findsOneWidget);
    expect(controller.visibleMonth, DateTime(2024, 8));
    controller.visibleMonth = DateTime(2023);
    await tester.pumpAndSettle();
    expect(find.text('March 2024'), findsOneWidget);
    expect(controller.visibleMonth, DateTime(2024, 3));
  });

  testWidgets('an uncontrolled picker remembers the displayed month', (
    tester,
  ) async {
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePicker(initialMonth: DateTime(2024, 6), width: 500),
      ),
    );
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
    await tester.tap(find.byIcon(LucideIcons.chevronRight));
    await tester.pumpAndSettle();
    expect(find.text('July 2024'), findsOneWidget);
    await tester.tapAt(const Offset(1, 1));
    await tester.pumpAndSettle();
    expect(find.text('July 2024'), findsNothing);
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('July 2024'), findsOneWidget);
  });

  testWidgets('a controller month outside fromMonth and toMonth is clamped', (
    tester,
  ) async {
    final controller = ShadCalendarController(visibleMonth: DateTime(2025));
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      createTestWidget(
        ShadCalendar(
          controller: controller,
          fromMonth: DateTime(2024, 3),
          toMonth: DateTime(2024, 8),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('August 2024'), findsOneWidget);
    expect(controller.visibleMonth, DateTime(2024, 8));
  });

  testWidgets('a picker opens inside fromMonth and toMonth', (tester) async {
    final controller = ShadCalendarController(visibleMonth: DateTime(2025));
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      createTestWidget(
        ShadDatePicker(
          controller: controller,
          width: 500,
          fromMonth: DateTime(2024, 3),
          toMonth: DateTime(2024, 8),
        ),
      ),
    );
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('August 2024'), findsOneWidget);
    expect(controller.visibleMonth, DateTime(2024, 8));
  });

  testWidgets('a picker shows a changed selected property right away', (
    tester,
  ) async {
    Future<void> pump(DateTime selected) => tester.pumpWidget(
      createTestWidget(ShadDatePicker(selected: selected, width: 500)),
    );
    await pump(DateTime(2024, 1, 10));
    expect(find.text('January 10th, 2024'), findsOneWidget);
    await pump(DateTime(2024, 6, 19));
    expect(find.text('June 19th, 2024'), findsOneWidget);
    await tester.pump();
    await tester.tap(find.byType(ShadButton));
    await tester.pumpAndSettle();
    expect(find.text('June 2024'), findsOneWidget);
  });
}
