import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/time_picker.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadTimePicker', () {
    testWidgets('ShadTimePicker matches goldens', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadTimePicker()));

      expect(
        find.byType(ShadTimePicker),
        matchesGoldenFile('goldens/time_picker.png'),
      );
    });
  });
}
