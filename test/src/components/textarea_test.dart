import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/textarea.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadTextarea', () {
    testWidgets('ShadTextarea matches golden', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadTextarea(
            placeholder: Text('Enter your message'),
          ),
        ),
      );

      expect(
        find.byType(ShadTextarea),
        matchesGoldenFile('goldens/textarea.png'),
      );
    });
  });
}
