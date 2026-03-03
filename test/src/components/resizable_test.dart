import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/resizable.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadResizableController.cascadeResize', () {
    ShadResizableController buildController({
      required List<double> sizes,
      double totalWidth = 100,
      double minSize = 0,
    }) {
      final controller = ShadResizableController();
      for (var i = 0; i < sizes.length; i++) {
        controller.registerPanel(
          ShadPanelInfo(
            id: i,
            defaultSize: sizes[i],
            minSize: minSize,
            maxSize: 1.0,
          ),
        );
      }
      controller.totalAvailableWidth = totalWidth;
      return controller;
    }

    test(
        'forward drag: trailing panel collapses, anchor grows into next '
        'trailing panel', () {
      // 3 panels: Two=0.40, Three=0.30, Four=0.30 (totalSize=200)
      // Drag Two|Three divider 90px down → Two grows, Three collapses (60px),
      // Four gives remaining 30px.
      final controller =
          buildController(sizes: [0.40, 0.30, 0.30], totalWidth: 200);

      final result =
          controller.cascadeResize(index: 0, axisOffset: 90);

      expect(result, ShadResizeResult.success);
      expect(controller.getPanelInfo(0).size, closeTo(0.85, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.15, 1e-5));
    });

    test(
        'backward drag: leading panel collapses, anchor grows, '
        'no further cascade when no more leading panels', () {
      // 3 panels: A=0.25, B=0.50, C=0.25, totalWidth=100
      // Drag A|B left 30px → B grows, A collapses (25px), 5px unconsumed.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      final result =
          controller.cascadeResize(index: 0, axisOffset: -30);

      expect(result, ShadResizeResult.failedLeading);
      expect(controller.getPanelInfo(0).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.25, 1e-5));
    });

    test(
        'forward drag: trailing collapses, no further cascade when no more '
        'trailing panels', () {
      // 3 panels: A=0.25, B=0.50, C=0.25, totalWidth=100
      // Drag B|C right 30px → B grows, C collapses (25px), 5px unconsumed.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      final result =
          controller.cascadeResize(index: 1, axisOffset: 30);

      expect(result, ShadResizeResult.failedTrailing);
      expect(controller.getPanelInfo(0).size, closeTo(0.25, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.00, 1e-5));
    });

    test('cascade stops when all panels in direction are fully collapsed', () {
      // 2 panels: A=0.25, B=0.75, totalWidth=100
      // Drag A|B left 50px → B grows, A collapses (25px), 25px unconsumed.
      final controller = buildController(sizes: [0.25, 0.75]);

      final result =
          controller.cascadeResize(index: 0, axisOffset: -50);

      expect(result, ShadResizeResult.failedLeading);
      expect(controller.getPanelInfo(0).size, closeTo(0.0, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(1.0, 1e-5));
    });
  });

  group('ShadResizable', () {
    testWidgets('ShadResizable matches goldens', (tester) async {
      await tester.pumpWidget(
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
