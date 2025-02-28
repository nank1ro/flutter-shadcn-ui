import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/progress.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadProgress', () {
    testWidgets('ShadProgress indeterminate matches goldens', (tester) async {
      await tester.pumpAsyncWidget(createTestWidget(const ShadProgress()));

      expect(
        find.byType(ShadProgress),
        matchesGoldenFile('goldens/progress_indeterminate.png'),
      );
    });

    testWidgets('ShadProgress determinate matches goldens', (tester) async {
      await tester
          .pumpAsyncWidget(createTestWidget(const ShadProgress(value: 0.5)));

      expect(
        find.byType(ShadProgress),
        matchesGoldenFile('goldens/progress_determinate.png'),
      );
    });
  });
}
