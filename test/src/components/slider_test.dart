import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/slider.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSlider', () {
    testWidgets('ShadSlider matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(const ShadSlider(initialValue: 33, max: 100)),
      );

      expect(
        find.byType(ShadSlider),
        matchesGoldenFile('goldens/slider.png'),
      );
    });
  });
}
