import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSelect', () {
    testWidgets('ShadSelect matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
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
}
