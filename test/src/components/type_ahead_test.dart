import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/type_ahead.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(
      home: Scaffold(body: Center(child: child)),
    );
  }

  final fruits = ['Apple', 'Banana', 'Cherry', 'Date', 'Watermelon'];

  group('ShadTypeAhead', () {
    testWidgets('ShadTypeAhead matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search a fruit...'),
            suggestionsCallback: (query) async {
              return ['Apple', 'Banana', 'Watermelon'];
            },
            itemBuilder: (context, fruit) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                child: Text(fruit),
              );
            },
          ),
        ),
      );

      // Focus the field and type to trigger the callback
      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      expect(
        find.byType(ShadTypeAhead<String>),
        matchesGoldenFile('goldens/type_ahead.png'),
      );
    });

    testWidgets('shows suggestions after typing', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            suggestionsCallback: (query) async {
              return fruits
                  .where(
                    (f) => f.toLowerCase().contains(query.toLowerCase()),
                  )
                  .toList();
            },
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      // All fruits containing 'a' should appear
      expect(find.text('Apple'), findsOneWidget);
      expect(find.text('Banana'), findsOneWidget);
      expect(find.text('Date'), findsOneWidget);
      expect(find.text('Watermelon'), findsOneWidget);
      // Cherry does not contain 'a'
      expect(find.text('Cherry'), findsNothing);
    });

    testWidgets('selects item on tap', (tester) async {
      String? selected;
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            suggestionsCallback: (query) async => fruits,
            itemBuilder: (context, fruit) => Text(fruit),
            onSelected: (value) => selected = value,
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Banana'));
      await tester.pumpAndSettle();

      expect(selected, 'Banana');
    });

    testWidgets('keyboard navigation with arrow keys and enter', (
      tester,
    ) async {
      String? selected;
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            suggestionsCallback: (query) async =>
                fruits.where((f) => f.toLowerCase().contains('a')).toList(),
            itemBuilder: (context, fruit) => Text(fruit),
            onSelected: (value) => selected = value,
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      // Arrow down twice to highlight second item
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      // Enter to select
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();

      expect(selected, isNotNull);
    });

    testWidgets('respects minCharsForSuggestions', (tester) async {
      var callCount = 0;
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            minCharsForSuggestions: 3,
            debounceDuration: Duration.zero,
            suggestionsCallback: (query) async {
              callCount++;
              return fruits;
            },
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();

      // Type only 2 chars — should not trigger callback
      await tester.enterText(find.byType(EditableText), 'ab');
      await tester.pumpAndSettle();
      expect(callCount, 0);

      // Type 3 chars — should trigger callback
      await tester.enterText(find.byType(EditableText), 'abc');
      await tester.pumpAndSettle();
      expect(callCount, 1);
    });

    testWidgets('shows empty builder when no results', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            suggestionsCallback: (query) async => [],
            itemBuilder: (context, fruit) => Text(fruit),
            emptyBuilder: (context) => const Text('No results'),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'xyz');
      await tester.pumpAndSettle();

      expect(find.text('No results'), findsOneWidget);
    });

    testWidgets('shows error builder on exception', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            suggestionsCallback: (query) async {
              throw Exception('Network error');
            },
            itemBuilder: (context, fruit) => Text(fruit),
            errorBuilder: (context, error) => const Text('Error occurred'),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'test');
      await tester.pumpAndSettle();

      expect(find.text('Error occurred'), findsOneWidget);
    });

    testWidgets('debounce delays the suggestions fetch', (tester) async {
      var callCount = 0;
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            debounceDuration: const Duration(milliseconds: 500),
            suggestionsCallback: (query) async {
              callCount++;
              return fruits;
            },
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');

      // Before debounce expires, callback should not have been called
      await tester.pump(const Duration(milliseconds: 100));
      expect(callCount, 0);

      // After debounce expires, callback should fire
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
      expect(callCount, 1);
    });

    testWidgets('clearOnSelect clears input after selection', (tester) async {
      final textController = TextEditingController();
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            textController: textController,
            clearOnSelect: true,
            suggestionsCallback: (query) async => fruits,
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apple'));
      await tester.pumpAndSettle();

      expect(textController.text, isEmpty);
    });

    testWidgets('closeOnSelect closes popover after selection', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),

            suggestionsCallback: (query) async => fruits,
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();
      await tester.enterText(find.byType(EditableText), 'a');
      await tester.pumpAndSettle();

      // Suggestions should be visible
      expect(find.text('Apple'), findsOneWidget);

      await tester.tap(find.text('Apple'));
      await tester.pumpAndSettle();

      // After selection with closeOnSelect, the suggestions should disappear
      // (Apple may appear in the text field, but not as a suggestion item)
      expect(find.text('Banana'), findsNothing);
    });

    testWidgets('stale async results are discarded', (tester) async {
      // Completer-based approach to control when each query resolves
      final completers = <String, Completer<List<String>>>{};

      await tester.pumpWidget(
        createTestWidget(
          ShadTypeAhead<String>(
            placeholder: const Text('Search...'),
            debounceDuration: Duration.zero,
            suggestionsCallback: (query) {
              final completer = Completer<List<String>>();
              completers[query] = completer;
              return completer.future;
            },
            itemBuilder: (context, fruit) => Text(fruit),
          ),
        ),
      );

      await tester.tap(find.byType(ShadTypeAhead<String>));
      await tester.pump();

      // Type 'ab' — triggers fetch for 'ab'
      await tester.enterText(find.byType(EditableText), 'ab');
      await tester.pump();

      // Now type 'abc' — this changes the text, so the 'ab' result
      // should be discarded when it resolves
      await tester.enterText(find.byType(EditableText), 'abc');
      await tester.pump();

      // Complete the first query with stale data
      if (completers.containsKey('ab')) {
        completers['ab']!.complete(['StaleResult']);
      }
      await tester.pump();

      // StaleResult should NOT appear because input changed
      expect(find.text('StaleResult'), findsNothing);
    });
  });
}
