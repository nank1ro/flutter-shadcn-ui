import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/toast.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadToast', () {
    testWidgets('ShadToast matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadToast(
            title: Text('Title'),
            description: Text('Description'),
            action: Icon(Icons.create),
            closeIconData: Icons.close,
          ),
        ),
      );

      expect(
        find.byType(ShadToast),
        matchesGoldenFile('goldens/toast.png'),
      );
    });
  });
}
