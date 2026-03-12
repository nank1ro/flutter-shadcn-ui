import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/resizable.dart';

void main() {
  // Helper method to create a test widget wrapped in ShadApp and Scaffold
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadResizableController.resize', () {
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
            maxSize: 1,
          ),
        );
      }
      controller.totalAvailableWidth = totalWidth;
      return controller;
    }

    test(
        'forward drag: trailing panel collapses, leading pivot grows into next '
        'trailing panel', () {
      // 3 panels: 0.40, 0.30, 0.30 (totalWidth=200)
      // Drag divider 0|1 by 90px right → delta = 90/200 = 0.45
      // Leading pivot (0) grows, trailing panels shrink.
      final controller =
          buildController(sizes: [0.40, 0.30, 0.30], totalWidth: 200);
      final initialLayout = [0.40, 0.30, 0.30];

      final result = controller.resize(
        delta: 0.45, // 90px / 200px
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.success);
      expect(controller.getPanelInfo(0).size, closeTo(0.85, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.15, 1e-5));
    });

    test(
        'backward drag: leading panel collapses, trailing pivot grows, '
        'no further cascade when no more leading panels', () {
      // 3 panels: 0.25, 0.50, 0.25, totalWidth=100
      // Drag divider 0|1 left 30px → delta = -0.30
      // Trailing pivot (1) grows, leading panels shrink.
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);
      final initialLayout = [0.25, 0.50, 0.25];

      final result = controller.resize(
        delta: -0.30,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.failedLeading);
      expect(controller.getPanelInfo(0).size, closeTo(0.00, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.25, 1e-5));
    });

    test(
        'forward drag: trailing collapses, no further cascade when no more '
        'trailing panels', () {
      // 3 panels: 0.25, 0.50, 0.25, totalWidth=100
      // Drag divider 1|2 right 30px → delta = 0.30
      final controller = buildController(sizes: [0.25, 0.50, 0.25]);
      final initialLayout = [0.25, 0.50, 0.25];

      final result = controller.resize(
        delta: 0.30,
        initialLayout: initialLayout,
        pivotIndices: [1, 2],
      );

      expect(result, ShadResizeResult.failedTrailing);
      expect(controller.getPanelInfo(0).size, closeTo(0.25, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.75, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.00, 1e-5));
    });

    test('cascade stops when all panels in direction are fully collapsed', () {
      // 2 panels: 0.25, 0.75, totalWidth=100
      // Drag divider 0|1 left 50px → delta = -0.50
      final controller = buildController(sizes: [0.25, 0.75]);
      final initialLayout = [0.25, 0.75];

      final result = controller.resize(
        delta: -0.50,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.failedLeading);
      expect(controller.getPanelInfo(0).size, closeTo(0.0, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(1.0, 1e-5));
    });

    test('no-op delta returns initial layout unchanged', () {
      final controller = buildController(sizes: [0.50, 0.50]);
      final initialLayout = [0.50, 0.50];

      final result = controller.resize(
        delta: 0,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.success);
      expect(controller.getPanelInfo(0).size, closeTo(0.50, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.50, 1e-5));
    });

    test('drag reversal returns to original layout', () {
      final controller = buildController(sizes: [0.50, 0.50]);
      final initialLayout = [0.50, 0.50];

      // Drag forward
      controller.resize(
        delta: 0.20,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );
      expect(controller.getPanelInfo(0).size, closeTo(0.70, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.30, 1e-5));

      // Drag back to origin (using same initialLayout, delta=0)
      controller.resize(
        delta: 0,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );
      expect(controller.getPanelInfo(0).size, closeTo(0.50, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.50, 1e-5));
    });

    test('max delta capping: delta exceeding available space is capped', () {
      // 2 panels: 0.50, 0.50, totalWidth=100
      // Delta of 0.80 exceeds what trailing panel can give (0.50).
      final controller = buildController(sizes: [0.50, 0.50]);
      final initialLayout = [0.50, 0.50];

      final result = controller.resize(
        delta: 0.80,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.failedTrailing);
      expect(controller.getPanelInfo(0).size, closeTo(1.0, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.0, 1e-5));
    });

    test('respects minSize constraints on trailing panels', () {
      final controller = ShadResizableController();
      controller.registerPanel(
        ShadPanelInfo(id: 0, defaultSize: 0.50, maxSize: 1),
      );
      controller.registerPanel(
        ShadPanelInfo(id: 1, defaultSize: 0.50, minSize: 0.20, maxSize: 1),
      );
      controller.totalAvailableWidth = 100;
      final initialLayout = [0.50, 0.50];

      final result = controller.resize(
        delta: 0.40,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      expect(result, ShadResizeResult.failedTrailing);
      expect(controller.getPanelInfo(0).size, closeTo(0.80, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.20, 1e-5));
    });

    test('respects maxSize constraints on leading pivot', () {
      final controller = ShadResizableController();
      controller.registerPanel(
        ShadPanelInfo(id: 0, defaultSize: 0.50, maxSize: 0.60),
      );
      controller.registerPanel(
        ShadPanelInfo(id: 1, defaultSize: 0.50, maxSize: 1),
      );
      controller.totalAvailableWidth = 100;
      final initialLayout = [0.50, 0.50];

      final result = controller.resize(
        delta: 0.30,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      // Leading pivot can only grow to 0.60, so only 0.10 consumed.
      expect(result, ShadResizeResult.failedTrailing);
      expect(controller.getPanelInfo(0).size, closeTo(0.60, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.40, 1e-5));
    });

    test('Phase 3 overflow: pivot at max cascades to adjacent panels', () {
      // 3 panels, leading pivot maxSize=0.40
      final controller = ShadResizableController();
      controller.registerPanel(
        ShadPanelInfo(id: 0, defaultSize: 0.20, maxSize: 1),
      );
      controller.registerPanel(
        ShadPanelInfo(id: 1, defaultSize: 0.40, maxSize: 0.40),
      );
      controller.registerPanel(
        ShadPanelInfo(id: 2, defaultSize: 0.40, maxSize: 1),
      );
      controller.totalAvailableWidth = 100;
      final initialLayout = [0.20, 0.40, 0.40];

      // Drag divider 1|2 right by 0.30 → pivot(1) already at max 0.40.
      // Phase 2 grows pivot by 0.0, overflow 0.30 cascades to panel 0.
      final result = controller.resize(
        delta: 0.30,
        initialLayout: initialLayout,
        pivotIndices: [1, 2],
      );

      expect(result, ShadResizeResult.success);
      expect(controller.getPanelInfo(0).size, closeTo(0.50, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.40, 1e-5));
      expect(controller.getPanelInfo(2).size, closeTo(0.10, 1e-5));
    });

    test('all panels at minSize: backward drag is a no-op', () {
      final controller = ShadResizableController();
      controller.registerPanel(
        ShadPanelInfo(id: 0, defaultSize: 0.20, minSize: 0.20, maxSize: 1),
      );
      controller.registerPanel(
        ShadPanelInfo(id: 1, defaultSize: 0.80, maxSize: 1),
      );
      controller.totalAvailableWidth = 100;
      final initialLayout = [0.20, 0.80];

      final result = controller.resize(
        delta: -0.10,
        initialLayout: initialLayout,
        pivotIndices: [0, 1],
      );

      // Panel 0 can't shrink below 0.20, so nothing happens.
      expect(result, ShadResizeResult.failedLeading);
      expect(controller.getPanelInfo(0).size, closeTo(0.20, 1e-5));
      expect(controller.getPanelInfo(1).size, closeTo(0.80, 1e-5));
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

    testWidgets('drag start → update → verify layout changes', (tester) async {
      final controller = ShadResizableController();

      await tester.pumpWidget(
        createTestWidget(
          ShadResizablePanelGroup(
            controller: controller,
            children: const [
              ShadResizablePanel(
                id: 1,
                defaultSize: 0.5,
                child: Text('One'),
              ),
              ShadResizablePanel(
                id: 2,
                defaultSize: 0.5,
                child: Text('Two'),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the GestureDetector for the divider
      final gesture = find.byType(GestureDetector);
      expect(gesture, findsWidgets);

      // Simulate a horizontal drag on the divider
      final dividerFinder = gesture.last;
      final dividerCenter = tester.getCenter(dividerFinder);

      await tester.timedDragFrom(
        dividerCenter,
        const Offset(50, 0),
        const Duration(milliseconds: 300),
      );
      await tester.pumpAndSettle();

      // After dragging right, panel 0 should be larger and panel 1 smaller
      expect(controller.getPanelInfo(0).size,
          greaterThan(controller.getPanelInfo(1).size));
    });
  });
}
