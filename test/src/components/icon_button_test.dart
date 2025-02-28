import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/icon_button.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadIconButton', () {
    testWidgets('ShadIconButton matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadIconButton(
            icon: Icon(Icons.add),
          ),
        ),
      );

      expect(
        find.byType(ShadIconButton),
        matchesGoldenFile('goldens/icon_button.png'),
      );
    });

    testWidgets('ShadIconButton.destructive matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadIconButton.destructive(
            icon: Icon(Icons.add),
          ),
        ),
      );

      expect(
        find.byType(ShadIconButton),
        matchesGoldenFile('goldens/icon_button_destructive.png'),
      );
    });

    testWidgets('ShadIconButton.outline matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadIconButton.outline(
            icon: Icon(Icons.add),
          ),
        ),
      );

      expect(
        find.byType(ShadIconButton),
        matchesGoldenFile('goldens/icon_button_outline.png'),
      );
    });
    testWidgets('ShadIconButton.secondary matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadIconButton.secondary(
            icon: Icon(Icons.add),
          ),
        ),
      );

      expect(
        find.byType(ShadIconButton),
        matchesGoldenFile('goldens/icon_button_secondary.png'),
      );
    });

    testWidgets('ShadIconButton.ghost matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadIconButton.ghost(
            icon: Icon(Icons.add),
          ),
        ),
      );

      expect(
        find.byType(ShadIconButton),
        matchesGoldenFile('goldens/icon_button_ghost.png'),
      );
    });
  });
}
