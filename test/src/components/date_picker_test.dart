import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/date_picker.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadDatePicker', () {
    testWidgets('ShadDatePicker matches goldens', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadDatePicker()));

      expect(
        find.byType(ShadDatePicker),
        matchesGoldenFile('goldens/date_picker.png'),
      );
    });
  });
}
