import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/switch.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSwitch', () {
    testWidgets('ShadSwitch true matches goldens', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadSwitch(value: true)));

      expect(
        find.byType(ShadSwitch),
        matchesGoldenFile('goldens/switch_on.png'),
      );
    });

    testWidgets('ShadSwitch false matches goldens', (tester) async {
      await tester.pumpWidget(createTestWidget(const ShadSwitch(value: false)));

      expect(
        find.byType(ShadSwitch),
        matchesGoldenFile('goldens/switch_off.png'),
      );
    });
  });
}
