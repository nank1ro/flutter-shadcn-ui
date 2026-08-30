import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/input.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadInput', () {
    testWidgets('publishes enabled state on the editable semantics node', (
      tester,
    ) async {
      final semanticsHandle = tester.ensureSemantics();
      try {
        await tester.pumpWidget(createTestWidget(const ShadInput()));
        final enabledData = tester
            .getSemantics(find.byType(EditableText))
            .getSemanticsData();
        expect(
          enabledData.flagsCollection.isEnabled.toBoolOrNull(),
          isTrue,
        );

        await tester.pumpWidget(
          createTestWidget(const ShadInput(enabled: false)),
        );
        final disabledData = tester
            .getSemantics(find.byType(EditableText))
            .getSemanticsData();
        expect(
          disabledData.flagsCollection.isEnabled.toBoolOrNull(),
          isFalse,
        );
      } finally {
        semanticsHandle.dispose();
      }
    });

    testWidgets('ShadInput matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadInput(placeholder: Text('Email')),
        ),
      );

      expect(
        find.byType(ShadInput),
        matchesGoldenFile('goldens/input.png'),
      );
    });
  });
}
