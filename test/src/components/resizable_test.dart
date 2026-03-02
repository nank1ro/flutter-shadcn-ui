import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/resizable.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadResizableController cascade resize', () {
    ShadResizableController buildController({
      required List<double> sizes,
      double totalWidth = 100,
    }) {
      final controller = ShadResizableController();
      for (var i = 0; i < sizes.length; i++) {
        controller.registerPanel(
          ShadPanelInfo(
            id: i,
            defaultSize: sizes[i],
            minSize: 0,
            maxSize: 1.0,
          ),
        );
      }
      controller.totalAvailableWidth = totalWidth;
      return controller;
    }

    test(
        'cascade forward: leading panel collapses and remaining delta continues '
        'to next pair', () {
      // 3 panels: A=0.25, B=0.50, C=0.25
      // Drag divider 0 left by 30px → A collapses (used 25px), B shrinks by
      // remaining 5px, C grows.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      // Simulate what onHandleDrag does with cascade logic.
      // Step 1: try full delta on pair (A, B)
      var remainingOffset = -30.0;
      var leadingIndex = 0;

      final a = controller.getPanelInfo(0);
      final desiredA =
          (a.size * controller.totalAvailableWidth + remainingOffset) /
          controller.totalAvailableWidth;
      var result = controller.resize(index: leadingIndex, size: desiredA);
      expect(result, ShadResizeResult.failedLeading);
      expect(desiredA < a.minSize, isTrue);

      // Step 2: clamp A to minSize, get remaining offset
      final actualDelta = (a.minSize - a.size) * controller.totalAvailableWidth;
      result =
          controller.resize(index: leadingIndex, size: a.minSize);
      expect(result, ShadResizeResult.success);
      remainingOffset = remainingOffset - actualDelta;
      leadingIndex++;

      // Step 3: apply remaining offset to pair (B, C)
      final b = controller.getPanelInfo(1);
      final desiredB =
          (b.size * controller.totalAvailableWidth + remainingOffset) /
          controller.totalAvailableWidth;
      result = controller.resize(index: leadingIndex, size: desiredB);
      expect(result, ShadResizeResult.success);

      expect(controller.getPanelInfo(0).size, closeTo(0.0, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.70, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.30, 1e-5));
    });

    test(
        'cascade backward: trailing panel collapses and remaining delta '
        'continues to previous pair', () {
      // 3 panels: A=0.25, B=0.50, C=0.25
      // Drag divider 1 right by 30px → C collapses (used 25px), A grows by
      // remaining 5px, B shrinks.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);

      var remainingOffset = 30.0;
      var leadingIndex = 1;

      final b = controller.getPanelInfo(1);
      final desiredB =
          (b.size * controller.totalAvailableWidth + remainingOffset) /
          controller.totalAvailableWidth;
      var result = controller.resize(index: leadingIndex, size: desiredB);
      expect(result, ShadResizeResult.failedTrailing);

      final c = controller.getPanelInfo(2);
      final actualTrailingDelta =
          (c.size - c.minSize) * controller.totalAvailableWidth;
      final newBSize = (b.size * controller.totalAvailableWidth +
              actualTrailingDelta) /
          controller.totalAvailableWidth;
      result = controller.resize(index: leadingIndex, size: newBSize);
      expect(result, ShadResizeResult.success);
      remainingOffset = remainingOffset - actualTrailingDelta;
      leadingIndex--;

      // Apply remaining offset to pair (A, B)
      final a = controller.getPanelInfo(0);
      final desiredA =
          (a.size * controller.totalAvailableWidth + remainingOffset) /
          controller.totalAvailableWidth;
      result = controller.resize(index: leadingIndex, size: desiredA);
      expect(result, ShadResizeResult.success);

      expect(controller.getPanelInfo(0).size, closeTo(0.30, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.70, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.0, 1e-5));
    });

    test('cascade stops when all panels in direction are fully collapsed', () {
      // 2 panels: A=0.25, B=0.75
      // Drag divider 0 left by 50px → A collapses (uses 25px), remaining
      // 25px cannot cascade further (no panel before A).
      final controller = buildController(sizes: [0.25, 0.75]);

      var remainingOffset = -50.0;
      const leadingIndex = 0;

      final a = controller.getPanelInfo(0);
      final desiredA =
          (a.size * controller.totalAvailableWidth + remainingOffset) /
          controller.totalAvailableWidth;
      var result = controller.resize(index: leadingIndex, size: desiredA);
      expect(result, ShadResizeResult.failedLeading);

      final actualDelta =
          (a.minSize - a.size) * controller.totalAvailableWidth;
      result = controller.resize(index: leadingIndex, size: a.minSize);
      expect(result, ShadResizeResult.success);
      remainingOffset = remainingOffset - actualDelta;

      // leadingIndex++ would be 1 which is out of range (panelsInfo.length - 1
      // = 1), so cascade should stop.
      expect(1 >= controller.panelsInfo.length - 1, isTrue);

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
