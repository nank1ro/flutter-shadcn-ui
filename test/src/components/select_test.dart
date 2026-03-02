import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSelect', () {
    testWidgets('ShadSelect matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadSelect<String>(
            placeholder: const Text('Select a fruit'),
            options: [
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 6, 6, 6),
                child: Text(
                  'Fruits',
                ),
              ),
              ...['apple', 'banana', 'watermelon'].map(
                (fruit) => ShadOption(
                  value: fruit,
                  child: Text(fruit),
                ),
              ),
            ],
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
      );

      expect(
        find.byType(ShadSelect<String>),
        matchesGoldenFile('goldens/select.png'),
      );
    });
  });

  group('ShadSelectMultipleFormField', () {
    /// Returns an iterable of [ShadOption] widgets for the given [fruits].
    Iterable<Widget> fruitOptions(List<String> fruits) {
      return fruits.map((f) => ShadOption<String>(value: f, child: Text(f)));
    }

    testWidgets('onChanged fires on the first selection', (tester) async {
      final changes = <Set<String>?>[];

      await tester.pumpWidget(
        createTestWidget(
          ShadSelectMultipleFormField<String>(
            onChanged: changes.add,
            placeholder: const Text('Select fruits'),
            selectedOptionsBuilder: (context, values) =>
                Text(values.join(', ')),
            options: fruitOptions(['apple', 'banana', 'cherry']),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final selectState = tester.state<ShadSelectState<String>>(
        find.byType(ShadSelect<String>),
      );

      selectState.select('apple');
      await tester.pumpAndSettle();

      expect(changes, hasLength(1));
      expect(changes.last, {'apple'});
    });

    testWidgets(
      'onChanged fires on every subsequent selection (regression)',
      (tester) async {
        final changes = <Set<String>?>[];

        await tester.pumpWidget(
          createTestWidget(
            ShadSelectMultipleFormField<String>(
              onChanged: changes.add,
              placeholder: const Text('Select fruits'),
              selectedOptionsBuilder: (context, values) =>
                  Text(values.join(', ')),
              options: fruitOptions(['apple', 'banana', 'cherry']),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final selectState = tester.state<ShadSelectState<String>>(
          find.byType(ShadSelect<String>),
        );

        selectState.select('apple');
        await tester.pumpAndSettle();
        expect(changes, hasLength(1));
        expect(changes.last, {'apple'});

        // Before the fix this second call was silently ignored because
        // controller.value and form-field value pointed to the same Set.
        selectState.select('banana');
        await tester.pumpAndSettle();
        expect(changes, hasLength(2));
        expect(changes.last, {'apple', 'banana'});

        selectState.select('cherry');
        await tester.pumpAndSettle();
        expect(changes, hasLength(3));
        expect(changes.last, {'apple', 'banana', 'cherry'});
      },
    );

    testWidgets('onChanged fires correctly when deselecting', (tester) async {
      final changes = <Set<String>?>[];

      await tester.pumpWidget(
        createTestWidget(
          ShadSelectMultipleFormField<String>(
            onChanged: changes.add,
            allowDeselection: true,
            placeholder: const Text('Select fruits'),
            selectedOptionsBuilder: (context, values) =>
                Text(values.join(', ')),
            options: fruitOptions(['apple', 'banana']),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final selectState = tester.state<ShadSelectState<String>>(
        find.byType(ShadSelect<String>),
      );

      selectState.select('apple');
      await tester.pumpAndSettle();
      expect(changes.last, {'apple'});

      selectState.select('banana');
      await tester.pumpAndSettle();
      expect(changes.last, {'apple', 'banana'});

      // Deselect apple.
      selectState.select('apple');
      await tester.pumpAndSettle();
      expect(changes, hasLength(3));
      expect(changes.last, {'banana'});
    });

    testWidgets(
      'form value reflects every selection',
      (tester) async {
        final formKey = GlobalKey<ShadFormState>();

        await tester.pumpWidget(
          createTestWidget(
            ShadForm(
              key: formKey,
              child: ShadSelectMultipleFormField<String>(
                id: 'fruits',
                placeholder: const Text('Select fruits'),
                selectedOptionsBuilder: (context, values) =>
                    Text(values.join(', ')),
                options: fruitOptions(['apple', 'banana', 'cherry']),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final selectState = tester.state<ShadSelectState<String>>(
          find.byType(ShadSelect<String>),
        );

        selectState.select('apple');
        await tester.pumpAndSettle();
        expect(formKey.currentState!.value['fruits'], {'apple'});

        selectState.select('banana');
        await tester.pumpAndSettle();
        expect(formKey.currentState!.value['fruits'], {'apple', 'banana'});
      },
    );
  });
}
