import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/app.dart';
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
    testWidgets(
        'When popover is initially visible, '
        'pressing the ESC button should close the popover', (tester) async {
      final popoverController = ShadPopoverController(isOpen: true);
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadPopover(
            controller: popoverController,
            popover: (context) {
              return const Text('Popover');
            },
            child: const Text('Title'),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(popoverController.isOpen, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(popoverController.isOpen, isFalse);
    });
    testWidgets(
        'When popover is visible, '
        'pressing the ESC button should close the popover', (tester) async {
      final popoverController = ShadPopoverController();
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadPopover(
            controller: popoverController,
            popover: (context) {
              return const Text('Popover');
            },
            child: ShadButton.outline(
              onPressed: popoverController.toggle,
              child: const Text('Open popover'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byType(ShadButton));
      await tester.pumpAndSettle();
      expect(popoverController.isOpen, isTrue);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle(const Duration(milliseconds: 400));
      expect(popoverController.isOpen, isFalse);
    });
  });
}
