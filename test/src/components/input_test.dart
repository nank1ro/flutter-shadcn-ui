import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/input.dart';

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
  });
}
