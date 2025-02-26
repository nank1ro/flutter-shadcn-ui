import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/date_picker.dart';
import 'package:shadcn_ui/src/components/popover.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadPopover', () {
    testWidgets('ShadPopover matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadPopover(
            visible: true,
            popover: (context) {
              return const Text('Popover');
            },
            child: const Text('Child'),
          ),
        ),
      );

      expect(
        find.byType(ShadPopover),
        matchesGoldenFile('goldens/popover.png'),
      );
    });
  });
}
