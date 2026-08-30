import 'dart:async';

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

    // Regression: the scroll-to-top/bottom buttons start animateToTop/
    // animateToBottom on hover, but each opens with a 200ms delay and then
    // awaits a scroll step per loop iteration. If the overlay (and its scroll
    // view) is torn down in between — the popover closing mid-animation — the
    // ScrollController has no attached position, so reading `.offset` /
    // `.position` threw `StateError('Bad state: No element')` out of the async
    // loop, unguarded (unlike the scroll listener, which checks `hasClients`).
    // https://github.com/nank1ro/flutter-shadcn-ui/issues/686
    Future<void> pumpSelect(WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadSelect<String>(
            placeholder: const Text('Select a fruit'),
            options: ['apple', 'banana', 'watermelon']
                .map((f) => ShadOption(value: f, child: Text(f)))
                .toList(),
            selectedOptionBuilder: (context, value) => Text(value),
          ),
        ),
      );
    }

    testWidgets('animateToTop is safe when the scroll view is detached (#686)',
        (tester) async {
      await pumpSelect(tester);
      final state = tester.state<ShadSelectState<String>>(
        find.byType(ShadSelect<String>),
      );
      // Popover never opened -> controller has no attached position, exactly
      // like the state left behind when the popover closes mid-animation.
      expect(state.scrollController.hasClients, isFalse);

      state.shouldAnimateToTop = true;
      unawaited(state.animateToTop());
      await tester.pump(const Duration(milliseconds: 250));

      expect(tester.takeException(), isNull);
    });

    testWidgets(
        'animateToBottom is safe when the scroll view is detached (#686)',
        (tester) async {
      await pumpSelect(tester);
      final state = tester.state<ShadSelectState<String>>(
        find.byType(ShadSelect<String>),
      );
      expect(state.scrollController.hasClients, isFalse);

      state.shouldAnimateToBottom = true;
      unawaited(state.animateToBottom());
      await tester.pump(const Duration(milliseconds: 250));

      expect(tester.takeException(), isNull);
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
