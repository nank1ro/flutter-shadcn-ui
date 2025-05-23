import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/resizable.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadResizable', () {
    testWidgets('ShadResizable matches goldens', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadResizablePanelGroup(
            children: [
              ShadResizablePanel(
                id: 1,
                defaultSize: 0.5,
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text('One'),
                ),
              ),
              ShadResizablePanel(
                id: 2,
                defaultSize: 0.5,
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text('Two'),
                ),
              ),
            ],
          ),
        ),
      );

      expect(
        find.byType(ShadResizablePanelGroup),
        matchesGoldenFile('goldens/resizable.png'),
      );
    });
  });
}
