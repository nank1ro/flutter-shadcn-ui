import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadSheet', () {
    testWidgets('ShadSheet matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadSheetInheritedWidget(
            side: ShadSheetSide.right,
            child: ShadSheet(
              title: Text('Title'),
              description: Text('Description'),
              actions: [
                ShadIconButton(icon: Icon(Icons.cloud_off)),
              ],
              child: Text('Child'),
            ),
          ),
        ),
      );

      expect(
        find.byType(ShadSheet),
        matchesGoldenFile('goldens/sheet.png'),
      );
      await tester.pumpAndSettle();
    });
  });
}
