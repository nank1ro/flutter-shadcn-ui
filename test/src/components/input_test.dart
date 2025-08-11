import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/input.dart';
import 'package:shadcn_ui/src/components/form/fields/input.dart';
import 'package:shadcn_ui/src/components/form/form.dart';
import 'package:shadcn_ui/src/components/form/field.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadInput', () {
    testWidgets('ShadInput matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadInput(placeholder: Text('Email')),
        ),
      );

      expect(
        find.byType(ShadInput),
        matchesGoldenFile('goldens/input.png'),
      );
    });

    testWidgets('ShadInputFormField programmatic error matches goldens',
        (tester) async {
      // Use a GlobalKey to access the field state and call invalidate
      final key =
          GlobalKey<ShadFormBuilderFieldState<ShadInputFormField, String>>();

      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadForm(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ShadInputFormField(
                key: key,
                label: const Text('Email'),
                placeholder: const Text('Email'),
              ),
            ),
          ),
        ),
      );

      // Programmatically set an error on the field
      key.currentState!.invalidate('This field is required');
      await tester.pumpAndSettle();
      // Sanity-check state to catch regressions beyond the golden image.
      expect(key.currentState!.hasError, isTrue);
      expect(key.currentState!.errorText, 'This field is required');
      expect(key.currentState!.isValid, isFalse);
      // Base value has no validator in this test, so valueIsValid should be true.
      expect(key.currentState!.valueIsValid, isTrue);
      expect(
        find.byType(ShadInputFormField),
        matchesGoldenFile('goldens/input_error.png'),
      );
    });
  });
}
