import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/slider.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSlider', () {
    testWidgets('ShadSlider matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(const ShadSlider(initialValue: 33, max: 100)),
      );

      expect(
        find.byType(ShadSlider),
        matchesGoldenFile('goldens/slider.png'),
      );
    });
  });
}
