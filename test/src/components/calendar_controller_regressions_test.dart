import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  ShadButtonVariant dayVariant(WidgetTester tester, String day) {
    final button = find.ancestor(
      of: find.text(day),
      matching: find.byType(ShadButton),
    );
    return tester.widget<ShadButton>(button).variant;
  }

  group('ShadCalendarController regressions', () {
    // Bug 1: ShadDatePicker without controller/selected throws a null check.
    testWidgets('ShadDatePicker builds without controller or selection', (
      tester,
    ) async {
      final errors = <Object?>[];
      await tester.pumpWidget(createTestWidget(const ShadDatePicker()));
      errors.add(tester.takeException());
      await tester.pumpWidget(createTestWidget(const ShadDatePicker.range()));
      errors.add(tester.takeException());
      expect(errors, [null, null]);
    });

    // Bug 2: selecting a day in another month jumps back to the first one.
    testWidgets('multiple and range stay on the month being edited', (
      tester,
    ) async {
      final headers = <String?>[];
      for (final calendar in [
        ShadCalendar.multiple(
          key: const Key('m'),
          initialMonth: DateTime(2024),
        ),
        ShadCalendar.range(key: const Key('r'), initialMonth: DateTime(2024)),
      ]) {
        await tester.pumpWidget(createTestWidget(calendar));
        await tester.tap(find.text('15'));
        await tester.pump();
        await tester.tap(find.byIcon(LucideIcons.chevronRight));
        await tester.pump();
        await tester.tap(find.byIcon(LucideIcons.chevronRight));
        await tester.pump();
        await tester.tap(find.text('15'));
        await tester.pump();
        headers.add(tester.widget<Text>(find.textContaining(' 2024')).data);
      }
      expect(headers, ['March 2024', 'March 2024']);
    });

    // Bug 3: ShadFormState.setFieldValue does not update the date picker.
    testWidgets('setFieldValue updates ShadDatePickerFormField', (
      tester,
    ) async {
      final formKey = GlobalKey<ShadFormState>();
      await tester.pumpWidget(
        createTestWidget(
          ShadForm(
            key: formKey,
            child: ShadDatePickerFormField(id: 'date', width: 400),
          ),
        ),
      );
      formKey.currentState!.setFieldValue('date', DateTime(2024, 2, 20));
      await tester.pump();
      expect(find.text('February 20th, 2024'), findsOneWidget);
    });

    // Bug 4: month navigation does not update controller.visibleMonth.
    testWidgets('navigation updates controller.visibleMonth', (tester) async {
      final controller = ShadCalendarController(visibleMonth: DateTime(2024));
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        createTestWidget(ShadCalendar(controller: controller)),
      );
      await tester.tap(find.byIcon(LucideIcons.chevronRight));
      await tester.pump();
      expect(controller.visibleMonth, DateTime(2024, 2));
    });

    // Bug 5: removing an external controller drops its selection.
    testWidgets('selection survives removing the external controller', (
      tester,
    ) async {
      final controller = ShadCalendarController(
        selected: DateTime(2024, 1, 15),
      );
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        createTestWidget(ShadCalendar(controller: controller)),
      );
      expect(dayVariant(tester, '15'), ShadButtonVariant.primary);
      await tester.pumpWidget(createTestWidget(const ShadCalendar()));
      expect(dayVariant(tester, '15'), ShadButtonVariant.primary);
    });

    // Bug 6: ShadCalendar.multiple(min:) allows deselecting below min.
    testWidgets('multiple min prevents deselecting below min', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadCalendar.multiple(initialMonth: DateTime(2024), min: 2),
        ),
      );
      await tester.tap(find.text('10'));
      await tester.pump();
      await tester.tap(find.text('11'));
      await tester.pump();
      await tester.tap(find.text('10'));
      await tester.pump();
      expect(dayVariant(tester, '10'), ShadButtonVariant.primary);
    });

    // Bug 7: programmatic controller changes fire ShadDatePicker.onChanged.
    testWidgets('programmatic selection does not call onChanged', (
      tester,
    ) async {
      final controller = ShadCalendarController();
      addTearDown(controller.dispose);
      final changes = <DateTime?>[];
      await tester.pumpWidget(
        createTestWidget(
          ShadDatePicker(
            controller: controller,
            width: 400,
            onChanged: changes.add,
          ),
        ),
      );
      controller.selected = DateTime(2024, 1, 15);
      await tester.pump();
      expect(changes, isEmpty);
    });
  });
}
