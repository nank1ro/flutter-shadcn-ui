import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/dialog.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadDialog', () {
    testWidgets('ShadDialog matches goldens', (tester) async {
      await tester.pumpWidget(
        createTestWidget(
          const ShadDialog(
            title: Text('Title'),
            description: Text('Description'),
            child: Text('Child'),
          ),
        ),
      );

      expect(
        find.byType(ShadDialog),
        matchesGoldenFile('goldens/dialog.png'),
      );
    });
  });
}
